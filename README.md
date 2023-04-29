<h1>Cafes SwiftUI</h1>

<p>
	<img src="https://img.shields.io/badge/version-1.0.0-blue">
	<a href="https://www.linkedin.com/in/anatoliyostapenko">
		<img src="https://img.shields.io/badge/linkedin-%230077B5.svg">
	</a>
	<a href="https://www.swift.org">
		<img src="https://img.shields.io/badge/swift-F54A2A">
	</a>
	<a href="https://developer.apple.com/documentation/ios-ipados-release-notes/ios-ipados-16_2-release-notes">
		<img src="https://img.shields.io/badge/iOS 16.2-000000?">
	</a>
</p>

<h2>Features</h2>
<ul>
	<li>The network layer is mocked (a JSON sample is available in the repository files, vendors.json);</li>
	<li>The search starts automatically after a user has typed at least 3 symbols, with a 0.5-second debouncing period;</li>
	<li>The items are filtered by the company_name field.</li>
</ul>

<h2>Usage</h2>
<p>The user has the option to toggle pictures on the iPhone search vendor by name:</p>
<p>
	<img src="firstPic.png" width="240" height="450">
	<img src="secondPic.png" width="240" height="450">
	<img src="thirdPic.png" width="240" height="450">
</p>

<h2>Architecture</h2>
<ul>
	<li>Consideration of screen rotation</li>
	<li>MVVM design pattern</li>
	<li>SDWebImage library Cocoapods</li>
</ul>

<h2>Used API</h2>
<ul>
	<li>Mock Data</li>
</ul>

<h2>Installation</h2>
<p>To install the app and dependencies:</p>
<ol>
	<li>Clone the repository</li>
	<li>Run 'pod install' to install the SDWebImage library</li>
	<li>Open the project in Xcode</li>
	<li>Build and run the app</li>
</ol>

<h2>License</h2>
<p>This project is licensed under the MIT License. See the LICENSE file for details.</p>
<img src="https://img.shields.io/badge/license-MIT-blue">
