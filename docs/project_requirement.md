# Flutter Mini Calculator App

## Requirement
Develop a mini calculator app in Flutter with functionalities for addition, subtraction, multiplication, and division, using text fields and buttons.

---

## Detailed Requirement List

### i) Functional Requirements:
1. **Basic Arithmetic Operations:** Support addition (+), subtraction (-), multiplication (×), and division (÷).
2. **User Input Handling:** Two text fields to accept numeric input.
3. **Calculate & Display Results:** Display the result dynamically upon button press.
4. **Error Handling:** Display error messages for division by zero and handle empty or invalid inputs.
5. **Reset Functionality (Optional):** Clear input fields and result area with a reset button.

### ii) Non-Functional Requirements:
1. **User-Friendly UI:** Well-aligned buttons, text fields, and results display.
2. **Responsive Design:** Ensure proper layout on different screen sizes.
3. **Performance Optimization:** Ensure calculations run instantly.
4. **Code Maintainability:** Clean and well-structured code following best practices.

### iii) UI/UX Requirements:
1. **Layout of Components:**
   - Two Text Field widgets for input
   - Four Elevated Button widgets for operations
   - One Text widget to display the result
   - One Elevated Button for reset/clear (optional)
2. **Styling:** Use `Container`, `Column`, `Row`, padding, and spacing for better UI.
3. **Dark Mode (Optional):** Implement dark theme support for better accessibility.

---

## 1-Week Step-by-Step Plan to Achieve All Requirements

### Day 1: Project Setup & UI Layout (High Priority)
1. Install Flutter and set up the development environment.
2. Create a new Flutter project and configure dependencies.
3. Build the basic UI layout:
   - Add two Text Field widgets for number inputs.
   - Add four operation buttons (+, -, ×, ÷).
   - Add a Text widget to display the result.
4. Implement a basic Stateful Widget structure for state management.
5. Follow clean code principles:
   - Use meaningful variable and function names.
   - Keep UI and logic separate.
   - Write modular code to avoid redundant logic.

### Day 2: Implement Core Functionalities (High Priority)
1. Read and parse numeric input from Text Field widgets.
2. Implement the calculation logic for all four operations.
3. Display the computed result dynamically in the Text widget.
4. Ensure calculations update instantly when the user presses a button.
5. Apply clean code principles:
   - Separate calculation logic into a dedicated function.
   - Keep functions short and focused.
   - Avoid unnecessary variables and inline logic.

### Day 3: Input Validation & Error Handling
1. Prevent non-numeric input entry (validate inputs).
2. Handle division by zero or integer overflow with an appropriate error message.
3. Ensure both fields are filled before calculation.
4. Implement a `try-catch` block to handle unexpected errors gracefully.
5. Refactor code for better readability and maintainability.

### Day 4: UI/UX Enhancements & Styling
1. Improve layout alignment using `Row`, `Column`, and `SizedBox` for spacing.
2. Add `Container` styling (borders, padding, and background color).
3. Use theming and color schemes for a clean and attractive UI.
4. Ensure responsiveness across different screen sizes.
5. Apply clean code principles:
   - Separate UI components into reusable widgets if needed.
   - Keep widget tree readable by breaking down complex structures.

### Day 5: Testing & Debugging
1. Test the calculator with valid and invalid inputs.
2. Debug and fix any logic or UI-related bugs.
3. Ensure that the app works without crashing under different scenarios.
4. Test on multiple devices (real and emulator).
5. Optimize redundant code and improve readability.

### Day 6: Additional Features & Optimizations
1. Add a reset/clear button to clear inputs and results.
2. Improve code structure: refactor functions for readability and maintain clean code principles.
3. Implement dark mode support (optional but useful feature).
4. Ensure the code follows clean code principles by:
   - Removing unnecessary comments and unused code.
   - Ensuring each function has a single responsibility.
   - Keeping logic separate from UI components.

### Day 7: Final Review & Deployment
1. Final testing to ensure a bug-free experience.
2. Generate an APK file for testing and sharing.
3. Upload project code to GitHub for version control.
4. Document project setup and usage instructions.

---

## Summary of Priorities:
- **Days 1-3 (High Priority):** Ensure the app is functional.
- **Days 4-5 (Medium Priority):** Enhance UI/UX and fix bugs.
- **Days 6-7 (Low Priority):** Add extra features and prepare for sharing.