From: forum@users.pc9.org
Subject: Re: Redirect ports on localhost
Date: Tue, 23 Mar 2004 20:01:02 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <jbm.20040323200102.07b7ea44@alkaid.pc9>
References: <406099AD.2070403@verio.net>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <406099AD.2070403@verio.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> I'm trying to redirect traffic on my DNS server. I have bind listening
> on port 5300 (UDP) instead of 53. I've got it working from the internal
> network but seem to have problem on redirecting localhost traffic. I've
> tried changing both PREROUTING and OUTPUT chains in the nat table but it
> doesn't seem to help.
> 
> iptables -A PREROUTING -t nat -p udp -i lo --dport domain -j REDIRECT
> --to-ports 5300

Absolutely incredible, within the past 15 minutes I have been trying to do 
the exact same thing with you -- also, with no luck. Using tcpdump I know 
that the port 53 packets are there, but from the DNS server logs I know 
that the packets never arrive at port 5300. I tried (unsuccessfuly) to add 
essentially the same PREROUTING rule.

Since this worked on my external interfaces but not lo, I'm thinking that 
maybe PREROUTING doesn't apply to lo? I don't know. The caveat I had 
encountered when doing this for another interface was making sure that the 
packet is accepted on that port in the INPUT chain, but that's not the case 
here for me.

-- 
forum@users.pc9.org



