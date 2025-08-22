<apex:page>
<html>
<head>
<title>Visualforce Page with Conditional Polyfills</title>
<script>
            // Check browser support and load polyfills as needed
            if (!window.Promise) {
                var script = document.createElement('script');
                script.src = '
https://cdn.polyfill.io/v3/polyfill.min.js?features=Promise';
                document.head.appendChild(script);
            }
            if (!window.fetch) {
                var script = document.createElement('script');
                script.src = '
https://cdn.polyfill.io/v3/polyfill.min.js?features=fetch';
                document.head.appendChild(script);
            }
</script>
</head>
<body>
<h1>Visualforce Page with Conditional Polyfills</h1>
<script>
            // Example JavaScript using Promises and Fetch API
           fetch('
https://cdn.polyfill.io.typicode.com/posts/1')
                              //fetch('
https://jsonplaceholder.typicode.com/posts/1')
                .then(response => response.json())
                .then(data => console.log(data))
                .catch(error => console.error('Error fetching data:', error));
</script>
</body>
</html>
</apex:page>
