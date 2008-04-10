From: "Eric B." <ebenze@hotmail.com>
Subject: Re: Success routing mark'ed packets - but still confused why it didn't work the first time....
Date: Wed, 9 Apr 2008 23:13:48 -0400
Message-ID: <ftk0o3$45q$1@ger.gmane.org>
References: <ftgq9j$mf$1@ger.gmane.org> <alpine.LNX.1.10.0804090612580.2229@fbirervta.pbzchgretzou.qr> <ftj951$3cv$1@ger.gmane.org> <alpine.LNX.1.10.0804092310390.17930@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Jan Engelhardt" <jengelh@computergmbh.de> wrote in message 
news:alpine.LNX.1.10.0804092310390.17930@fbirervta.pbzchgretzou.qr...
>>Do the ip rules based on the fwmark work on the individual packet's mark
>>value or the conntrack mark, or both?
>
> routing rules work on packet mark ("nfmark" "fwmark"), whch is
> why --restore-mark is needed.

But then, do you not need a --restore-mark in both the FORWARD and OUTPUT 
chains?

-t mangle -A FORWARD -m connmark --mark 0 -m conntrack --ctstate NEW -j 
prefout
	-t mangle -A OUTPUT -m connmark --mark 0 -m conntrack --ctstate NEW -j 
prefout

Or are you simply marking the connection and expecting the system to 
randomly choose whether to output on ppp0 or ppp1?

Thanks,

Eric




