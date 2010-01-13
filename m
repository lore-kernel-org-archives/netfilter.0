From: "J. Bakshi" <joydeep@infoservices.in>
Subject: hashlimit rule problem with port 80
Date: Wed, 13 Jan 2010 13:41:11 +0530
Message-ID: <4B4D801F.2080004@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello list,

I have configured the hashlimit to protect port 80 (http) from apache
benchmark and related attack. The rule is

` ` `
iptables -A INPUT -p tcp -m state --state NEW --dport 80 -m hashlimit \
--hashlimit 200/sec --hashlimit-burst 5 --hashlimit-htable-expire 18000=
 \
--hashlimit-mode srcip --hashlimit-name http -j ACCEPT
` ` `
But I have found this rule is not protecting the apache and apache is
flooded by apache benchmark attack.
Have I done some thing wrong in my rule set ?
Please suggest.
Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

