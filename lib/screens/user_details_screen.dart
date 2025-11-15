import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/skill_chip.dart';
import '../widgets/input_field.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController _collegeOrCompany = TextEditingController();
  final TextEditingController _skillInput = TextEditingController();
  final TextEditingController _aspiredSkillInput = TextEditingController();
  final TextEditingController _linkedin = TextEditingController();
  final TextEditingController _leetcode = TextEditingController();
  final TextEditingController _github = TextEditingController();

  List<String> currentSkills = ['software testing', 'Selenium'];
  List<String> aspiredSkills = ['Product Management', 'GTM'];

  String status = 'Student';

  void addSkill(String skill, List<String> list) {
    final s = skill.trim();
    if (s.isEmpty) return;
    if (list.length >= 10) return;
    if (!list.contains(s)) {
      setState(() {
        list.add(s);
      });
    }
  }

  void removeSkill(String skill, List<String> list) {
    setState(() {
      list.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('User details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Category', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBg,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.inputBorder),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Select up to 2 categories', style: TextStyle(color: AppColors.mutedText)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text('Status', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Student',
                              groupValue: status,
                              onChanged: (v) => setState(() => status = v!),
                            ),
                            const Text('Student'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Working Professional',
                              groupValue: status,
                              onChanged: (v) => setState(() => status = v!),
                            ),
                            const Expanded(child: Text('Working Professional')),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  InputField(
                    label: status == 'Student' ? 'College' : "Company's Name",
                    hint: status == 'Student' ? 'College' : "Company's Name",
                    controller: _collegeOrCompany,
                  ),

                  const SizedBox(height: 18),

                  const Text('Skills and Focus', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 10),

                  const Text('Current skills', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),

                  Wrap(
                    children: currentSkills
                        .map((s) => SkillChip(label: s, onRemove: () => removeSkill(s, currentSkills)))
                        .toList(),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _skillInput,
                          decoration: InputDecoration(
                            hintText: 'Type to add skills..',
                            filled: true,
                            fillColor: AppColors.cardBg,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: AppColors.inputBorder),
                            ),
                          ),
                          onSubmitted: (value) {
                            addSkill(value, currentSkills);
                            _skillInput.clear();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          addSkill(_skillInput.text, currentSkills);
                          _skillInput.clear();
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  const Text('Aspired skills', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),

                  Wrap(
                    children: aspiredSkills
                        .map((s) => SkillChip(label: s, onRemove: () => removeSkill(s, aspiredSkills)))
                        .toList(),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _aspiredSkillInput,
                          decoration: InputDecoration(
                            hintText: 'Type to add skills..',
                            filled: true,
                            fillColor: AppColors.cardBg,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: AppColors.inputBorder),
                            ),
                          ),
                          onSubmitted: (value) {
                            addSkill(value, aspiredSkills);
                            _aspiredSkillInput.clear();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          addSkill(_aspiredSkillInput.text, aspiredSkills);
                          _aspiredSkillInput.clear();
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  const Text('Profile links', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 10),

                  InputField(label: 'LinkedIn *', hint: 'https://linkedin.com/in/username', controller: _linkedin),
                  const SizedBox(height: 12),

                  InputField(label: 'Leetcode', hint: 'https://leetcode.com/username', controller: _leetcode),
                  const SizedBox(height: 12),

                  InputField(label: 'Github', hint: 'https://github.com/username', controller: _github),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/profile',
                          arguments: {
                            'name': 'Nikhil Ahuja',
                            'email': 'nikhilahuja@gmail.com',
                            'phone': '+91 6396248468',
                            'category': 'Software Developer',
                            'status': status,
                            'company': _collegeOrCompany.text,
                            'currentSkills': currentSkills,
                            'aspiredSkills': aspiredSkills,
                            'linkedin': _linkedin.text,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Submit', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),
            SizedBox(height: 6, width: width * 0.5),
          ],
        ),
      ),
    );
  }
}
