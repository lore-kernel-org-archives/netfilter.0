From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and CONNMARK
Date: Tue, 06 Oct 2009 13:53:04 +0200
Message-ID: <4ACB2FA0.30301@duet.it>
References: <4AC9BD2E.301@duet.it> <4AC9FF4E.5010307@unipex.it> <4ACA04DF.3030006@duet.it> <4ACA1D55.1020304@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACA1D55.1020304@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

hello,
> For me it's better if you use different marks.

I note that packets are marked correctly but in the wan interface tc 
filter send them on the wrong class. is the same problem you had it?
>
> After, where do you mark the packets (in iptables)? iptables/kernel
> version?
I mark packets in iptables (mangle table PREROUTING chain):

iptables -t mangle -A PREROUTING -p TCP -m mac --mac-source 
xx:xx:xx:xx:xx:xx--dport 443 -j MARK --set-mark 8

iptables version: 1.4.3.2
kernel version: 2.6.29.3

both patched to use IMQ devices.
>
> Normally I don't use connmark because when I try some time ago to use
> it, I found some "not marked" problems, so I switch to classid. Better
> and cleaner for me.
what kind of problems? What do you mean with "I switch to classid" ?

thanks in advance,
Fabio
