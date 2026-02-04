# 🚗 FiveM Car Flipper

> **Ever flipped your car and felt completely helpless?** Not anymore! This friendly little script lets you flip your vehicle back on its wheels with a fun skill check mini-game. 💪

![FiveM](https://img.shields.io/badge/FiveM-Resource-blue)
![Lua](https://img.shields.io/badge/Lua-5.4-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## ✨ What Does This Do?

Picture this: You're cruising through Los Santos, take a corner a bit too fast, and BAM! 💥 Your car's on its roof. Instead of calling for help or respawning your vehicle, you can now **manually flip it back over** with your own two hands! 

The catch? You'll need to pass a few skill checks to prove you're strong enough. It's realistic, it's fun, and it adds that extra bit of immersion to your roleplay server!

## 🎮 Features

- **🎯 Smart Detection** - Automatically detects when your vehicle is flipped over
- **💪 Skill Check System** - Three medium-difficulty skill checks using ox_lib
- **🎭 Immersive Animation** - Your character physically pushes the vehicle
- **🚙 Vehicle Class Filtering** - Works only with appropriate vehicles (no helicopters or bikes!)
- **😂 Funny Feedback** - Get cheeky messages when you fail (all in good fun!)
- **⚙️ Fully Configurable** - Customize which vehicle types can be flipped

## 📦 Installation

1. **Download** this resource
2. Place it in your `resources` folder
3. Make sure you have [ox_lib](https://github.com/overextended/ox_lib) installed
4. Add this to your `server.cfg`:
   ```cfg
   ensure ox_lib
   ensure fivem_lero_car_flipper
   ```
5. Restart your server and you're good to go! 🎉

## 🎯 How to Use

1. Walk up to a flipped vehicle (within 3 meters)
2. You'll see a notification: *"Press E to flip the vehicle"*
3. Press **E** to start the flipping process
4. Complete **3 skill checks** by pressing the correct key at the right moment
5. Success? Your car is back on its wheels! Failure? Try again (and enjoy the banter 😄)

## ⚙️ Configuration

Open `config.lua` to customize the script:

```lua
Config.allowedVehicleClasses = {
    [0] = true,     -- Compacts
    [1] = true,     -- Sedans
    [8] = false,    -- Motorcycles (excluded)
    -- ... and more!
}
```

You can enable or disable specific vehicle classes. By default, motorcycles, cycles, boats, helicopters, planes, and trains are excluded (because, let's be honest, that wouldn't make much sense! 😅).

## 🛠️ Dependencies

- [ox_lib](https://github.com/overextended/ox_lib) - For the skill check system

## 🤝 Contributing

Found a bug? Have a cool idea? Feel free to open an issue or submit a pull request! All contributions are welcome with open arms! 💖

## 📝 License

This project is open source and available under the MIT License. Feel free to use it, modify it, and share it!

## 💝 Credits

Made with ❤️ by **LERO**

If you enjoy this resource, consider giving it a ⭐ on GitHub! It really helps and makes me super happy! 😊

---

**Happy flipping!** 🚗✨
