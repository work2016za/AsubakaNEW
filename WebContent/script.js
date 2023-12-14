// HTMLから要素を取得
const calendarElement = document.getElementById("calendar"); // カレンダーの要素
const prevMonthButton = document.getElementById("prevMonth"); // 前月ボタン
const nextMonthButton = document.getElementById("nextMonth"); // 次月ボタン
const titleElement = document.getElementById("calendar-title"); // カレンダータイトル

// カレンダーの年、月、選択された日付を格納する変数
let currentYear, currentMonth, selectedDates = new Set();

// ページが読み込まれたときに実行される処理
document.addEventListener("DOMContentLoaded", function() {
	// カレンダーを初期化する関数を呼び出す
	initCalendar();

	// カレンダーを初期化する関数
	function initCalendar() {
		// 現在の日付を取得
		const currentDate = new Date();
		// 年と月を設定
		currentYear = currentDate.getFullYear();
		currentMonth = currentDate.getMonth();
		// カレンダーを表示
		renderCalendar(currentYear, currentMonth);
		// 前月ボタンと次月ボタンにクリックイベントリスナーを追加
		prevMonthButton.addEventListener("click", showPreviousMonth);
		nextMonthButton.addEventListener("click", showNextMonth);
	}

	// カレンダーを表示する関数
	function renderCalendar(year, month) {
		// 月の日数を取得
		const daysInMonth = new Date(year, month + 1, 0).getDate();
		// 月の最初の日を取得
		const firstDay = new Date(year, month, 1);
		const startingDay = (firstDay.getDay() + 6) % 7;

		// カレンダーのHTMLを初期化
		let calendarHtml = '<table>';
		calendarHtml += '<tr><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th>土</th><th>日</th></tr>';
		let day = 1;

		for (let i = 0; i < 6; i++) {
			calendarHtml += '<tr>';

			for (let j = 0; j < 7; j++) {
				if (i === 0 && j < startingDay) {
					// 月の始まる前のセル
					calendarHtml += '<td></td>';
				} else if (day <= daysInMonth) {
					// 日付セル
					const date = `${year}-${month + 1}-${day}`;
					const formattedDay = day < 10 ? `0${day}` : day; // 日付を01から09にフォーマット
					const formattedDate = `${year}-${month + 1}-${formattedDay}`;
					const isChecked = selectedDates.has(formattedDate) ? 'checked' : '';
					calendarHtml += `<td><span class="date">${formattedDay}</span><input type="checkbox" data-date="${formattedDate}" ${isChecked}></td>`;
					day++;
				} else {
					// 月の終わりのセル
					calendarHtml += '<td></td>';
				}
			}
			calendarHtml += '</tr>';
		}

		calendarHtml += '</table>';
		// カレンダーをHTMLに表示
		calendarElement.innerHTML = calendarHtml;
		// カレンダータイトルを更新
		titleElement.textContent = `${year}年${month + 1}月`;

		// チェックボックスの変更イベントリスナーを追加
		const checkboxes = calendarElement.querySelectorAll('input[type="checkbox"]');
		checkboxes.forEach(checkbox => {
			checkbox.addEventListener("change", toggleDate);
		});
	}

	// 前月を表示する関数
	function showPreviousMonth() {
		if (currentMonth === 0) {
			currentYear--;
			currentMonth = 11;
		} else {
			currentMonth--;
		}
		// カレンダーを再描画
		renderCalendar(currentYear, currentMonth);
	}

	// 次月を表示する関数
	function showNextMonth() {
		if (currentMonth === 11) {
			currentYear++;
			currentMonth = 0;
		} else {
			currentMonth++;
		}
		// カレンダーを再描画
		renderCalendar(currentYear, currentMonth);
	}

	// 日付の選択を切り替える関数
	function toggleDate(event) {
		const date = event.target.dataset.date;
		if (selectedDates.has(date)) {
			selectedDates.delete(date);
		} else {
			selectedDates.add(date);
		}
	}
});
