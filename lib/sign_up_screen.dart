import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dobController =
      TextEditingController(); // Date of birth controller

  static String _selectedGender = 'male';
  DateTime? _selectedDate;
  String? _selectedCountry;
  String? _selectedProvince;
  final List<String> _provinceItems = [
    'Northern Province',
    'Southern Province',
    'Eastern Province',
    'Western Province',
    'Kigali City'
  ];
  final List<String> _countryItems = [
    'Rwanda',
    'Burundi',
    'Tanzania',
    'Uganda',
    'Kenya',
    'DRC'
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // process data
      String email = _emailController.text;
      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;

      // Handle the sign-in logic
      // print('Email: $email');
      // print('Email: $password');
      // print(password == confirmPassword);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please Enter a valid email address';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 16.0,
              ),

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == _passwordController.text || value!.isEmpty) {
                    return 'Passwords don\'t match';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 20.0,
              ),
              //
              //
              FormField(
                builder: (FormFieldState<String> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender'),
                      Row(
                        children: [
                          Radio(
                              value: 'male',
                              groupValue: _selectedGender,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              }),
                          const Text('Male'),
                          //
                          //
                          Radio(
                              value: 'female',
                              groupValue: _selectedGender,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              }),
                          const Text('Female'),
                        ],
                      ),
                      state.hasError
                          ? Text(
                              state.errorText ?? '',
                              style: TextStyle(color: Colors.redAccent),
                            )
                          : Container(),
                    ],
                  );
                },
                validator: (value) {
                  if (_selectedGender.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
              //
              //
              const SizedBox(
                height: 20.0,
              ),
              //
              //
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(
                  labelText: 'Date of birth',
                  hintText: 'yyyy-mm-dd',
                ),
                readOnly: false,
                onTap: () {
                  _selectDate(context);
                },
              ),

              const SizedBox(
                height: 20,
              ),

              // country
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select country'),
                value: _selectedCountry,
                items: _countryItems.map((String country) {
                  return DropdownMenuItem<String>(
                      value: country, child: Text(country));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select option';
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),

              // Province
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select province'),
                value: _selectedProvince,
                items: _provinceItems.map((String province) {
                  return DropdownMenuItem<String>(
                      value: province, child: Text(province));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedProvince = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 30,
              ),

              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Sign Up'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
