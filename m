From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ping With Iptables.
Date: Tue, 29 Oct 2002 16:29:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210291629.g9TGT6e10461@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210291631160.29974-100000@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210291631160.29974-100000@dns.toxicfilms.tv>
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

On Tuesday 29 October 2002 3:34 pm, Maciej Soltysiak wrote:

> Hello,
>
> > I have a Linux Box as a Gateway of my network. And i want do allow
> > internal machines to ping the Internet but i also want to block external
> > machines to ping my Gateway. Is this is possible plz send me something...
> > Thanx.
>
> #let the internal net ping the world
> iptables -A FORWARD -p icmp -s $YOUR_NET -j ACCEPT
>
> #disallow the world to ping the gateway
> iptables -I INPUT -p icmp -d $GATEWAY_IP -j DROP
>
> Of course this is very rough, i do not know your rulesets, it is possible
> that it can be done better to suit your current chains and rules.

I would instead recommend
iptables -P INPUT DROP

and then only add rules for the things you really do want to come in to the 
firewall (established & related is probably a good start).

"Allow what you know you want, and drop everything else" is a good policy.

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

