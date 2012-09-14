From: Bruno Linhares <oandarilho01@yahoo.com.br>
Subject: Problem to shape Microsoft Remote Desktop traffic
Date: Fri, 14 Sep 2012 14:12:13 -0700 (PDT)
Message-ID: <1347657133.31500.YahooMailNeo@web162806.mail.bf1.yahoo.com>
Reply-To: Bruno Linhares <oandarilho01@yahoo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.br; s=s1024; t=1347657133; bh=aOlli090vGuWSQqne1XZE4ujspaYgHuu1CcvL8298n8=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=HA9GZTL0N06fz95ZbDihKahGWtn2p55qSCYMiouLuUxzTz81rJbJGTMiroQUcGRzjRINPh5QWdbwwQrLWXHI1rgnaeTgdIJNcYec9HZzqgVEHGx3iQ3yentj+nItMkfVA83mWSQWU9Q2mqAudODGiuZdd9t0Pn0GYxJaxCM7ecA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi!

It seems I can't apply QoS over Remote Desktop connections (RDP/3389 TC=
P). I suspect that tc is not seeing the correct dst port of the=20
connections. I believe it is seeing the source port.

I have some tc net rules, and for each of the /24 networks I handle, al=
l=20
the other protocols' rules are working. Only 3389 isn't. As I always=20
have rules to catch non-specified protocols/ports, 3389 connections are=
=20
always falling in that category.

My doubts were reinforced when I noticed that nettop tool was registeri=
ng the source port (of the client) of the connection.
Could it be a RDP client behaviour?


By the way, this is an example group rule:

tc class=A0 add dev eth1 parent 1:1 classid 1:33 htb rate 3000kbit ceil=
 3000kbit=20
tc filter add dev eth1 parent 1:0 protocol ip prio 1 u32 match ip dst 1=
92.168.31.0/24 flowid 1:33=20
tc class=A0 add dev eth1 parent 1:33 classid 1:330 htb rate 750kbit cei=
l 2000kbit=20
tc qdisc=A0 add dev eth1 parent 1:330 handle 330: sfq perturb 10
tc class=A0 add dev eth1 parent
 1:33 classid 1:331 htb rate 1000kbit ceil 3000kbit=20
tc qdisc=A0 add dev eth1 parent 1:331 handle 331: sfq perturb 10
tc filter add dev eth1 protocol ip parent 1:33 prio 1 u32 match ip dst =
192.168.31.0/24 match ip sport 3389 0xffff flowid 1:331=20
tc class=A0 add dev eth1 parent 1:33 classid 1:332 htb rate 200kbit cei=
l 500kbit=20
tc qdisc=A0 add dev eth1 parent 1:332 handle 332: sfq perturb 10
tc filter add dev eth1 protocol ip parent 1:33 prio 1 u32 match ip dst =
192.168.31.0/24 match ip sport 80 0xffff flowid 1:332=20
tc class=A0 add dev eth1 parent 1:33 classid 1:333 htb rate 50kbit ceil=
 80kbit=20
tc qdisc=A0 add dev eth1 parent 1:333 handle 333: sfq perturb 10
tc filter add dev eth1 protocol ip parent 1:33 prio 1 u32 match ip dst =
192.168.31.0/24 match ip sport 53 0xffff flowid 1:333=20
tc class=A0 add dev eth1 parent 1:33 classid 1:334 htb rate 150kbit cei=
l 500kbit=20
tc qdisc=A0 add dev eth1 parent 1:334 handle
 334: sfq perturb 10
tc filter add dev eth1 protocol ip parent 1:33 prio 1 u32 match ip dst =
192.168.31.0/24 match ip sport 110 0xffff flowid 1:334=20
tc class=A0 add dev eth1 parent 1:33 classid 1:335 htb rate 200kbit cei=
l 500kbit=20
tc qdisc=A0 add dev eth1 parent 1:335 handle 335: sfq perturb 10
tc filter add dev eth1 protocol ip parent 1:33 prio 1 u32 match ip dst =
192.168.31.0/24 match ip sport 443 0xffff flowid 1:335=20
tc class=A0 add dev eth1 parent 1:33 classid 1:336 htb rate 20kbit ceil=
 180kbit=20
tc qdisc=A0 add dev eth1 parent 1:336 handle 336: sfq perturb 10
tc filter add dev eth1 protocol ip parent 1:33 prio 1 u32 match ip dst =
192.168.31.0/24 match ip sport 23 0xffff flowid 1:336=20
tc filter add dev eth1 protocol ip parent 1:33 prio 1 u32 match ip dst =
192.168.31.0/24 flowid 1:330



That's the order on the script which loads these rules.

I would appreciate some tips.

Thanks in advance.



--
Paz e Bem
Bruno Linhares
