From: Pawel Hadam <Pawel.Hadam@imag.fr>
Subject: Re: ROUTE and source IPv6 routing - how ?
Date: Tue, 2 Dec 2003 11:13:01 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.33.0312021106510.4651-100000@horus.imag.fr>
References: <1070352120.1383.9.camel@descartes>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070352120.1383.9.camel@descartes>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cedric de Launois <delaunois@info.ucl.ac.be>
Cc: netfilter@lists.netfilter.org

> > I have two hosts and both have two NICs.
> > CLIENT: eth0 - ipc0 = 2001:660:5301:26:2c0:9fff:fe1a:caca
> >         eth1 - ipc1 = 2001:688:1fa1:2:204:75ff:fef8:93a4
> > SERVER: eth0 - ips0 = 2001:660:5301:26:210:5aff:febe:bb78
> >         eth1 - ips1 = 2001:688:1fa1:2:204:75ff:fee8:52fd
> >
> You have to add an entry in your routing table saying that destination
> 2001:688:1fa1:2:204:75ff:fee8:52fd is reachable through iface ipc0.
> Otherwise the ROUTE target can't figure out whether the destination
> is on-link or gateway'ed.
> Try with something like this :
>   ip -f inet6 route add 2001:688:1fa1:2:204:75ff:fee8:52fd dev eth0
> Same remark applies for case 3).

Hmm... thank you for your proposal, but is does not seem to be the
solution for my problem. Should I add routing entries for ALL IPv6
addresses that I would like to access through ipc0 ??? I would like to
have an access to the whole internet via both ipc0 and ipc1, but
depending on the binding in the client software. So, when I bind my client
to ipc0, I access all the internet via ipc0. When I bind my client to
ipc1, I access all the internet via ipc1.
My example above it was only my local testbed.
Is it possible?

Regards
Pawel


