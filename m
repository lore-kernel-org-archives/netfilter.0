From: "Eric B." <ebenze@hotmail.com>
Subject: Re: Success routing mark'ed packets - but still confused why it didn't work the first time....
Date: Wed, 9 Apr 2008 16:39:47 -0400
Message-ID: <ftj9iu$4tc$1@ger.gmane.org>
References: <ftgq9j$mf$1@ger.gmane.org> <alpine.LNX.1.10.0804090612580.2229@fbirervta.pbzchgretzou.qr> <ftj951$3cv$1@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Eric B." <ebenze@hotmail.com> wrote in message 
news:ftj951$3cv$1@ger.gmane.org...
> "Jan Engelhardt" <jengelh@computergmbh.de> wrote in message 
> news:alpine.LNX.1.10.0804090612580.2229@fbirervta.pbzchgretzou.qr...

> Do the ip rules based on the fwmark work on the individual packet's mark 
> value or the conntrack mark, or both?

If both (as what it seems), why do you bother with the --restore-mark in the 
PREROUTING chain, if the connection is already marked anyhow?  And if not, 
then why do you not have a --restore-mark in both the FORWARD and OUTPUT 
chains?

Thanks,

Eric



