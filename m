From: Nuitari <nuitari@balthasar.nuitari.net>
Subject: Re: Advice on network config (unix - linux and windows - mac)
Date: Tue, 15 Oct 2002 00:53:56 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210150051120.3001-100000@balthasar.nuitari.net>
References: <YSWTUOIGZT2UOIQ31ZXCBGC71B6TN.3daae90a@pc5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <YSWTUOIGZT2UOIQ31ZXCBGC71B6TN.3daae90a@pc5>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, 14 Oct 2002, David Bourgeois wrote:

> I would like to setup a linux box as gateway - firewall and NAT (maybe
> DHCP too) for a network of SUN workstations, windows (98, XP, 2000) PC's
> and macs.
> 
> I don't care about win and mac 's security but would like the SUN
> network to be as secure as possible. As I guess win can be easily
> compromised or in our case, untrusted persons can have access to it so I
> thought of physically separating the unix network from the others by
> using 2 subnets (three network cards on the gateway). So having two
> private networks, I can filter what goes from one to the other with the
> gateway's firewall (iptables in my case)
> 
> Is this the right way to do what I would like? Do you see any problem
> pointing out? Any recommandation would be welcome.
> 
> Thanks,
> David Bourgeois

You should have security for the windows/mac on the firewall itself.
If you can, get a mail filter to remove some of the problems with security 
in windows.

Your idea is sound, but don't forget to treat traffic coming from the 
mac/win part as being traffic from the internet (and vice-vesa).

Also make sure that the physical network is distinct (eg 1 network card 
for the sun network, 1 for internet, 1 for win/mac).




