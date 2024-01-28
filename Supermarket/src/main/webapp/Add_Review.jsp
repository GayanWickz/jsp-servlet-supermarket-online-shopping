<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="review.css" />
</head>

<body>
    <%@ include file="Header.jsp" %>
  <div class="review">
    <form action="review" method="post">
      <p>Submit Your Feedback!</p>
      <label for="name">Name</label>
      <input type="text" id="name" name="name" required>

      <label for="message">Enter Your Review</label>
      <textarea id="message" name="review" rows="4" required></textarea>

      <button type="submit">Submit</button>
    </form>
  </div>
<%@ include file="footer.jsp" %>
</body>

</html>
