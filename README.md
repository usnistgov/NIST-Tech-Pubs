<a id="readme-top"></a>
<!--
*** Created using Best-README-Template by @othneildrew.
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<h1 align="center">NIST Technical Series Publications</h1>
</div>
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a><li>
	  <a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

The main purpose of this repository is to deliver machine-readable metadata for NIST Technical Series Publications, including the Journal of Research of NIST. The repository also offers download statistics for NIST Technical Series Publications.

Repository includes:

- [NIST Technical Series Publication metadata](https://github.com/usnistgov/NIST-Tech-Pubs/releases): Metadata created in ExLibris Catalog for all NIST Technical Series Publications with public Digital Object Identifiers (DOIs)
  - [Schemas and transformations](https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages/xslt): XSLT files to create XML metadata
  - [HTML discovery](https://pages.nist.gov/NIST-Tech-Pubs/): HTML pages generated from metadata (not updated as of March 2024)
- [NIST Technical Series Publication downloads](https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages/downloads): Monthly and Yearly Report Downloads with the number of [hits and visitors](https://github.com/allinurl/goaccess/issues/2133#issuecomment-859188022) for each NIST Technical Series Publication PDF.
  - Each Report Downloads page is an imported Jupyter Notebook `.html` file that uses python to display a searchable table from a `.csv` file.
  - If you're interested in running and/or tweaking the code yourself, please [visit the Jupyter notebook file](https://github.com/usnistgov/NIST-Tech-Pubs/blob/nist-pages/downloads/report-downloads-notebook.ipynb).
- [Journal of Research of NIST metadata](https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages/xml/JRes-NIST-XML): Metadata created by CrossRef for all Journal of Research of NIST articles with public DOIs

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

Since this repository is a method of delivery rather than a place to collaborate, you can use the information here in any way you'd like as long as it adheres to the NIST [LICENSE](https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages?tab=License-1-ov-file).

Some usage examples:

- Create reference database
- Natural language processing
- Citation analysis
- Download analysis

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. However, since the purpose of this repository is to deliver data, we are not accepting contributions at this time.

If you have a question or suggestion that would make this better, please open an [issue](https://github.com/usnistgov/NIST-Tech-Pubs/issues) and we will review as soon as possible.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Top contributors:

<a href="https://github.com/usnistgov/NIST-Tech-Pubs/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=usnistgov/NIST-Tech-Pubs" alt="contrib.rocks image" />
</a>

<!-- LICENSE -->
## License

Distributed under the NIST License. See [LICENSE](https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages?tab=License-1-ov-file) for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

NIST Research Library - techpubs@nist.gov

Project Link: [https://github.com/usnistgov/NIST-Tech-Pubs](https://github.com/usnistgov/NIST-Tech-Pubs)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/usnistgov/NIST-Tech-Pubs.svg?style=for-the-badge
[contributors-url]: https://github.com/usnistgov/NIST-Tech-Pubs/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/usnistgov/NIST-Tech-Pubs.svg?style=for-the-badge
[forks-url]: https://github.com/usnistgov/NIST-Tech-Pubs/network/members
[stars-shield]: https://img.shields.io/github/stars/usnistgov/NIST-Tech-Pubs.svg?style=for-the-badge
[stars-url]: https://github.com/usnistgov/NIST-Tech-Pubs/stargazers
[issues-shield]: https://img.shields.io/github/issues/usnistgov/NIST-Tech-Pubs.svg?style=for-the-badge
[issues-url]: https://github.com/usnistgov/NIST-Tech-Pubs/issues
[license-shield]: https://img.shields.io/badge/license-NIST-green?style=for-the-badge&link=https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages?tab=License-1-ov-file

[license-url]: https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages?tab=License-1-ov-file
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
