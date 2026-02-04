import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/features/feedback_and_help/controller/contact_controller.dart';
import '../widgets/custom_text_field.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  final List<String> _questionTypes = const [
    'Video Generation',
    'Membership % Points',
    'User Experience',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(ContactController());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 0, 32),
        appBar: AppBar(
          title: const Text(
            'Feedback & Help',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: GetBuilder<ContactController>(
            builder: (controller) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Question Type'),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 36, 34, 34)),
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color.fromARGB(255, 30, 29, 35),
                      ),
                      child: Obx(
                        () => Column(
                          children:
                              List.generate(_questionTypes.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                controller.toggleCheckbox(
                                    index, !controller.checkboxes[index]);
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: controller.checkboxes[index],
                                      onChanged: (bool? value) {
                                        controller.toggleCheckbox(index, value);
                                      },
                                      shape: const CircleBorder(),
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _questionTypes[index],
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Write Message'),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: controller.messageController,
                      labelText:
                          'Please describe any product issue or suggestons',
                      hintText: 'Type your message here...',
                      maxLines: 4,
                      fillColor: const Color.fromARGB(255, 30, 29, 35),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${controller.characterCount} / 2000',
                      style: TextStyle(
                        color: controller.isMessageValid
                            ? Colors.white70
                            : Colors.red,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSectionHeader('Your Contact (Optional)'),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: controller.contactController,
                      labelText:
                          'Please leave your number or email for contact ',
                      hintText: 'Please leave your number or email for contact',
                      maxLines: 2,
                      keyboardType: TextInputType.emailAddress,
                      fillColor: const Color.fromARGB(255, 30, 29, 35),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 198, 255, 1),
                            Color.fromRGBO(85, 43, 255, 1),
                            Color.fromRGBO(208, 0, 255, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                        onPressed: controller.isSubmitting
                            ? null
                            : controller.submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: controller.isSubmitting
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
