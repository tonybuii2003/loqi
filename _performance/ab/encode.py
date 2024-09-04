import urllib.parse
outfile = open('post.data', 'w')
params = ({"cards":[{"question":"What is 9+10?","answer":"ANSWER","hint":"a dead meme :(","order":0,"choices":["WRONG1","WRONG2","WRONG3","ANSWER"]},{"question":"What is 9+10?","answer":"ANSWER","hint":"a dead meme :(","order":0,"choices":["WRONG1","WRONG2","WRONG3","ANSWER"]},{"question":"What is 9+10?","answer":"ANSWER","hint":"a dead meme :(","order":0,"choices":["WRONG1","WRONG2","WRONG3","ANSWER"]}],"name":"RANDOM"}
)
encoded = urllib.parse.urlencode(params)
outfile.write(encoded)
outfile.close()