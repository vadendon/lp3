#include<bits/stdc++.h>
using namespace std;
struct item{
    int value;
    int weight;
};
class solution{
    public:
    bool static comp(item a,item b){
        double r1=(double)a.value/(double)a.weight;
        double r2=(double)b.value/(double)b.weight;
        return (r1>r2);
    }

    double fknp(int w,item arr[],int n){
        sort(arr,arr+n,comp);
        int curw=0;
        double fvalue=0.0;
        for(int i=0;i<n;i++){
            if(curw+arr[i].weight<=w){
                curw+=arr[i].weight;
                fvalue+=arr[i].value;
            }
            else{
                int remain=w-curw;
                fvalue+=(arr[i].value/(double)arr[i].weight)*remain;
                break;
            }
        }
        return fvalue;
    }
};
int main(){
    int w,n;
    cout << "Enter the number of items: ";
    cin >> n;
   
    cout << "Enter the maximum weight of the knapsack: ";
    cin >> w;
    item arr[n];
    cout << "Enter the value and weight of each item:\n";
    for (int i = 0; i < n; i++) {
      cout << "Item " << i + 1 << ": ";
      cin >> arr[i].value >> arr[i].weight;
    }
    solution obj;
    double ans=obj.fknp(w,arr,n);
    cout << "The maximum value is " << setprecision(2) << fixed << ans << endl;
    return 0;
}
