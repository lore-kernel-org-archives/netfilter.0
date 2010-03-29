From: "J. Bakshi" <joydeep@infoservices.in>
Subject: ssh overflow blacklisting not working properly
Date: Mon, 29 Mar 2010 13:01:22 +0530
Message-ID: <4BB0574A.2060106@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Dear list,

Could some one please help me to identify the problem in my ssh overflo=
w
blacklisting rule sets ? I already have these rule sets to prevent ssh
overflow. Please note my firewall is default DROP policy.


#---------------- ssh incoming----------------#


# NB: Block the overflow ip for 3 min
# max 3 connection per min per ip

iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -m
hashlimit \
--hashlimit 3/min --hashlimit-burst 1 --hashlimit-htable-expire 180000 =
\
--hashlimit-mode srcip --hashlimit-name sshlimit -j ACCEPT

#----------------------------------------#

As expected connection attempt more than 3 in a min is dropped and
ensure only 3 connection per minute. But It should also block the sourc=
e
IP for 3 min and this part is not working here. Could any one kindly
suggest any clue or reason behind this ?

Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

