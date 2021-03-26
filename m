From: <paul.guijt@gmail.com>
Subject: Creating named set
Date: Fri, 26 Mar 2021 18:27:05 +0100
Message-ID: <037901d72265$3e58d790$bb0a86b0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=+sK7DCcVDUY/HRfufoou5d9n4NAsfFOYs2soncjZOjk=;
        b=rvLG7FflHtU7DUHi+XV6CjZ5kcRTYeMpLwULzEf0/jDXzs+loXZ0EepwxKhWiWe7ce
         vxkr/QclW27yCsoU4jzGjq8jCj5112ANBQ22wWHbmceH5LVQuvY5sUjrX/Yi2sITa5Ua
         HmtLPQF+fPsPmk0WnPyxZYdVs3NAUJcYgQcHlhiRt1s9LjkX05AY50RvTSJf48z12YRH
         Clabv5sj+zHXj+9zCMd8TyBWHsR2NanAu9smUsiCJJAM7QUf58Mcfe4Nd8cASatEfMCs
         yNf5/z28lE2XLQArQFVP9RY4n99ERPMwfddHv81O3HPuB+fCii20JfNkD6hmPRTNnCpe
         NHdQ==
Content-Language: nl
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; boundary="----=_NextPart_000_0371_01D7226D.6A553E30"; charset="utf-8"
To: netfilter@vger.kernel.org

Hi all,
On Raspbian I tried:
	sudo nft add set inet filter blocklist { type inet_proto \; flags =
timeout \; }
	Error: Could not process rule: No such file or directory
	add set inet filter blocklist { type inet_proto ; flags timeout ; }
	             ^^^^^^
I have tried all sorts of syntax, but every time that error comes up. =
Even with =E2=80=9C% nft add set ip filter blackhole { type =
ipv4_addr\;}=E2=80=9D from the wiki.=20
I have an inet table, and in it I want to drop anything coming from =
@blocklist. Can anyone please hand me the correct syntax, either for =
command line (sudo nft =E2=80=A6) or for a rules file?=20

Best wishes, stay safe,
Paul


