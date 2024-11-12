
#include <iostream>
using namespace std;
int main() {
    // Write C++ code here
    int n;
    cin>>n;
    int m=1,p=1;
    for(int i=0;i<n;i++){
        if(i==0){
            cout<<0<<endl;
        }
        else if(i==1 || i==2){
            cout<<1<<endl;
        }
        else{
            int ans=m+p;
            cout<<ans<<endl;
            m=p;
            p=ans;
        }
    }

    return 0;
}   //iterative one;

//recusive approach fibonnaci
#include <iostream>
using namespace std;
int rec(int n){
    if(n==0)return 0;
    if(n==1 || n==2)return 1;
    else return rec(n-1)+rec(n-2);
}
int main() {
    // Write C++ code here
    int n;
    cin>>n;
    for(int i=0;i<n;i++){
       cout<<rec(i)<<endl;
    }
    return 0;
}  //recursive one;