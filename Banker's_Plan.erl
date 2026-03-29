-module(kata).
-export([fortune/5]).

-spec fortune(integer(), float(), integer(), integer(), float()) -> boolean.

fortune(F0, P, C0, N, I) ->
    P1 = P / 100.0,
    I1 = I / 100.0,
    fortune_year(F0, P1, C0, N, I1).

%% When N = 1, we are at the beginning of year N.
%% We just need to check that the money is still non-negative.
fortune_year(F, _P, _C, 1, _I) ->
    F >= 0;

fortune_year(F, P, C, N, I) ->
    %% Apply interest and withdrawal in one step, then truncate
    F1 = trunc(F + F * P - C),
    %% Apply inflation to withdrawal, then truncate
    C1 = trunc(C + C * I),
    fortune_year(F1, P, C1, N - 1, I).

%-module(kata_tests).
%-include_lib("eunit/include/eunit.hrl").

%testing(F0, P, C0, N, I, Expect) ->
 %   Actual = kata:fortune(F0, P, C0, N, I),
 %   {"fortune(" ++ integer_to_list(F0) ++ "," ++ float_to_list(P,[{decimals, 2}]) ++ "," ++ integer_to_list(C0)
%                ++ "," ++ integer_to_list(N) ++ "," ++ float_to_list(I,[{decimals, 2}]) ++ ")"
%       ++ "\nExpect :" ++ atom_to_list(Expect) 
%       ++ "\nActual :" ++ atom_to_list(Actual),  
 %      ?_assertEqual(Expect, Actual)}.

%fortune_test_() -> 
 %   [
%    testing(100000, 1.0, 2000, 15, 1.0, true),
%    testing(100000, 1.0, 9185, 12, 1.0, false),
%    testing(100000000, 1.0, 100000, 50, 1.0, true),
 % 
 %   ].
%
