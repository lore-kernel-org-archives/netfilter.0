From: "Nishit Shah" <nishit@elitecore.com>
Subject: RE: sequence of matches in a single rule
Date: Sat, 17 May 2008 12:51:41 +0530
Message-ID: <002801c8b7ee$a72b2060$f5816120$@com>
References: <001501c8b7e0$8ef50a00$acdf1e00$@com> <alpine.LNX.1.10.0805170905070.15590@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805170905070.15590@fbirervta.pbzchgretzou.qr>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jan Engelhardt' <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org



-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Jan Engelhardt
Sent: Saturday, May 17, 2008 12:36 PM
To: Nishit Shah
Cc: netfilter@vger.kernel.org
Subject: Re: sequence of matches in a single rule


On Saturday 2008-05-17 07:40, Nishit Shah wrote:

>Hi,
>	Is there any specific order in which match will take place ?

Yes. For -m conntrack and -m mark however, it does not matter,
as no internal state is modified. It does matter however,
for example, with -m statistic --mode nth and -m quota.

So, can I have that order somewhere mentioned or I need to go through source
code ? If I write some of my own match do I have any way to change the match
preference ? 
	The reason I am asking is, there are some matches that are CPU
incentive and some are not. For an example I prefer -m mark to always take
precedence before -m limit or -m hashlimit, something like that..
	Or is it more preferable to not use such thing in single rule and
prefer 2 iptables rules for that ?

Rgds,
Nishit Shah. 



