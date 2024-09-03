import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 100,
  duration: '30s',
  cloud: {
    // Project: Default project
    projectID: 3711076,
    // Test runs with the same name groups test runs together.
    // name: 'Test (03/09/2024-10:52:49)'
  }
};

export default function() {
    const url = "https://us-east1-loqi-loqi.cloudfunctions.net/forum?uid=CSE220-01-LEC(89701)"
    const body = {
        "description": "test",
        "pinned": false,
        "question": "test",
        "studentAnswer": null,
        "instructorAnswer": null,
        "comments": [],
        "followups": [],
        "upvotes": 0,
        "downvotes": 0,
        "authorName": "Jie Chen",
        "authorEmail": "jie.chen.3@stonybrook.edu",
        "authorPhotoURL": "https://lh3.googleusercontent.com/a/ACg8ocKjfu_nP3HQYP4CPUMPvArMpFT04AX6b5OqGqAQfAxLPp7WB4ZR=s96-c"
    }
  http.post(url, body);
  sleep(1);
}

