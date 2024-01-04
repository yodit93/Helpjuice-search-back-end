### Table of Contents

- [📖 Hotjuice search](#hotjuice-search)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

## 📖 Hotjuice search <a name="about-project"></a>

The Helpjuice Search Backend is a RESTful API built using Ruby on Rails. It provides endpoints to handle search queries, save search history, and generate analytics on user search behavior. The project focuses on capturing search queries made by users and analyzing the most frequently searched terms.


## Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Backend</summary>
  <ul>
    <li>Ruby on Rails</li>
  </ul>
</details>

<details>
  <summary>Database</summary>
  <ul>
    <li>Postgresql</li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

Api end points for:
- posting a user search query
- getting a users search analytics


<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need: 
- Any web-browser.
- Latest version of Ruby on Rails

### Setup

Clone this [repo](https://github.com/yodit93/Helpjuice-search-back-end.git) to your desired folder.

```
    git clone https://github.com/yodit93/Helpjuice-search-back-end.git
```

### Install

Run from a terminal

```
    cd Helpjuice-search-back-end
    bundle install
```

### Database
**To connect the project to the database:-**
```
    rails db:create
    rails db:migrate
```

### Usage

**To run the project follow the following instruction:-**

```
    rails s -p 3001
```

### Run tests (using rspec)

To run the models test

```
  rspec ./spec/models
```

### Deployment

You can deploy this project using: [render](https://render.com/).

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


```

## Authors <a name="authors"></a>

👤 **Yodit Abebe**

- GitHub: [yodit93](https://github.com/yodit93)
- Twitter: [@yodtwit](https://twitter.com/yodtwit)
- LinkedIn: [Yodit Abebe](https://www.linkedin.com/in/yodit-abebe-ayalew/)



## Future Features <a name="future-features"></a>

- **Add authentication and authorization**
- **Add additional functionalities**

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues).

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Support <a name="support"></a>

If you like this project give us a ⭐️.

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Acknowledgments <a name="acknowledgements"></a>

I would like to thank Hotjuice team for giving me this chance.

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>