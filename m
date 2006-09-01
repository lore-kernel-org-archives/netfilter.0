From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: DNAT for two external NIC
Date: Fri, 1 Sep 2006 17:32:00 +0800
Message-ID: <06a001c6cda9$79feb2e0$0100a8c0@newlife>
References: <054a01c6cd90$641aa3d0$0100a8c0@newlife>
	<44F7F0B7.5010001@gazeta.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


From: "longraider" <longraider@gazeta.pl>

> Ming-Ching Tiew wrote:
> 
> >>Maybe you need to disable rp_filter (reverse path filtering) on the
> >>interface that has not the default route.
> >>
> >>sysctl -w net/ipv4/conf/eth2/rp_filter=0
> > 
> > Isn't this a bug in rp_filter ? In multipath routing, it's often the system
> > will have multiple routing tables. The rp_filter seems to only look at
> > the main routing table.
> > 
> 
> It looks at different tables (according to ip rule). I've recently
> posted a problem with the same solution. The problem was with the fwmark
> in the ip rules.
> 
> http://lists.netfilter.org/pipermail/netfilter/2006-August/066553.html
> 

I did not go through your post carefully enough to know what you are talking
about. But my question was why do we have to turn off reverse filter path
checking to get multipath routing to work ? The original idea of reverse
filter path checking is to improve security by doing reverse path checking,
ie by checking the source IP address of all packets coming in via an interface 
against the networks known to be behind that interface, the firewall/router 
can simply drop packets that aren't supposed to come from there. In the
multipath routing case, the packets are INDEED supposed to be from the
interface where it is coming from, why they are dropped ?

Regards.




