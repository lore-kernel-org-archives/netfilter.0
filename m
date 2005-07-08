From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: dhcrelay still responds dropped inbound offer packets from
	iptables (nfcan: addressed to exclusive sender for this address)
Date: Fri, 8 Jul 2005 17:37:49 -0400
Message-ID: <20050708213749.GC17745@salty>
References: <673fb82305070814186036ce2f@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <673fb82305070814186036ce2f@mail.gmail.com> (from
	+nfcan+jimlaur+7a8d75f853.changwilly#gmail.com@spamgourmet.com
	on Fri, Jul 08, 2005 at 17:18:33 -0400)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.07.08 17:18, Willy Chang - changwilly@gmail.com wrote:
> Folks,
> 
>      I am running a dhrelay service and using iptables to be a
> firewall to block packets from dhcp server on the inbound side, eth0,
> of my Liunx. The reason to do this is to avoid generating duplicated
> packets from my machine to dhcp client on the same subnet.
>      For some reasons, I am unable to block these packets. I have a
> simple rule setting below to simply block all incoming UDP packets
> where it should block dhcp package as well.
> 
> iptables -A INPUT -p UDP -i eth0 -j DROP

I see two things to comment on.

First, if you add (-A) a rule like this at the end,
the packets in question might have already been accepted
by an earlier rule. For a case like this, you might want
to insert at the top (-I) instead.

Second, INPUT affects filtering of packets bound for the firewall
host itself. FORWARD rules affect packets bound for other hosts.
I think those are the packets you are trying to block.

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

