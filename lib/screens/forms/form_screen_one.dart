import 'package:flutter/material.dart';

import '../../theme.dart';

class FormScreenOne extends StatefulWidget {
  const FormScreenOne({super.key});

  @override
  State<FormScreenOne> createState() => _FormScreenOne();
}

class _FormScreenOne extends State<FormScreenOne> {
  final _formKey = GlobalKey<FormState>();

  //final InpuDe

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: formScreenOneTheme,
      child: Scaffold(
        body: SafeArea(
          child: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 30,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Input Form",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Full Name',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: TextFormField(
                            style: Theme.of(context).textTheme.titleLarge,
                            decoration: InputDecoration(
                              hintText: "first name",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.grey.shade400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            style: Theme.of(context).textTheme.titleLarge,
                            decoration: InputDecoration(
                              hintText: "last name",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.grey.shade400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Location',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: DropdownButtonFormField(
                        items: [],
                        onChanged: (value) {},
                        hint: Text(
                          "Location",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey.shade400),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.location_on)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Company Information',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(
                        hintText: "Company Name",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.info_outline_rounded),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Describe your case',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.titleLarge,
                      minLines: 5,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Tell us about use case...",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 9,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Phone Number',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
