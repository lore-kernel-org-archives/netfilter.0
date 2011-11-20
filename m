From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: htb + prio trouble (additional info)
Date: Sun, 20 Nov 2011 13:10:03 -0600
Message-ID: <op.v49d61oxx1lyi3@debiandesk2.net>
References: <op.v49c0wstx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v49c0wstx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

On Sun, 20 Nov 2011 12:44:46 -0600, Lloyd Standish <lloyd@crnatural.net> wrote:

> Hello All,
>
> While configuring a load-balancing router, I have run into trouble setting up traffic shaping (at least the load-balancing is working!)
>
> I am trying to:
> (1) limit total upload speed to somewhat below the interface bandwidth
> (2) do some traffic shaping, particularly avoid queuing of VOIP packets.
>
> To accomplish this I am trying to create a HTB qdisc on each outward-facing interface, each containing a PRIO qdisc with the default 3 classes.  sfq qdiscs are created for each PRIO class.

PS I should point out that in this case VOIP and DNS traffic should always have priority, even at the expense of some bandwidth and/or hurting other flows. I will look for better ways to filter for VOIP traffic.
