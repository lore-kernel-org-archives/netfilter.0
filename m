From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_ct_ftp: dropping packet
Date: Fri, 19 Mar 2010 15:37:14 +0100
Message-ID: <4BA38C1A.6050103@trash.net>
References: <201003191310.02079.mm@yuhu.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201003191310.02079.mm@yuhu.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marian Marinov <mm@yuhu.biz>
Cc: netfilter@vger.kernel.org

Marian Marinov wrote:
> Hello,
> I'm working for a fairly large shared hosting provider. Recently we decided to 
> upgrade the kernel of our servers to 2.6.33. However, during the testing phase 
> we started to see these messages in the logs:
>
> Mar 18 07:52:26 serv01 kernel: nf_ct_ftp: dropping packetIN= OUT=eth0 
> SRC=212.212.212.12 DST=204.16.203.11 LEN=53 TOS=0x10 PREC=0x00 TTL=64 ID=21858 
> DF PROTO=TCP SPT=21 DPT=47282 SEQ=1836474396 ACK=1448911219 WINDOW=23 RES=0x00 
> ACK PSH FIN URGP=0
>
> We don't have iptables LOG rules, this is generated directly from the kernel.
>
> 212.212... is not a real IP I have substituted it.
>
> Our kernel is 2.6.33 with GRsecurity patch.
>
> We don't have any problems with the ftp service, however the messages in the 
> log files are annoying. 
>
> Can someone tell me what can cause those?
The helper decided to drop a packet. This is usually cause by partial
FTP command matches, which can't be handled.
>  
>
> My current thoughts are to remove the printk from the kernel. But is there a 
> better solution?
>   
If you don't use logging, unload the ipt_LOG module.

