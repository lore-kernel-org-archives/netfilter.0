From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Temporary forwarding proxy?
Date: 25 Sep 2003 03:37:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064475439.1906.528.camel@alpha.newkirk.us>
References: <200309241035.04343.gdh@acentral.co.uk>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309241035.04343.gdh@acentral.co.uk>
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
To: Gavin Hamill <gdh@acentral.co.uk>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-09-24 at 05:35, Gavin Hamill wrote:
> Hullo :)
> 
> Cutting to the chase, I'm moving a machine on IP 1.1.1.1 from our leased line 
> in the office to a data centre at IP 2.2.2.2, and I'd like my firewall box on 
> the 1.1.1.0 network to forward HTTP requests for the now non-existant 1.1.1.1 
> to 2.2.2.2 and act as an HTTP proxy, just for the few hours whilst the DNS 
> updates...
> 
> I realise that there will be lots of bandwidth wasted in shuffling duplicate 
> data back and forth, but it really only is for a few hours and numbskill ISPs 
> that ignore small DNS TTLs...
> 
> Is this possible with iptables / SNAT / DNAT ?

iptables -t nat -A PREROUTING -d 1.1.1.1 -p tcp --dport 80 -j DNAT --to 2.2.2.2
iptables -t nat -A POSTROUTING -d 2.2.2.2 -p tcp --dport 80 -j SNAT --to 1.1.1.x (firewall IP)
and probably:
iptables -A FORWARD -d 2.2.2.2 -p tcp --dport 80 -j ACCEPT
and make sure you're accepting ESTABLISHED and RELATED state in FORWARD, or add
a return traffic rule to FORWARD if you're stateless:
iptables -A FORWARD -s 2.2.2.2 -p tcp --sport 80 -j ACCEPT

j



