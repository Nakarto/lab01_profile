# Lab L1 · About me — 67113514 นายพัฒน์ธนิน ปลอดขาว

## สภาพแวดล้อม
- Flutter 3.50.0 (stable), Dart 3.14.0, Windows 11
- `flutter doctor`: No issues found (Flutter + Android toolchain ผ่าน) → ภาพ S1
- อุปกรณ์ทดสอบ: Android Emulator `Lab_Pixel` (Pixel 7, Android 16 / API 36, x86_64)

## ผลการทดลอง hot reload (r) กับ hot restart (R)

| การทดลอง | ขั้นตอน | ผลที่ได้ | เวลา (จาก log) |
|---|---|---|---|
| Hot reload `r` | กด Like 3 ครั้ง (Likes: 3) → แก้ข้อความปุ่มจาก `Like` เป็น `Like!` → กด `r` | ปุ่มเปลี่ยนเป็น `Like!` ทันที และ **Likes ยังเป็น 3** (state ถูกเก็บไว้) | `Reloaded 1 of 1051 libraries in 324ms` |
| Hot restart `R` | แก้ข้อความกลับเป็น `Like` → กด `R` | แอปเริ่มใหม่ ปุ่มเป็น `Like` และ **Likes กลับเป็น 0** (state ถูกรีเซ็ต) | `Restarted application in 1,785ms` |

## สรุปความแตกต่าง
- **Hot reload (r)**: inject โค้ดที่แก้ไขเข้า Dart VM ที่กำลังรันอยู่ แล้ว rebuild widget tree ใหม่ โดย **คง state เดิม** ไว้ (เช่น `_likes`) เร็วมาก (~0.3 วินาที) เหมาะกับการแก้ UI
- **Hot restart (R)**: โหลดโค้ดใหม่ทั้งหมดและรันแอปตั้งแต่ `main()` ใหม่ **state หายทั้งหมด** ช้ากว่า (~1.8 วินาที) แต่ยังเร็วกว่า build ใหม่ทั้งแอป ใช้เมื่อแก้ `main()`, ค่าเริ่มต้นของ state, global/static variables หรือเมื่อ hot reload ไม่สะท้อนการเปลี่ยนแปลง
- ทั้งสองแบบไม่ต้อง build APK ใหม่ (ต่างจาก full restart/`flutter run` ใหม่ ที่ต้อง build ผ่าน Gradle)

## StatelessWidget vs StatefulWidget และ setState
- `HomePage` เดิมเป็น `StatelessWidget` แสดงข้อมูลคงที่ (รหัสใน AppBar, ไอคอน, ชื่อจริง)
- เปลี่ยนเป็น `StatefulWidget` + `_HomePageState` ที่มีตัวแปร `int _likes = 0`
- ปุ่ม Like เรียก `_like()` ซึ่งทำ `setState(() { _likes++; })` เพื่อบอก framework ว่า state เปลี่ยน → `build()` ถูกเรียกใหม่ → ข้อความ `Likes: n` อัปเดต
- ถ้าเพิ่มค่า `_likes++` โดยไม่เรียก `setState` ค่าในตัวแปรจะเปลี่ยนแต่หน้าจอจะไม่ rebuild

## Git
- commit 1: flutter create (initial project)
- commit 2: HomePage + รหัสใน AppBar + ไอคอน + ชื่อจริง
- commit 3: StatefulWidget + ปุ่ม Like ด้วย setState
- commit 4: answers.md
