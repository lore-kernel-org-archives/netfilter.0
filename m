From: Michele Codutti <michele.codutti@uniud.it>
Subject: Re: ClusterIP network slowdown
Date: Wed, 01 Dec 2010 10:11:48 +0100
Message-ID: <1291194708.2467.59.camel@nerino>
References: <1291107610.2488.46.camel@nerino>
	 <AANLkTi=NnAvZ0A+St0zH9W8GUR0dpzAxJAa4XCx4YxXW@mail.gmail.com>
	 <1291132819.2488.127.camel@nerino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1291132819.2488.127.camel@nerino>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edison Figueira <efjgrub@gmail.com>
Cc: netfilter@vger.kernel.org

I forgot to tell you that heartbeat lost lots of udp packets that are
used to transport the heartbeat signal (on all interfaces). Also the
slowdown is perceptible also on the private network interfaces (the ones
that are not used by clusterip and are not connected to the same
switch).
It seems that the invalid packet make clusterip make the entire
networking subsystem slow not only on the network interface where i
configured it.
Any hints? I desperately need them! ;)

Il giorno mar, 30/11/2010 alle 17.00 +0100, Michele Codutti ha scritto:
> Hi Edison, you're right, all the host on the same switch can see the
> packages directed to the clusterip. But this is not a problem because
> these other hosts are not affected by the slowdown. The only affected
> nodes are the ones that are using the clusterip.
> I cannot modify any configuration of any switch on my network without a
> long process for approval i can not try to enable the igmp snooping
> without a strong argument. How can igmp snooping relief some load on the
> clustered hosts? 
> There are any kernel parameters that i can tune to make clusterip behave
> better?
> I'm sorry for being so pedant but i need some precise technical
> information to modify something in my network.
> 
> Thanks.
> 
> Il giorno mar, 30/11/2010 alle 10.59 -0200, Edison Figueira ha scritto:
> > Hi Michele,
> > 
> > Both cases is because the CLUSTERIP uses broadcast addresses to
> > work, in the first case the message is because the packet is sent to
> > two machines and one of them always drops in order, to solve this
> > just disable debug netfilter.
> > 
> > The second case is probably because all the packages that are
> > being sent to the CLUSTERIP are being copied to all
> > ports on your switch, to confirm this do a tcpdump on any workstation.
> > 
> > The solution to this case is, enable "IGMP snooping" on your switch.
> > 
> > Att
> > 
> > Edison Figueira Junior
> > 
> > 2010/11/30 Michele Codutti <michele.codutti@uniud.it>
> > >
> > > Hello, in these days i had fun with the ClusterIP target associated to a
> > > web server. All is good and bright with the exception of two issues:
> > > - the message "CLUSTERIP: no conntrack!"
> > > - a general slowdown of the other network services (like ssh) of the two
> > > nodes of the cluster.
> > > To solve all my problems i've inserted this iptables rule:
> > > iptables -I INPUT 1 -m state --state INVALID -j DROP
> > > This is a solution that isn't good enough because i manage the apache2
> > > and the clustered ip with heartbeat2.
> > > Example: if i standby a node (for maintenance) and resume it after a
> > > while this can be a problem because heartbeat put the clusterip rule on
> > > top of the others so the dropping rule above became the second one and
> > > then the workaround had no effect.
> > > Why the clusterip had such an heavy impact on the networking? Before the
> > > clusterip my cluster was active-standby and i've got no problems at all.
> > > Now that the load per node is halved i noticed more load than before.
> > > The strangest thing is that (with the top tool) this load seem not exist
> > > and the nodes are not loaded at all:
> > > load average: 0.50, 0.36, 0.37
> > > How can i fix this without the dropping rule above?
> > > There is a way to see how the networking is loaded?
> > >
> > > Thanks in advance.
> > >
> > > Michele
> > >
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


