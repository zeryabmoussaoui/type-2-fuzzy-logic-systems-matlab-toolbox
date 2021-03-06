%  IT2-FLS Toolbox is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     IT2-FLS Toolbox is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with IT2-FLS Toolbox.  If not, see <http://www.gnu.org/licenses/>.
function [yLeft,yRight,L,R]=t2f_TR_EIASC(F,Y)
%% EIASC Algorithm for Computing Y Left

% Sort Y matrix
lowerY = Y(:,1);
[~, ind] = sort(lowerY);
lowerY = lowerY(ind,:);
sortedF = F(ind,:);
lowerF = sortedF(:,1);
upperF = sortedF(:,2);

% Step 1.
N=size(F,1);
a= sum(lowerY.*lowerF);
b= sum(lowerF);
L=0;


while(1)
    % Step 2.
    L=L+1;
    a=a+lowerY(L)*(upperF(L)-lowerF(L));
    b=b+upperF(L)-lowerF(L);
    yl=a/b;
    
    % Step 3.
    if yl<=lowerY(L+1)
        L=L;
        yLeft=yl;
        break
        
    end
    
end

%% EIASC Algorithm for Computing Y right

% Sort Y matrix
upperY = Y(:,2);
[~, ind] = sort(upperY);
upperY = upperY(ind,:);
sortedF = F(ind,:);
lowerF = sortedF(:,1);
upperF = sortedF(:,2);

% Step 1.

a = sum(upperY.*lowerF);
b = sum(lowerF);
R = N;

while(1)
    % Step 2.
    a=a+upperY(R)*(upperF(R)-lowerF(R));
    b=b+upperF(R)-lowerF(R);
    yr=a/b;
    R=R-1;
    % Step 3.
    if yr>=upperY(R)
        R=R;
        yRight=yr;
        break
    end
    
end