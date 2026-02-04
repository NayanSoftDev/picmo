import 'package:flutter/material.dart';
import '../models/account_model.dart';

class AccountInfoCard extends StatefulWidget {
  final AccountModel account;

  const AccountInfoCard({
    super.key,
    required this.account,
  });

  @override
  State<AccountInfoCard> createState() => _AccountInfoCardState();
}

class _AccountInfoCardState extends State<AccountInfoCard> {
  late TextEditingController _nameController;
  late TextEditingController _titleController;
  late TextEditingController _accountController;
  late TextEditingController _picmoIdController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.account.name);
    _titleController = TextEditingController(text: widget.account.title);
    _accountController = TextEditingController(text: widget.account.account);
    _picmoIdController = TextEditingController(text: widget.account.picmoId);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(255, 255, 255, 0.07),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            _buildInfoRow('Name', _nameController),
            _buildInfoRow('Title', _titleController),
            _buildInfoRow('Account', _accountController),
            _buildInfoRow('Picmo ID', _picmoIdController, isLast: true),
            const SizedBox(height: 12),
            if (_isEditing) _buildEditButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    TextEditingController controller, {
    bool isLast = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (!_isEditing) {
          setState(() {
            _isEditing = true;
          });
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // ⭐ ADD
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LABEL LEFT
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                  ),
                ),

                // TEXTFIELD RIGHT (fixed width for nice alignment)
                SizedBox(
                  width: 180, // ⭐ adjust as needed
                  child: TextFormField(
                    controller: controller,
                    enabled: _isEditing,
                    textAlign: TextAlign.right, // ⭐ TEXT RIGHT SIDE
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: _isEditing
                          ? const UnderlineInputBorder()
                          : InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!isLast)
            const Divider(
              height: 1,
              thickness: 1,
              color: Color.fromRGBO(255, 255, 255, 0.2),
            ),
        ],
      ),
    );
  }

  Widget _buildEditButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // CANCEL
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            setState(() {
              _isEditing = false;
              _nameController.text = widget.account.name;
              _titleController.text = widget.account.title;
              _accountController.text = widget.account.account;
              _picmoIdController.text = widget.account.picmoId;
            });
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),

        const SizedBox(width: 8),

        // SAVE
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: () {
            setState(() {
              _isEditing = false;
            });
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
