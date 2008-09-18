From: "julien vehent" <julien@linuxwall.info>
Subject: Re: Possibilities and performance of conntrackd, NATing cluster
Date: Thu, 18 Sep 2008 09:26:46 +0200
Message-ID: <66c343c00809180026m36cc868bpf86ea32f104df7ce@mail.gmail.com>
References: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com>
	 <48CFFE1A.2070205@riverviewtech.net> <48D0DD27.70109@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=umKzap77Ke56tPil1e7UMeOPCq4vO9BURgt7BIhVlB0=;
        b=IifRkIZ2M9kuGGbniybXHDrRAApFomS1Y1ztKkb4zolmPQgQV3vwi8LGJnyESJqJEt
         lBMuR2DAwWHiit0rCMVjCkbmzifqpv/sxuY3o/scMQ2fnIKr6hSzK6/axGHTbsT08FfC
         8yOo9e0SgnRYlV4bylD3zwFfRW+rsLma+77xQ=
In-Reply-To: <48D0DD27.70109@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

That sounds really interesting.
Pablo : do you have more information/articles on what is done around
conntrackd and how to set it up in a test bed environment ?
I saw you published a paper earlier this year about that, but it's not
available online. Is there any way to get it ?

2008/9/17 Pablo Neira Ayuso <pablo@netfilter.org>
>
> Grant Taylor wrote:
> > On 09/16/08 09:16, icovnik wrote:
> >> I'd like to create high available and high performance router cluster.
> >> Currently I use 1 router performing NAT running on 2.6 kernel. The
> >> router slowly reaches its capacity limit, so I'd like to add another
> >> router (or two) and create a cluster from those routers. I came
> >> accross conntrack-tools which seems to offer some possibilities here -
> >> simply synchronize all router's stacks and distribute traffic to all
> >> routers. Each router would know everything about each connection, so
> >> each of them would "know" what to do witch each packet. I would simply
> >> distribute the traffic to all routers and they would do the job.
>
> If you are refering to an asymmetric setup where the packets can be
> filtered by whatever node, it's likely that you'll experience problems.
> The daemon `conntrackd' is asynchronous, so there are race conditions
> between the packets and the state updates, ie. one of the firewall nodes
> may receive a packet but its state may not be up-to-date yet.
>
> >> I saw this functionality in Checkpoint few years ago. Is it possible
> >> to do this witch linux kernel and conntrackd?
>
> The way to go is a symmetric setup where all nodes receives the packets
> and only one firewall node handles them. This can be achieved by means
> of hash-based load-sharing. There's some works on that direction.
>
> >> Does conntrackd do this in real-time?
>
> It's soft real-time. conntrackd does its best here. A hard real-time
> approach would harm performance in terms of latency and bandwidth.
>
> > With how many routers?
>
> Limit? I don't know yet, I'm still testing with only two nodes, but I
> expect to do it with up to four. Moreover, the replication approaches
> still require a small change in the code to cleanly support more than
> two nodes.
>
> > Purportedly this can be done with Linux using the help of conntrackd.
> >
> > I know that you can do Active / Standby with conntrackd and I believe
> > that you can do Active / Active as well.  It is my understanding that
> > conntrackd broadcasts connection state on a separate network connection.
> >  I believe that the routers participating in the conntrackd failover
> > usually have three (or more) network cards on them, one internal and one
> > external interface as well as an additional separate interface just for
> > connection state information.  I /believe/ that conntrackd works by
> > using multicast to advertise it's state changes to other systems that
> > then decide what to do with the information.
>
> This is right.
>
> > I'm thinking that you could have three systems set up like this if you
> > wanted to.  I'd expect that if you were using Active / Active you could
> > have one system doing the inbound traffic and another doing outbound
> > traffic with the third as a backup system in case one of the other two
> > went down.
>
> This is asymmetric multipath, it is not really a good idea and also
> you'll waste lots of resources in the replication. Therefore, if your
> intention is to improve scalability, this won't help. The way to go is
> the symmetric setup.
>
> > Remember that your traffic should (in an ideal world) pass through the
> > same router (as far as IP is concerned) going both directions (symmetric
> > routing) but is not required to.  With this in mind I'd recommend
> > something like VRRP for the internal and external interfaces where one
> > router is primary for the internal and outgoing interface and the other
> > router is primary for the external and incoming interface.  Using VRRP
> > will make things easier for upstream routers as well as down stream
> > devices because even if things fail over to the other router the MAC
> > address that they are communicating with will stay the same.  As an
> > aside I'd recommend that you have an IP per system plus an IP for the
> > logical VRRP router its self.  So if you are using three boxen plus the
> > VRRP you will need four IPs per subnet to do this.
>
> This is a description for the asymmetric setup, isn't it?
>
> --
> "Los honestos son inadaptados sociales" -- Les Luthiers
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
