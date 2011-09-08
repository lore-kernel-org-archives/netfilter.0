From: Marco Coda <marco.coda7@gmail.com>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 8 Sep 2011 17:38:00 +0200
Message-ID: <CAGRr-qmSVgcvyCOPWki-i4ycfTg8xOdLHBYxJj7cFHtxP=kMUw@mail.gmail.com>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>
	<4E688763.2060209@freemail.hu>
	<CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>
	<4E68A50B.5000901@freemail.hu>
	<CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>
	<4E68B39D.60703@freemail.hu>
	<CAGRr-qn=ngiO6oNdecnpa5BRcTBEJuZzd3g+JOk015P84JV0JA@mail.gmail.com>
	<4E68D7C3.9010005@oldum.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=7e5K5c+I8BPaKEHP923SMLbVTmY9LZ3zjKZhsMDXmEY=;
        b=AGLx/C++3SHyUMSrBEy/KtciXfjuXNmWjRS6WmPRa7I9k/+BNN2mNIpyDNnuanVt+j
         WuU00H1ZhsGQE4KlgWpWVU3VdviuckyFveDqXpHdWEolW1gvi7cSKqwSoj8m8oBbM2EQ
         nWLolL4p9ZK7W7AjDMOqPVIRVm6E3qOGKeECA=
In-Reply-To: <4E68D7C3.9010005@oldum.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2011/9/8 G=E1sp=E1r Lajos <swifty@freemail.hu>:

> Do you see the connection in conntrack??? With the mark=3D1 value???
Unfortunately this server now is in a private and close lan, not
accessible ftom or to the Internet, so I cannot install conntrack
I set up a system with one dns, one client and another postfix for test

> Maybe too low values would disable the tc?!? (I am really not sure ab=
out
> it... :D )

Before I tried also wit different values: all the ten's multiples
untill 100, to see if the 48x factor is costant also with other speed.
And no, is not constant: it increase as an exponential curve!


2011/9/8 Nikolay Kichukov <hijacker@oldum.net>:

> #create engress htb shaper:
> tc qdisc add dev $IF root handle 1: htb
> #setup some iface limits
> tc class add dev $IF parent 1: classid 1:1 htb rate ${MAXOUT}kbit cei=
l ${MAXOUT}kbit burst 50kb
>
> #add subclass for your application attached to the root class 1:1 - 1=
:10, set proper ceil value!
> tc class add dev $IF parent 1:1 classid 1:10 htb rate 128kbit ceil ${=
MAXOUT}kbit prio 1 burst 5kb
>
> #then just add filters, in that case port 53 - DNS
> tc filter add dev $IF parent 1:0 protocol ip prio 10 u32 match ip dpo=
rt 53 0xffff flowid 1:10

Your script seems work better than mine: the speed now is 20Kbps, and
not value as 480kbps as before with my commands!, even if I set
10kbits, both as ceil and rate:

IF=3Deth0
MAXOUT=3D10kbit

tc qdisc add dev $IF root handle 1: htb
tc class add dev $IF parent 1: classid 1:1 htb rate $MAXOUT ceil $MAXOU=
T
tc class add dev $IF parent 1:1 classid 1:10 htb rate 10kbit ceil $MAXO=
UT
tc filter add dev $IF parent 1:0 protocol ip prio 10 u32 match ip
dport 25 0xffff flowid 1:10

I erase priority and brust part, At the moment don't mind brusting the
connection or assign a priority.
