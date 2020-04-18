#include "RoutingPath.h"

std::string RoutingPath::ToString()
{
	std::string ret;

	for (auto p : path) {
		ret.append(std::to_string(p) + "->");
	}
	return ret;
}
