list<case> listCase = new list<case>();
for (Integer i = 0; i < 210; i++) {
    case c = new case();
    c.Subject = 'trigger case';
    c.Origin = 'Web';
    c.Status = 'New';
    c.Description = 'resolve it, come on';
    listCase.add(c);
}
insert listCase;

list<case> allCases = [select id, status from case where status = 'New'];
for (case eachCase : allCases) {
    eachCase.Status = 'Working';
}
update allCases;