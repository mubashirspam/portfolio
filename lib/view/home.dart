import 'package:flutter/material.dart';
import 'section/section.dart';
import 'widgets/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            PortfolioHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const .symmetric(horizontal: 24, vertical: 40),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: const Column(
                      crossAxisAlignment: .start,
                      children: [
                        ProfileSection(),
                        SizedBox(height: 40),
                        BioSection(),
                        SizedBox(height: 60),
                        ProjectsSection(),
                        QuoteSection(),
                        RolesSection(),
                        ContactSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
