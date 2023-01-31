Candidates.companyName = 'softInnovas';

system.debug('0. number of candidates: ' + Candidates.countCandidate);

Candidates c1= new Candidates();
c1.name = 'Seda';
c1.gender = 'Female';
c1.printCandidate();
//system.debug('1 company name is ' + Candidates.companyName);
Candidates.printCompany();

Candidates c2 = new Candidates();
c2.name = 'John';
c2.gender = 'Male';
c2.printCandidate();
system.debug('1. number of candidates: ' + Candidates.countCandidate);

Candidates.companyName = 'Vandeley industries';

Candidates c3 = new Candidates();
c3.name = 'Jerry';
c3.gender = 'Male';
c3.printCandidate();
system.debug('3. number of candidates: ' + Candidates.countCandidate);

c1.printCandidate();
c2.printCandidate();

