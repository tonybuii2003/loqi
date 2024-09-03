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
    const url = "https://us-east1-loqi-loqi.cloudfunctions.net/repo?university=stonybrook&uid=jie.chen.3@stonybrook.edu"
  http.get(url);
  sleep(1);
}

