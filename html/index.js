$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show()
        } else {
            $("#container").hide()
        }
    }

    display(false);

    window.addEventListener("message", function(event) {
        $.post("http://healthbar/data", "received");
        if (event.type === "hb") {
            updateStats(event.cur_health, event.cur_maxhealth)
        }
    });
})

function updateStats(currentHealth, maxHealth) {
    $("#healthbar").css("width", 100 * currentHealth / maxHealth + "%")
    $("#healthbar").html(currentHealth)
    $.post("http://healthbar/data", JSON.stringify({
        data: `Health : ${currentHealth}. Max : ${maxHealth}`
    }))
}