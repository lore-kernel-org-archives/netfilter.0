From: bdameron@tscnet.net
Subject: Re: Packet forwarding.
Date: Wed,  7 Apr 2004 13:04:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081368257.40745ec12d828@mail.tscnet.net>
References: <1081357206.4074339639b86@mail.tscnet.net> <200404071814.34654.Antony@Soft-Solutions.co.uk> <1081358721.40743981919b2@mail.tscnet.net> <200404071837.29160.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404071837.29160.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Quoting Antony Stone <Antony@Soft-Solutions.co.uk>:

> On Wednesday 07 April 2004 6:25 pm, bdameron@tscnet.net wrote:
> 
> > > If you tell us what your rules are and give us some more detail about
> > > your network setup, we might be able to help, however a better solution
> > > for you is to look at some of the excellent documentation available to
> > > learn how to do it yourself.   This is not a hard problem, and you will
> be
> > > able to manage your system much better in future if you understand more
> > > about how it works.
> > >
> > > One very important detail which is not clear from your description above
> > > is: where is the "client machine" located?
> >
> >   Client machine being anyone from the outside world. And I have looked
> > over some of the documentation. Basically there is no current firewall
> > policies. Just want anything coming in on xxx.xxx.xxx.xxx:443 (Internet
> > Machine) to be routed to 10.10.1.110:443 (Internal Lan Machine).
> >
> > Looks like I need to mangle the packet header so that the Lan machine
> thinks
> > that the Internet machine is sending the packet and then have the Internet
> > machine redirect the packet to the client. Client again being someone on
> the
> > Internet. Not sure if this can be done or not. Correct me if I am wrong.
> 
> With all due respect, yes, you are very wrong.   This is a simple "nat + 
> forward" situation.
> 
> Since you haven't said what your ruleset is, I shall assume none, and give
> you 
> an example of how to make work what you have asked for:
> 
> iptables -F
> iptables -F -t nat
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 443 -d 10.10.1.110 -j ACCEPT
> iptables -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to 10.10.1.110
> 
> If eth0 is not your external interface then change it in the above two rules
> 
> for whatever your external interface is.
> 
> Regards,
> 
> Antony.
> 

I found an easier way to do this. xinetd can do port redirect. Worked perfectly.
Thanks for your help.

-- 
Thank you,
Brad Dameron

