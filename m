From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Optimize large iptables by hashing on MAC address help
Date: Fri, 11 Oct 2002 12:59:06 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210111239320.31276-100000@localhost.localdomain>
References: <00cc01c2713f$7e37f530$0800000a@wormhole>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00cc01c2713f$7e37f530$0800000a@wormhole>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Fri, 11 Oct 2002, Dan Searle wrote:

> Re,
> 
> I've had a look at the linux/net/ipv4/netfilter/ipt_mac.c source and had a
> thought...
> 
> It wouldn't be too difficult to add an extra parameter to the mac match
> module to allow masked matching, i.e. add a --mac-mask parameter which would
> allow the user to specify a bit mask so that only the un-masked bits of the
> 6 byte mac address were compared, e.g...
> 
> iptables -A INPUT -m mac --mac-source 00:00:00:00:00:02 --mac-mask
> 00:00:00:00:00:0F -j ACCEPT
> 
> ...meaning that only the least significant 4 bits of the mac source are
> compared against the specified mac source parameter.

but how frequently would such a mask be used?  after all, conventional
wisdom suggests that, while you have the freedom to assign IP addresses
any way you want, most people just have to work with the MAC addresses
on the cards they're given.  and if a card burns out and you replace it,
the new MAC address may not be programmable.

so i'm just curious -- aside from the original poster, how many others
would take advantage of this feature?

rday


