## Todos

1. use the repository and the testpixelart to attempt to create a pixelart, then attempt to read it. Verify responses uing expect
2. use the repository to list the pixelarts. expect the list of pixelarts to be longer than 0
3. Check response body for serialized PixelArt.
4. Check response body for serialized PixelArt.
5. Check response body for serialized PixelArt.
6. Check response body for list of PixelArt.
7. save serialized item to box if it does not already exist
8. attempt to read item from box by id. Remember to deserialize and error handle.
9. Read from the repository. Await the request and return a result. Make sure to error handle.
   Take inspiration from the put method
10. Deserialize the request body to retrieve a pixelArt for creation.
11. Uncomment this test when all other tests succeed.
12. Create read success test
13. Create delete success test.
14. Create delete fail test (on non existent id)
15. Uncomment this test when the other tests succeeed.
16. Post item as serialized string to http url and await response
17. check if response was successful and return success/failure result by deserializing the body or providing the failed crudstatus
18. use HTTP PUT with item serialized as body to HTTPURL/[id]. Make sure to error handle and return proper crudresults.
19. use HTTP DELETE to HTTPURL/[id]. Make sure to error handle and return proper crudresults.
20. Use the create/read/list/update/delete/changes methods of the repository to show how it is supposed to be used.
