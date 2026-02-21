#include <string>
#include <vector>
#include <utility>

std::vector<std::string> openOrSenior(std::vector<std::pair<int, int>>& data)
{
  std::vector<std::string> result;
  result.reserve(data.size());
  
  for (const auto& p : data) {
    int age = p.first;
    int handicap = p.second;
    
    if (age >= 55 && handicap > 7)
       result.push_back("Senior");
    else
       result.push_back("Open");
  }
   return { 
    result
   }; 
}
