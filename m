From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: Re: ip conflict with proxy arp
Date: Tue, 29 Oct 2002 17:06:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029170631.43845b12.arc_of_descent@gmx.net>
References: <20021029122844.6b1e70ca.arc_of_descent@gmx.net>
	<20021029085844.GBUS1554.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021029085844.GBUS1554.mta07-svc.ntlworld.com@there>
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

Antony Stone <Antony@Soft-Solutions.co.uk> thus wrote:
> On Tuesday 29 October 2002 6:58 am, Rohan Almeida wrote:
> > Noy my setup is such, that a user on the LAN,
> > would like to have an ip from the 172.16.2.0/24 network.
> 
> What, whilst still plugged in to eth1 ?   Why ?

Honestly, i have no clue,
Its just a network setup which I have
to solve somewhere.
I tried explaining them the problem but
they are adamant on using the existing setup.
 
> How are you allocating your addresses on the two networks at the moment ?
> 
> If it's a system administrator handing out static addresses and recording 
> who's got what, then tell the person on the LAN to go to the sysadmin and ask 
> for an unused address.
> 
> If it's a DHCP server handing out addresses on request, try setting up a 
> DHCRELAY (there's another thread going in this mailing list at the moment 
> about getting that working with netfilter) so pass addresses from one network 
> to the other.

Its a DHCP server
I'll take a look at DHCPRELAY.
Maybe it can help me
Thanx

--
arc_of_descent

