From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 13:57:16 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040713205716.58900.qmail@web40707.mail.yahoo.com>
References: <200407131901.21907.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407131901.21907.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Why should ICMP not be completely blocked? The machine
is used strictly as a port forwarding firewall/router.

Also it does appear to be arp related. On the fireawll
the arp -a does not keep the connecting host in its
cache for long.  If I connect I see it, but after a
few minutes it disappears.  Is there anyway to fix
that?



--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Tuesday 13 July 2004 5:51 pm, Real Cucumber
> wrote:
> 
> > I have a fedora firewall/router using iptables to
> > forward incoming SSH packets to an internal server
> and
> > it works great....however, only if the user does
> not
> > remain idle for 1 minute.  If they idle for 1
> minute,
> > the connection "freezes"
> >
> > If the user is connecting from within the network,
> > they can remain idle for an unlimited amount of
> time
> > without being disconnected.  It is only ones
> > connecting from outside hte network going through
> the
> > iptables firewall that have this idle problem.
> >
> > I am only allowing TCP and UDP for SSH to be
> > forwarded.
> 
> I assume you mean TCP for SSH and TCP/UDP for DNS?  
> (You don't need UDP for 
> SSH...)
> 
> > Do I need any ICMP or any other special connection
> > timeout rules on the iptables side to fix this
> problem?
> 
> You should not completely block ICMP, although I
> regard that as a side issue 
> and not necessarily the cause of your problem.
> 
> It sounds like an ARP cache timeout problem to me.
> 
> Try the following test:
> 
> 1. Connect from an external client to the internal
> SSH server.
> 2. Log in on the console of the SSH server (ie: not
> using the SSH connection) 
> and start a ping to the firewall (I don't care
> whether it gets replies or 
> not).
> 3. Type some command on the SSH client and check you
> get a response.
> 4. Wait >1 minute and then type another command on
> the SSH client and check 
> you still get a response.
> 5. Cancel the ping test from the SSH server to the
> firewall.
> 6. Wait >1 minute and then type another command on
> the SSH client and see if 
> the connection has died.
> 
> If the above confirms that during a ping, the
> connection is maintained, and in 
> the absence of a ping, the connection dies, then it
> strongly suggests that 
> the firewall is losing the MAC address of the SSH
> server after a period of no 
> activity (or perhaps the SSH server loses the MAC
> address of the Firewall - 
> check both arp caches with "arp -an" on each machine
> to find out).
> 
> It might help to post your ruleset so we can comment
> on anything we see that 
> might cause this problem.
> 
> Regards,
> 
> Antony.
> 
> -- 
> Microsoft may sell more software than any other
> company, but McDonald's sell 
> more burgers than any other company, and I think the
> other similarities are 
> obvious...
> 
>                                                     
> Please reply to the list;
>                                                     
>       please don't CC me.
> 
> 
> 



		
__________________________________
Do you Yahoo!?
Take Yahoo! Mail with you! Get it on your mobile phone.
http://mobile.yahoo.com/maildemo 

