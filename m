From: "Tarek W." <mailinglists1@hotpop.com>
Subject: Re: Being selective about traffic and interfaces
Date: Tue, 09 Mar 2004 17:25:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078845947.3802.35.camel@carve.personal.localdomain>
References: <20040308150758.GB16848@virgin.net>
 <1078832443.3802.31.camel@carve.personal.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1078832443.3802.31.camel@carve.personal.localdomain>
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

On Tue, 2004-03-09 at 13:46, Tarek W. wrote:
> On Mon, 2004-03-08 at 17:07, Richard Bellamy wrote:
> > Hi
> > 
> > I have just set up an ecrypted connection (with OpenVPN) between my laptop and router currently all traffic goes down the vpn. I would like to allow ssh traffic to bypass the vpn.
> > 
> > The situation is this:
> > 
> > Router:							Laptop:
> > 192.168.0.1 - tun0					192.168.0.2 - tun0
> > 	|							|
> > 10.44.10.1 - eth0					10.44.10.2 - eth0
> > 	|							|
> > 	---------------------------------------------------------
> > 
> > The default route on the laptop is set to 192.168.0.1 so all traffic is automatically sent encrypted. I need to be able to send everything but ssh down the vpn(with the possibility for https later on). I beleive that this would have to happen before routing took place. OpenVPN is on udp/5000.
> 
> on the laptop:
> 
> edit /etc/iproute2/rt_tables (or wherever rt_tables is at) and add the
> following:
> 
> <snip>
> 50	unencrypted
> </snip>
> 
> without <snip> and </snip>
> 
> then issue the following commands:
> 
> <snip>
> ip route add dev eth0
> ip rule add pref 50 fwmark 2 table unencrypted
> </snip>

should be:

<snip>
ip route add dev eth0 table unencrypted
ip rule add pref 50 fwmark 2 table unencrypted
</snip>

> 
> now iptables comes in to play and glues everything up:
> 
> <snip>
> iptables -t mangle -I OUTPUT -p tcp --dport 22 -j MARK --set-mark 0x02
> iptables -t nat -I POSTROUTING -o dev eth0 -j SNAT --to 192.168.0.2
> </snip>
> 
> 
> 


