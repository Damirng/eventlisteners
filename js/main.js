"use strict";

class MyListener {
    constructor() {
        this.currentController = null;
        // на кнопки включения и выключения отслеживания
        // вешаем постоянные слушатели
        document.getElementById('on-button').addEventListener('click', () => {
            this.listenerOn();
        });
        document.getElementById('off-button').addEventListener('click', () => {
            this.listenerOff();
        });        
    }

    listenerOn = () => {
        if (this.currentController) {
            // если был инициирован контроллер
            // отключаем все события с ним
            this.currentController.abort();
        }
        // создаем новый контроллер
        this.currentController = new AbortController();
        const signal = this.currentController.signal;
        // и вешаем слушателя, отмеченного сигналом
        // контроллера отмены слушателей
        document.getElementById('test-button').addEventListener('click', () => {
            this.doSomething();
        }, { signal });
    }

    listenerOff = () => {
        if (this.currentController) {
            // если был инициирован контроллер
            // то удаляем всех его слушателей
            this.currentController.abort();
        }        
    };

    doSomething = () => { 
        console.log('Click test button');
    };
}



document.addEventListener("DOMContentLoaded", () =>{
    let mylistener = new MyListener();
});