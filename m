From: Jason Opperisano <opie@817west.com>
Subject: Re: One Nic; Multiple Subnets
Date: Mon, 27 Dec 2004 11:52:42 -0500
Message-ID: <1104166362.6322.26.camel@hubcap.ljm.dom>
References: <41CC19DF.2766.F2FCB6D@localhost>
	<8ca4228204122708388845e28@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca4228204122708388845e28@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Mon, 2004-12-27 at 11:38, Mike wrote:
> I've been looking through the monthly archives of this list, but I
> can't find the needle in the haystack.  I saw this question answered
> before, and I'm hoping I'll see it again.  :-)
> 
> I have an old slackware routerbox that only has room for 2 nics.
> Right now there are two nics. in it and they are set up like so:
> 
> eth0 --> Internet (Dynamic IP: Assigned by ISP)
> eth1 --> Lan  (Gateway Interface:  192.168.1.1)
> 
> I will soon be joining some computers from another LAN into the one
> mentioned above.
> I will need to set up security measures so that the new computers will
> not be hacked or viewed by the other users on the LAN.
> 
> Even though I've only got one C-Class subnet (192.168.1.1 - 255), I
> want to create 2 or more "virtual" subnets to reside in this address
> range.
> 
> How do I create the multiple subnets?
> Do I need to use route command or ipsec.?
> And what would the iptables rule look like, where Subnet "B" rejects
> all packets coming from Subnet "A"?
> 
> Is this even close? ---
> $IPTABLES -t filter FORWARD -A -i eth1 -s 192.168.1.2/150
> --to-destination 192.168.1.151/253 -j DENY
> 
> Thank you for your time and help.
> 
> Mike

without physical separation--you have no security.

this may be a stretch, but if the internal switch supports VLANs--you
could VLAN the switch, and create a trunk on eth1 of the linux router. 
that would give some semblance of separation between the two subnets,
but it's still only virtual.  but it's better than plugging all your
machines into that same layer 2 broadcast domain and thinking you can
segment machines from each other.

-j

--
"Here we have an ordinary square.
 Whoa! Slow down egghead!"
	--The Simpsons


