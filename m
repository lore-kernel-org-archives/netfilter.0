From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: multiple public ips to multiple internal ips
Date: Sun, 31 Jan 2010 22:15:29 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001312213300.29147@aurora.sdinet.de>
References: <4B64A040.2080300@perfaction.net> <4B65264D.8040508@perfaction.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B65264D.8040508@perfaction.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Chemla <patrick.chemla@perfaction.net>
Cc: netfilter@vger.kernel.org

On Sun, 31 Jan 2010, Patrick Chemla wrote:

> I would like to add a question:
> 
> I am quite a newbie in this field.
> 
> If one of my network interface is connected to the public side, and 
> receive 16
> public ips from my ISP, do I have to declare 16 alias to my network 
> interface?
> 
> If there are 128 ips, I should declare 128 aliases???

Why not just route the real ips on to the real servers? Why use 
internal IPs for the servers and DNAT at all on their public side?

Filtering can happen just as good on the real IPs, no need to hassle
with NAT.

c'ya
sven

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
