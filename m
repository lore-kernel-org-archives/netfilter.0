From: "Ian C. Sison" <ian.s@qsr.com.ph>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 21:09:09 +0800 (PHT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33L2.0207082103090.4703-100000@jeprox.qsr.com.ph>
References: <0GYW00K53KXH59@l-daemon>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <0GYW00K53KXH59@l-daemon>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


On Sun, 7 Jul 2002, Jack Bowling wrote:

> ** Reply to message from Antony Stone <Antony@Soft-Solutions.co.uk> on Mon, 08 Jul 2002 00:04:34 +0100
>
>
> > On Sunday 07 July 2002 11:54 pm, Dennis Cardinale wrote:
> >
> > > When running a netfilter firewall, is there any reason to continue using
> > > the hosts.deny and hosts.allow files, or is this just superfluous?
> >
> > hosts.allow can still be useful to specify a command to run when a connection
> > comes in (eg to provide some special logging ?), but these files don't add
> > any security to a decently configured netfilter setup.
>
> Beg to differ. /etc/hosts.deny allows access tuning of services that
> are set wide open on the firewall, ssh being a prime example.

setting up a world-allow connection to the openssh port is the problem.
It's shouldn't be done at all.

One should use the iptables INPUT rules to filter ssh connections per IP,
which is equivalent to the functionality of hosts.[allow|deny]

Not only that, with iptables INPUT, the proper response will be given
(connection refused for iptables, vs. connection accepted... connection
closed for tcp_wrappers)

tcp_wrappers is old technology and should be deprecated.




