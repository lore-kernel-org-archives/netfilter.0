From: "Rodrigo Haces" <rhaces_chistes@yahoo.com.mx>
Subject: RE: IP Alias with iptables
Date: Mon, 19 Apr 2004 10:20:15 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEKLOMJOPNJPAFKHEDJEECICDAA.rhaces_chistes@yahoo.com.mx>
References: <006901c4261e$01f081f0$0c00a8c0@pepelui>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006901c4261e$01f081f0$0c00a8c0@pepelui>
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



> Enviado el: Lunes, 19 de Abril de 2004 08:53 a.m.
>
> why not to use iproute2 adding a new ip address to the interface
> and filter
> with the source?
>
> like
>
> ip add add 192.168.0.1/24 dev eth0
> ip add add 192.168.1.1/24 dev eth0
>
> and then apply the rules using the source address and not the interface???
>
> could it help???

Could work, never tryed it, but how do i set it up to work on boot? i use
RedHat 7.3 and have a /etc/sysconfig/network-scripts/ifcfg-eth0 file that
has the next parameters:
DEVICE="eth0"
IPADDR="192.168.1.1"
NETMASK="255.255.255.0"
NETWORK=192.168.1.0
ONBOOT="yes"

Do i just simple add another IPADDR line?

Thanks

Rodrigo

>
>
> ----- Original Message -----
> From: "Rodrigo Haces" <rhaces_chistes@yahoo.com.mx>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, April 19, 2004 12:41 PM
> Subject: IP Alias with iptables
>
>
> > Hi:
> >
> > I have only one network adapter in my Server, but i need to have 2
> different
> > networks, 192.168.1.0 to the MAC addresses i know and 192.168.0.0 to the
> MAC
> > addresses i dont't know, i have managed this by makin mi eth0 to
> 192.168.1.1
> > and an alias eth0:0 to 192.168.0.1, everythings ok, but i'm also sharing
> > internet, but when i start the rule to the eth0:0 it sends me
> an error. Is
> > there a way to use IP Aliasing with iptables? if not, is there a way to
> > create an eth0 and eth1 witn the same adapter?
> >
> > Thanks
> >
> > Rodrigo
> >
> >
> >


