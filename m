From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Newbie question about having multiple destination addresses in
 a chain entry
Date: Sun, 05 Jan 2003 14:13:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E182F8E.3090601@fugmann.dhs.org>
References: <3E181977.4020204@aut.ac.nz> <20030105124531.GJ16581@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030105124531.GJ16581@miggy.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Athan <netfilter@miggy.org>
Cc: Ian Batterbee <ian.batterbee@aut.ac.nz>, netfilter@lists.netfilter.org

Athan wrote:
>    I *think* your problem is that the NOTHING chain is empty, so at the
> end of it it just returns to the calling chain.  Why not just simply -j
> ACCEPT on the rule in PREROUTING?  That should stop it processing any
> further down the PREROUTING for packets with that destination.
Besides the solution presented (with the error corrected), a more clean 
solution is to create a new chain, and then use the RETURN target in 
this chain for packets that are not to be DNAT'ed:

iptables -t mangle -N DNAT_PROXY
iptables -t mangle -A DNAT_PROXY -d 192.168.0.0/24 -j RETURN
iptables -t mangle -A DNAT_PROXY -d x.x.0.0/16 -j RETURN
iptables -t mangle -A DNAT_PROXY -p tcp -j REDIRECT --to-ports 3128
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j DNAT_PROXY

This allows you to do other stuff on packets in PREROUTING, as you are 
not accepting packets that are not to be DNAT'ed.

Regards
Anders Fugmann
--
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org


