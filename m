From: lst_hoe01@kwsoft.de
Subject: Re: network/iptables start order
Date: Thu, 13 Jan 2005 10:46:01 +0100
Message-ID: <1105609561.41e6435912106@webmail.kwsoft.de>
References: <BAY101-F3520280EA804079C9229A4DF970@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F3520280EA804079C9229A4DF970@phx.gbl>
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

Zitat von "Curby ." <kirbysdl@hotmail.com>:

> In what order should i have /etc/init.d/network and my iptables setup s=
cript
> (henceforth called "iptables") start?
>
> If network starts first, netfilter defaults all filter chains in ACCEPT
> policy, so there's a tiny chance that someone could do something unwant=
ed.
> Is this sufficient reason to start iptables or otherwise change chain
> policies before network? I'm thinking yes.
>
> If iptables starts before network, then network could override settings=
 in
> /proc/sys/net when it calls upon /etc/sysctl.conf.   Additionally, it w=
ould
> be harder to identify dynamic IPs, additional IPs set with "ip addr add=
,"
> etc.  simply because the network isn't up yet.

We do it this way :
Load a really tiny iptables script with /etc/init.d/boot.local to set all
default policy to drop and only add a rule for SSH connect. The boot.loca=
l is
started after initial boot processes but before any run level 1 tasks.
With the standard run-level scripts load the full firewall scripting *aft=
er* the
network start. This is because we do some MAC-address hard-coding only wo=
rking
after the network is started. With this script we also tune the network
security parameters.

Regards

Andreas


