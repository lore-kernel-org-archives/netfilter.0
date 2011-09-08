From: Marco Coda <marco.coda7@gmail.com>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 8 Sep 2011 16:00:26 +0200
Message-ID: <CAGRr-qn=ngiO6oNdecnpa5BRcTBEJuZzd3g+JOk015P84JV0JA@mail.gmail.com>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>
	<4E688763.2060209@freemail.hu>
	<CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>
	<4E68A50B.5000901@freemail.hu>
	<CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>
	<4E68B39D.60703@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=arx8TuJdlxuHkRjzdc+UNzdKhN8yF18QPsXlr1c43YE=;
        b=Tj+XqqKlnfZrD6eCzqC2m9mF3+beWx+UZ86tMo3aKZvFTtLqKzretGPWAxeDIADb6U
         e7DJna8ya0/AmX2LlvpfX+Bmc/zof/SNr0j22wsmvp6h25TsmNXUWi0YdRbCfQurSSu7
         9/c5GrSpfX33uEMLhcnHwWBcjt6AOQ8PuP2hk=
In-Reply-To: <4E68B39D.60703@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2011/9/8 G=E1sp=E1r Lajos <swifty@freemail.hu>:


> - If you send an e-mail then you connect from your system (from a ran=
dom
> port) to a mail server (to 25)...
> Would you try with my proposed settings???

I just tried it, with rare 1Mbit, bandwidth 2 Mbit and iptables with
--dport 25 and, even if the iptables rule is matched (I can see the
packet count measuring the right size of the mail), tc seems to ignore
those packets. I know that my postfix open a connection to another mta
from a pseudo-random port to 25, but with --dport option tc does not
consider these packets. Instead, with --sport option, I don't know
why, something is filtered...

> - If you set your upload limit to 10kbit then you can send 1,25KByte =
per
> sec. (It is veeerrryy slooow.)

In this moment I set this speed so I can test the server with small
attachments... When the script will be definitively complete,I'll set
the real values..


2011/9/8 Nikolay Kichukov <hijacker@oldum.net>:

> tc does not require iptables to shape traffic at all. So why botherin=
g?

I want to limit only one port, not the entire interface. I don't want
other ports (such as pop3 or imap) limited
So I used iptables for marking and then tc filter handle fw for filteri=
ng..
How should i do?
