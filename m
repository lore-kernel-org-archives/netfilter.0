From: "J. Bakshi" <joydeep@infoservices.in>
Subject: can we design a modified fail2ban ?
Date: Fri, 16 Apr 2010 09:27:28 +0530
Message-ID: <4BC7E028.8050209@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Dear list,

fail2ban is a popular application to prevent the brute-force attack
against ssh and also against imap, pop3 etc.. But fail2ban actually
blacklist the IP and this is what fail2ban has been designed for. Now a
days we can design the same with iptables. I wonder if iptables can
provide more liberty to match IP as well as port combination so that we
don't need to blacklist the IP but only block the attempts from the IP
based on port. Say more than 3 ssh attempt from IP xxx.xxx.xxx.xxx is
detected and no more ssh attempt from the same ip is no more possible
but pop and imap still works. Is it really possible with iptables ? Any
idea ?

Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

