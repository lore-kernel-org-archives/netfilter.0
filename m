From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: WAP11 host behind Netfilter Router
Date: Wed, 18 Sep 2002 22:20:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020918212006.JMSB14766.mta05-svc.ntlworld.com@there>
References: <0cee01c25f54$397d4dc0$64dc0a0a@dataarc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0cee01c25f54$397d4dc0$64dc0a0a@dataarc>
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

On Wednesday 18 September 2002 9:44 pm, Ryan Beisner wrote:

> Hi All!
>
> I have a Linksys WAP11 behind a high speed connection.
>
> Here's the scenario:
>
>     INT (eth0) IP Range ( 192.168.168.1 class C )
>     EXT (eth1) IP Range also private ( 10.20.0.3 class B )
>     EXT (eth1:1) Virtual IP is 10.20.0.4
>
> I want to map everything from Virt IP (Eth1:1) 10.20.0.4 (all ports) to
> internal 192.168.168.178 (the Linksys WAP 11).  FYI this is for remote
> management of my access point.
>
> Here was my first attempt, which did not work.  I explicitly allow all
> traffic in/out/fwd for 10.20.0.4 to make sure I wasn't kicking myself here.
>  Still no go.  Suggestions?
>
>     ""iptables -A PREROUTING -t nat -d 10.20.0.4 -j DNAT --to
> 192.168.168.178""

The PREROUTING rule looks good.

However, remember that by the time packets reach the FORWARD chain, the 
PREROUTING rule has already NATted them, so you need to allow packets for 
192.168.168.178 through netfilter, not packets for 10.20.0.4.....

Also, you say you want to do this for "remote management of the access 
point", so why do you want to map *all* ports ?   Surely there's only a very 
few ways of managing the AP: telnet, snmp, http - any others ?

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

