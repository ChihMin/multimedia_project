%{

g = @() fullSearchTime();
t = timeit(g);
%}
start_full_search = tic;
fullSearchTime(1, 1);
full_search_time_N_8_D_8 = toc(start_full_search)

start_full_search = tic;
fullSearchTime(1, 2);
full_search_time_N_8_D_16 = toc(start_full_search)

start_full_search = tic;
fullSearchTime(2, 1);
full_search_time_N_16_D_8 = toc(start_full_search)

start_full_search = tic;
fullSearchTime(2, 2);
full_search_time_N_16_D_16 = toc(start_full_search)


start_log_search = tic;
logSearchTime(1, 1);
log_search_time_N_8_D_8 = toc(start_log_search)

start_log_search = tic;
logSearchTime(1, 2);
log_search_time_N_8_D_16 = toc(start_log_search)

start_log_search = tic;
logSearchTime(2, 1);
log_search_time_N_16_D_8 = toc(start_log_search)

start_log_search = tic;
logSearchTime(2, 2);
log_search_time_N_16_D_16 = toc(start_log_search)