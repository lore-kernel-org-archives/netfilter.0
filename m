From: "J. Bakshi" <joydeep@infoservices.in>
Subject: How to block particular port  based on src IP ?
Date: Wed, 14 Apr 2010 08:48:15 +0530
Message-ID: <4BC533F7.90104@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello list,

I have these working rule-sets which blocked the IPs trying to ssh more
then 2 per min. And then the matching IPs are blacklisted for a
pre-defined time. Here 180 sec.

```````````
iptables -A INPUT -p tcp -m hashlimit --hashlimit-above 2/min
--hashlimit-burst 2 \
--hashlimit-name hashlimit -m state --state NEW -m tcp --dport $SSH_POR=
T
-j \
MARK --set-xmark 0x1/0xffffffff

iptables -A INPUT -m recent --rcheck --seconds 180 --name sshoverflow
--rsource -j DROP

iptables -A INPUT -m mark --mark 0x1 -m recent --set --name sshoverflow
--rsource -j DROP

iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -j ACCE=
PT

``````````````````

I am trying to make an arrangement that rather blocking the IP,; only
the access to the ssh port will be blocked from that IP. So the other
services i.e. imap, apache will be still accessible from the IP
excluding ssh. Is it possible ?

Please suggest.
Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

