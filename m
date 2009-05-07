From: =?ISO-8859-1?Q?Fredrik_Str=F6mberg?= <stromberg@insto.org>
Subject: Block outgoing spam from a network using iptables?
Date: Thu, 7 May 2009 11:36:20 +0200
Message-ID: <E83DD376-AB3F-472D-B8DF-18F37B27D788@insto.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Hello,

I=B4m using iptables on a gateway for a lot of computers. I want to =20
block spam that goes out through the gateway, namely, I want to block =20
certain traffic to dport 25.

Scanning the contents of the emails is not an option, so I need some =20
kind of rules that say something like "If ip-adress X sends more than =20
Y emails within Z minutes, that ip will be logged and blocked from =20
sending mail for C hours, and if the sending persists for D minutes, =20
log that too".

I=B4ve googled my problem but have been unable to find much. I don=B4t =
=20
expect a complete solution, just suggestions and hints. Although, a =20
complete solution would be nice to study and learn from, if someone =20
here is able to do it.

Maybe logging how many emails is impossible. If so, what is the best =20
solution you can think of that doesn=B4t involve scanning the contents?

I found this but I don=B4t understand how it does what he says it does.=
 =20
- http://marti.dimerge.net/blog/tag/ipt_recent :

modprobe ipt_recent ip_list_tot=3D32 #ip_list_tot - defines the size of=
 =20
ip_recent file
iptables -A FORWARD -p tcp =96dport 25 -m recent =96name SMTP =96second=
s 30 =96=20
update -j DROP
iptables -A FORWARD -p tcp =96dport 25 -m limit =96limit 1/second =96li=
mit-=20
burst 5 -j LOG =96log-level info =96log-prefix =93smtp-log =94
iptables -A FORWARD -p tcp =96dport 25 -m recent =96name SMTP =96set -j=
 ACCEPT

If this is the wrong list and I should look for help somewhere else, =20
please say so.


Kind regards, stromberg