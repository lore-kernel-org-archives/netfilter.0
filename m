From: Erich Weiler <weiler@soe.ucsc.edu>
Subject: Re: IPTABLES port forwarding woes
Date: Fri, 30 May 2008 07:02:00 -0700
Message-ID: <484008D8.3080601@soe.ucsc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

> However why would you want to do so ? It would hide the real source 
> address from the SSH server on machine 2. Doesn't machine 2 use machine 
> 1's private address as default gateway ?

Ah, I forgot to mention, machine 2 is on a private network that is not
routed in any way.  So, there is no default gateway for machine 2...
That's why I was thinking the source port would have to be re-written
internally such that machine 2 would know to send it back through
machine 1 and then on to the internet... ?

