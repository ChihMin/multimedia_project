%{

g = @() fullSearchTime();
t = timeit(g);
%}
start_full_search = tic;
fullSearchTime(1);
full_search_time_D_8 = toc(start_full_search)

start_full_search = tic;
fullSearchTime(2);
full_search_time_D_16 = toc(start_full_search)


start_log_search = tic;
logSearchTime(1);
log_search_time_D_8 = toc(start_log_search)

start_log_search = tic;
logSearchTime(2);
log_search_time_D_16 = toc(start_log_search)