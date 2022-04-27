classdef test_cases_1b < matlab.unittest.TestCase
    methods(Test)
        function cocktail(testCase)
            % As seen in tutorial.
            m = 3;
            n = 5;
            
            A = [0.08 0.06 1 0 0;
                 1 0 0 1 0;
                 0 1 0 0 1];
            
            c = [-2 -1.25 0 0 0]';
            
            b = [12 120 120]';
            
            [z,x,pi,ind,exitflag] = fullsimplex(A,b,c,m,n);

            testCase.verifyEqual(z,-290, RelTol = 1e-5);
            testCase.verifyEqual(x,[40,120,80].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-125/6, -1/3, 0].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[2,1,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function cocktail_unbounded(testCase)
            % Unbounded cocktail problem as seem in tutorial
            m = 3;
            n = 5;
            
            A = [0.08 0.06 -1 0 0;
                 1 0 0 -1 0;
                 0 1 0 0 -1];
            
            c = [-2 -1.25 0 0 0]';
            
            b = [12 120 120]';

            [z,x,pi,ind,exitflag] = fullsimplex(A,b,c,m,n);
            
            % Don't think we need all return values to be exact here as
            % long as exitflag = -1. But why not...
%             testCase.verifyEqual(z,0, RelTol = 1e-5);
%             testCase.verifyEqual(x,[-12,-120,-120].', RelTol = 1e-5);
%             testCase.verifyEqual(pi,[0, 0, 0].', RelTol = 1e-5);
%             testCase.verifyEqual(ind,[3,4,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,-1, RelTol = 1e-5);
        end

        function Assignment_1_Q3(testCase)
            m = 3;
            n = 6;
            
            A = [1 1 1 1 0 0;
                 1 2 2 -1 1 0;
                 1 2 1 0 -1 1];
            
            c = [15 10 -10 1 2 3]';
            
            b = [4 4 4]';

            [z,x,pi,ind,exitflag] = fullsimplex(A,b,c,m,n);
            
            testCase.verifyEqual(z,-64/3, RelTol = 1e-5);
            testCase.verifyEqual(x,[8/3,4/3,4/3].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-11/3, -14/3, 3].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[3,6,4].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function Assignment_1_Q4(testCase)
            m = 2;
            n = 5;
            
            A = [1 2 3 1 -1;
                 2 1 4 -1 2];
            
            c = [1 1 1 1 1]';
            
            b = [4 6]';

            [z,x,pi,ind,exitflag] = fullsimplex(A,b,c,m,n);

            testCase.verifyEqual(z,8/5, RelTol = 1e-5);
            testCase.verifyEqual(x,[7/5,1/5].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-1/5,2/5].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[3,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

%        function Degen(testCase)
%             m = 3;
%             n = 5;
%             
%             A = [0.08 0.06 1 0 0;
%                  1 0 0 1 0;
%                  0 1 0 0 1];
%             
%             b = [10 125 120].';
%             
%             c = [-7,-6,0,0,0].';
% 
%             [z,x,pi,ind,exitflag] = fullsimplex(A,b,c,m,n);
% 
%             testCase.verifyEqual(z,8/5, RelTol = 1e-5);
%             testCase.verifyEqual(x,[7/5,1/5].', RelTol = 1e-5);
%             testCase.verifyEqual(pi,[-1/5,2/5].', RelTol = 1e-5);
%             testCase.verifyEqual(ind,[3,5].', RelTol = 1e-5);
%             testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
%         end

        function another_degenerate(testCase)
            m = 4;
            n = 6;
            
            A = [0.08 0.06 1 0 0 0;
                 0.06 0.06 0 1 0 0;
                 0 1 0 0 1 0;
                 2 1 0 0 0 1];
            
            c = [-2 -1.25 0 0 0 0]';
            
            b = [12 9.6 120 280]';
            
            [z,x,pi,ind,exitflag] = fullsimplex(A,b,c,m,n);
            
            testCase.verifyEqual(z,-290, RelTol = 1e-5);
            testCase.verifyEqual(x,[40, 0, 80, 120].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-12.5, 0, 0, -0.5].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[2,4,5,1].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end
    end
end
