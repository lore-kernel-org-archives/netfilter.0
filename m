From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip conflict with proxy arp
Date: Tue, 29 Oct 2002 08:58:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029085844.GBUS1554.mta07-svc.ntlworld.com@there>
References: <20021029122844.6b1e70ca.arc_of_descent@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021029122844.6b1e70ca.arc_of_descent@gmx.net>
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

On Tuesday 29 October 2002 6:58 am, Rohan Almeida wrote:

> HI,
> I've got a proxy arp setup with iptables and tc.
>
> on eth0 i have a route to 172.16.2.0/24 network
> on eth1 is the LAN of 172.16.1.0/24 network
>
> I have enabled proxy arp on both interfaces.
> Now accordingly, the interface will respond
> to all ARP requests for which it has a route to.
>
> Noy my setup is such, that a user on the LAN,
> would like to have an ip from the 172.16.2.0/24 network.

What, whilst still plugged in to eth1 ?   Why ?

> But unfortunately, when he tries to allocate an
> ip like 172.16.2.1 he gets an ip conflict.
>
> I also know why he is getting it!
> But is there any way out of this??
>
> Something like, tell the linux server to respond for
> ARP requests for the 172.16.2.0/24 network but at the
> same time if a machine is trying to use an ip for itself,
> then it should not respond.

How are you allocating your addresses on the two networks at the moment ?

If it's a system administrator handing out static addresses and recording 
who's got what, then tell the person on the LAN to go to the sysadmin and ask 
for an unused address.

If it's a DHCP server handing out addresses on request, try setting up a 
DHCRELAY (there's another thread going in this mailing list at the moment 
about getting that working with netfilter) so pass addresses from one network 
to the other.

However, I still want to ask: why does someone on eth1 want an IP address 
which belongs on eth0 ?

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

