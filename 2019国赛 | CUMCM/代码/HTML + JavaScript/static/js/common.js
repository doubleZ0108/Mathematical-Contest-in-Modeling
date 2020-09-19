window.onload = function () {
    let left = 120 + 52 / 60;
    let right = 121 + 19 / 60;
    let top = 31 + 53 / 60;
    let bottom = 30 + 40 / 64;

    let gap_lr = (right - left) / 6;
    let gap_tb = (top - bottom) / 6;

    let hor = new Array();
    let ver = new Array();

    for (let i = 0; i < 7; ++i) {
        hor[i] = String((left + gap_lr * i).toFixed(4));
    }
    for (let j = 0; j < 7; ++j) {
        ver[j] = String((top - gap_tb * j).toFixed(4));
    }
    console.log(hor);
    console.log(ver);


    let T = document.getElementById('mytabel');
    for (let i = 0; i < 6; ++i) {
        let tr = document.createElement('tr');
        for (let j = 0; j < 6; ++j) {
            let td = document.createElement('td');


            let TT = document.createElement('tabel');

            for (let k = 0; k < 3; ++k) {
                let trtr = document.createElement('tr');
                if (k == 0) {
                    trtr.innerHTML = '<td></td>\n' +
                        '<td class="top">' + String(ver[i]) + '</td>\n' +
                        '<td></td>';
                } else if (k == 1) {
                    trtr.innerHTML = '<td class="left">' + String(hor[j]) + '</td>\n' +
                        '<td></td>\n' +
                        '<td class="right">' + String(hor[j + 1]) + '</td>'
                } else {
                    trtr.innerHTML = '<td></td>\n' +
                        '<td class="bottom">' + String(ver[i + 1]) + '</td>\n' +
                        '<td></td>';

                }
                TT.appendChild(trtr);
            }

            td.appendChild(TT);
            tr.appendChild(td);
        }
        T.appendChild(tr);
    }
};