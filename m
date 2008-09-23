From: icovnik <icovnik@gmail.com>
Subject: Re: Possibilities and performance of conntrackd, NATing cluster
Date: Tue, 23 Sep 2008 12:05:23 +0200
Message-ID: <fc69e1200809230305p267126cbgadfa5fb67a11296c@mail.gmail.com>
References: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com>
	 <48CFFE1A.2070205@riverviewtech.net> <48D0DD27.70109@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=kIxf4BYApyzW0ryJMZHP40c4tMBotclvpL0jNmraLMs=;
        b=XtDqSS2vkpXhq2S1IR7J2IyAOFTZ46/ICcM6Jrg5w4EVxwgkcLY7O4PMOx7G38IL54
         CTOgSl6zzIMT+F3sTaoY2TjEOIL8PcG/AudsUeAa4U+0goGfs+52MYXXJogmYScd7Ic2
         kAtaObWT0R6vqMFELB0Se+jRlsRvezVN992to=
In-Reply-To: <48D0DD27.70109@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Now only to clarify that I understand it correctly:

Asymmetric setup: Any router receives any of packets. All routers have
the same information about all connections in cluster, so it doesn't
matter which of them handles which connection.

Symmetric setup: Once the connection is setup on RouterX, the whole
connection should be handled by that very same router.

Is this correct?

On Wed, Sep 17, 2008 at 12:34 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> The way to go is a symmetric setup where all nodes receives the packets
> and only one firewall node handles them. This can be achieved by means
> of hash-based load-sharing. There's some works on that direction.

How is it possible to have only one firewall to handle packets in
cluster? Is it like in the setup in the testcase
(http://conntrack-tools.netfilter.org/testcase.html)? If I understand
it correctly, it means to have only one active firewall/router and one
passive waiting for failure. How is ti possible to scale to higher
loads?

Can you point me also to some info about hash-based load-sharing?

>> With how many routers?
>
> Limit? I don't know yet, I'm still testing with only two nodes, but I
> expect to do it with up to four. Moreover, the replication approaches
> still require a small change in the code to cleanly support more than
> two nodes.

If the load-sharing works (with more than two nodes maybe) I'd like to
test it. If it proves to work I can test it in real world scenario
with real ISP traffic. We are currently moving to new office so I can
post some results from testing in few weeks.

>> I know that you can do Active / Standby with conntrackd and I believe
>> that you can do Active / Active as well.  It is my understanding that
>> conntrackd broadcasts connection state on a separate network connection.
>>  I believe that the routers participating in the conntrackd failover
>> usually have three (or more) network cards on them, one internal and one

Yes, active/active is what I want.

> This is asymmetric multipath, it is not really a good idea and also
> you'll waste lots of resources in the replication. Therefore, if your
> intention is to improve scalability, this won't help. The way to go is
> the symmetric setup.

Can you write more about this? I'd like to test this setup.

>> routing) but is not required to.  With this in mind I'd recommend
>> something like VRRP for the internal and external interfaces where one
>> router is primary for the internal and outgoing interface and the other
>> router is primary for the external and incoming interface.  Using VRRP

Hm this is interresting - split incoming/outgoing traffic to separate
routers. Maybe the conntrackd can be used in this scenario. I would
test it.

ico
