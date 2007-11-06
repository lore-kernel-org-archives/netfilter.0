From: "ron lai" <ronlai@cs.stanford.edu>
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 2.6.22.6
Date: Tue, 6 Nov 2007 05:50:24 -0800
Message-ID: <001801c8207c$00307b70$6500a8c0@ronPc>
References: <001601c81ccc$682bb4a0$bb0b10ac@FireEye.com> <47303E9D.2050909@trash.net> <001e01c82077$b4d67610$6500a8c0@ronPc> <47306B0E.7050401@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

My ruleset is
iptables -t nat -A POSTROUTING -s 172.16.119.91 -j SNAT --to-source 
172.16.255.123

I am using a bridge containing only one physical interface and the FTP 
traffic goes through the bridge.

Ron
----- Original Message ----- 
From: "Patrick McHardy" <kaber@trash.net>
To: "ron lai" <ronlai@cs.stanford.edu>
Cc: <netfilter@vger.kernel.org>; <netfilter-devel@vger.kernel.org>
Sent: Tuesday, November 06, 2007 5:24 AM
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 
2.6.22.6


> ron lai wrote:
>> No, I am not using any patch. Is there any debug info I can turn on to 
>> see why the helper gets invoked twice?
>
>
> Nothing really useful. Please post your ruleset and other setup.
> Are you using a bridge?
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 

