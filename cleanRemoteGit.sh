git branch -r --merged | 
  grep origin | 
  grep -v '>' | 
  grep -v master | 
  xargs -L1 | 
  awk '{split(bash,a,/); print a[2]}' | 
  xargs git push origin --delete
