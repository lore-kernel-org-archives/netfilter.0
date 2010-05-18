From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: Help with ftp helper please
Date: Tue, 18 May 2010 15:27:00 +0200
Message-ID: <hsu4j4$svv$1@dough.gmane.org>
References: <r2ob376a78e1004240948ucaa6e2d5o5f65d4216f7ac936@mail.gmail.com> <4BD3E5F3.4070907@chello.at> <alpine.LSU.2.01.1004251108170.5896@obet.zrqbmnf.qr> <4BD413B9.90900@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD413B9.90900@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob schrieb:
> 
> Yes, if the OP would have looked up the original post correctly it would
> show exactly that.
> http://eeek.borgchat.net/lists/netfilter/msg47205.html
> Putting the global RELATED rule, of course makes most of the rules
> obsolete (which fits in most cases), but that example was to show how to
> use the (ftp) helper match, if one chooses to split things up for
> whatever reason.

Hi Mart,

I use the helper too. And the reason is that i do not want that pakets 
are accepted, which are not related to ftp.

--sport 1024: --dport 1024: ACCEPT

means to accept mostly all pakets. But thats not what i and jeff want. I 
think it is a security risk. I am not sure whether this works, but for 
example if you connect to someone over any service and the remote host 
try to connect to you back (RELATED,ESTABLISHED) but not only to the 
original service, but also to your ftp service.

The next advantage is that my monitoring is not affected. I am using 
<iptables -L -n -v> to watch which chain has traffic and sometimes i 
found security holes over this monitor. If all traffic goes over my ftp 
rule, than this does not work.

regards Markus

