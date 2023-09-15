# Stax

Stax is a mobile budgeting application built for Android and iOS. It is simple to use and allows you to track income and expenses with ease. Most importantly, I intend to release this for free.

## Design

I'm not very good at budgeting, and I've used many applications to attempt to remedy this issue. I have enjoyed aspects of these apps, so accompanied with some true budgeting knowledge, and wanted to make a really easy app to budget with. I identified several user-related issues with apps that I have had in the past which led me to give up use of it. This includes:
- Using recurring values incorrectly (i.e. paychecks).
- Confusing UI.

With that in mind, I drew out wireframes for what I'd want in such an app:

![Frames](https://github.com/CaseyNguyen/Stax/assets/83699098/7ac9766a-1ccf-4fe7-974e-b51c2b8e69b5)

Then, I wanted to select a color palette that would make it clear what each piece of information meant. I used Coolors, a neat tool for generating five-color palettes.

![image](https://github.com/CaseyNguyen/Stax/assets/83699098/f7a3f780-0289-476f-9081-b45c360447fd)

## Application

In the first build, I wanted to have a basic interface. I used the 'percent_indicator' library to create a small visualization of what your balance is. I decided to split the dashboard between the data visualizer interface and list format so as to prevent endless scrolling of the list without seeing the visualizer.

![image](https://github.com/CaseyNguyen/Stax/assets/83699098/fdc0120b-d388-4a17-bcaf-25cc62ccb7a5) ![image](https://github.com/CaseyNguyen/Stax/assets/83699098/40545894-e7f2-4fad-a896-7a4a1dee248a)

I also created a simple transaction submission form. I realized it might be easier to just refuse invalid doubles for money, so I used regex to validate that cash values were, in fact, cash values.

![image](https://github.com/CaseyNguyen/Stax/assets/83699098/4d106c48-2a1b-4a53-9bbe-789de95bd8f4)

Support for tags is currently the next step.
