#include <spdlog/spdlog.h>
#include "math.h"

int main() {
    spdlog::info("Starting Application...");
    int result = add(2, 3);
    spdlog::info("2 + 3 = {}", result);
    return 0;
}
