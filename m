From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack files
Date: Thu, 15 May 2008 09:30:28 -0300
Message-ID: <1210854629.23968.406.camel@kr0sty.1.com.ar>
References: <1210768892.2956.476.camel@kr0sty.1.com.ar>
	 <935fab200805141401k7aadcbeci65f2c830dda74b14@mail.gmail.com>
	 <1210802321.23968.41.camel@kr0sty.1.com.ar>
	 <935fab200805141557x676acc9cp79906826b8c428b7@mail.gmail.com>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200805141557x676acc9cp79906826b8c428b7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: finalglide@gmail.com, netfilter@vger.kernel.org


On Wed, 2008-05-14 at 15:57 -0700, Dave wrote:
> Actually, I think I might have misread your message, my eyes are
> getting to me after all this compiling.  I believe all of these items
> you are looking for are already in the new kernel.  No need to patch,
> just enable them in the network settings of the kernel.  I use make
> menuconfig usually.
> 
> Cheers
> -Dave
> 


I supposed that, some new modules were at kernel that never seen before
(like the "nf_"), but two problems appears, so may be I must be
forgetting something.

1) I use to load modules ip_conntrack_ftp, ip_conntrack_irc,
ip_conntrack_tftp, ip_conntrack_amanda  and ip_conntrack_sip; but there
aren't modules like nf_conntrack_amanda and so.

2) Connlimit looks like is missing something. Ex: 

# iptables -A FORWARD -s 10.10.28.0/24 -p tcp --dport 1024: -m connlimit
--connlimit-above 50 -j REJECT --reject-with tcp-reset

iptables: Invalid argument


That's why I think may still need old ip_conn[track/limit] pathces.
Don't I?


Thanks again for your support


Martin

