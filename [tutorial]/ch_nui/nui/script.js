document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('destination-cancel').addEventListener('click', () => {
        axios.post(`https://${GetParentResourceName()}/releaseFocus`, {})
    })
    
    document.getElementById('destination-submit').addEventListener('click', () => {
        axios.post(`https://${GetParentResourceName()}/teleport`, () => {
            x = document.getElementById('destination-x').value
            y = document.getElementById('destination-y').value
            z = document.getElementById('destination-z').value
        })
    })
}, false)

