# TextRich

A composite rich text component.

## Getting Started

### Screenshot

<img src="https://github.com/laoeg/TextRich/blob/main/img.png" alt="drawing" width="200"/>

### Code

```aidl
TextRich(
  "TextRich example app",
  matchTexts: const ["exa"],
  matchStyles: const [TextStyle(color: Colors.red)],
),
TextRich(
  "TextRich example app",
  matchTexts: const ["exa", "a"],
  matchStyles: const [TextStyle(color: Colors.red)],
),
TextRich(
  "TextRich example app",
  matchTexts: const ["exa", "a"],
  matchStyles: const [TextStyle(color: Colors.red), TextStyle(color: Colors.blue)],
),
TextRich(
  "TextRich example app",
  matchTexts: const ["exa", "a"],
  matchStyles: const [TextStyle(color: Colors.red,fontStyle: FontStyle.italic,fontSize: 30,decoration: TextDecoration.underline), TextStyle(color: Colors.blue)],
  onTap: (value){
    print('Tap value :$value');
  },
  style: const TextStyle(color: Colors.black,fontSize: 16),
),
```