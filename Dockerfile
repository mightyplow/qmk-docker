FROM python:slim

ENV QMK_KEYBOARD xd68
ENV QMK_KEYMAP myKeymap

RUN pip3 install qmk && \
	apt-get update && \
	apt-get install git sudo wget -y && \
	qmk setup -y && \
	qmk config user.keyboard=$QMK_KEYBOARD && \
	qmk config user.keymap=$QMK_KEYMAP && \
	qmk new-keymap && \
	apt-get purge git wget -y && \
	apt-get autoremove -y && \
	apt-get autoclean -y && \
	ln -s /root/qmk_firmware/keyboards/${QMK_KEYBOARD}/keymaps/${QMK_KEYMAP} /keymap && \
	rm -rf /var/lib/apt/lists/*