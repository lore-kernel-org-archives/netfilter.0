From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied to eth1.
Date: Wed, 11 Sep 2002 18:44:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911174425.URMD287.mta02-svc.ntlworld.com@there>
References: <87ofb44i7l.fsf@prium.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87ofb44i7l.fsf@prium.net>
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

On Wednesday 11 September 2002 5:14 pm, Erik Enge wrote:

> Before death of NIC 1:
>
>   NIC 1, eth0, 192.168.1.1
>   NIC 2, eth1, 192.168.1.2
>   NIC 3, eth2, 192.168.1.3
>   and so on...

Ugh !!!   What sort of networking setup have you got here ???

You're *supposed* to put addresses from different subnets onto each 
interface...

What netmasks are you using on these interfaces ?

> > It is almost inconceivable that the interface connecting you to the
> > outside world will deign to communicate with your router (or whatever
> > else is the next hop upstream of you) because the IP address, network
> > address, default gateway, netmask etc don't match.
>
> I don't follow you.  Let's suppose that the external interface now has
> very laid-back rules and still has the same IP address, network address,
> default gateway and netmask (because the 'ifconfig' statement wouldn't
> have changed).  Why is it inconceivable that that interface wolud
> communicate with my router?  I can't see why it wouldn't.

Based on the addresses you've given above, I agree with you, but that looks 
like a very weird way to set up a firewall.   I don't understand how you 
expect your routing tables to work.

Give us more information about your overall network setup, and we'll probably 
either tell you that you've been very lucky with your routing table setup, or 
that you've got more to worry about than one of your NICs dying :-)

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

