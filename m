From: Marco Colombo <netfilter@esiway.net>
Subject: Re: again problem with alias / virtual interface
Date: Wed, 21 Jul 2004 17:34:29 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0407211707490.31223-100000@Megathlon.ESI>
References: <007d01c46dae$0a45f330$eb53623e@x>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007d01c46dae$0a45f330$eb53623e@x>
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
To: Marco Strullato <batstru@email.it>
Cc: netfilter@lists.netfilter.org

On Mon, 19 Jul 2004, Marco Strullato wrote:

> > > -A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport
> 25 --state
> > > NEW -j ACCEPT
> >
> > And here is the error.
> >
> > As me (and I believe Antony, possibly others) already told you,
> > Netfilter does not know about virtual interfaces.  Virtual interfaces
> > are abstractions that exist in higher levels of kernel than Netfilter
> > is.  Netfilter is concerned only on which *physical* interface the
> > packet is.  Replace "-i eth1:1" with "-i eth1" in above rule (and same
> > for all other virtual interfaces you have) and you'll be fine:
> >
> > -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 25
> > --state NEW -j ACCEPT
> 
> I've tried with just eth1 but the rule is not applied, or it seems not to be
> applied
> 
> I've seen that using virtual interfaes is deprecated so I tryed to set
> multilple ip with iproute.
> If I set network interfaces only with iproute and not with ifconfig, network
> configuration seems to be absent.

You need to specify the right label when you add an address with 'ip'.
If you do that, ifconfig will be able to recognize that as a 'virtal
interface'. It works for me:

# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:C0:F0:4D:8A:9A  
          inet addr:10.10.10.13  Bcast:10.10.10.255  Mask:255.255.255.0
          inet6 addr: fe80::2c0:f0ff:fe4d:8a9a/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:14496652 errors:1 dropped:0 overruns:0 frame:0
          TX packets:8472210 errors:163 dropped:0 overruns:0 carrier:163
          collisions:0 txqueuelen:1000 
          RX bytes:824477902 (786.2 Mb)  TX bytes:863796083 (823.7 Mb)
          Interrupt:5 Base address:0xb800 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:3848129 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3848129 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:2569589493 (2450.5 Mb)  TX bytes:2569589493 (2450.5 Mb)

# ip address add 10.10.222/24 dev eth0 label eth0:1

# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:C0:F0:4D:8A:9A  
          inet addr:10.10.10.13  Bcast:10.10.10.255  Mask:255.255.255.0
          inet6 addr: fe80::2c0:f0ff:fe4d:8a9a/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:14496734 errors:1 dropped:0 overruns:0 frame:0
          TX packets:8472273 errors:163 dropped:0 overruns:0 carrier:163
          collisions:0 txqueuelen:1000 
          RX bytes:824563441 (786.3 Mb)  TX bytes:863802272 (823.7 Mb)
          Interrupt:5 Base address:0xb800 

eth0:1    Link encap:Ethernet  HWaddr 00:C0:F0:4D:8A:9A  
          inet addr:10.10.222.0  Bcast:0.0.0.0  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:14496734 errors:1 dropped:0 overruns:0 frame:0
          TX packets:8472273 errors:163 dropped:0 overruns:0 carrier:163
          collisions:0 txqueuelen:1000 
          RX bytes:824563441 (786.3 Mb)  TX bytes:863802272 (823.7 Mb)
          Interrupt:5 Base address:0xb800 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:3848129 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3848129 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:2569589493 (2450.5 Mb)  TX bytes:2569589493 (2450.5 Mb)


But the whole idea of 'virtual interfaces' is obsolete. The linux kernel
(and thus iptables) knows only of physical interfaces and ip addresses.
You can set a label for each ip address, but that's only a trick to make
the old ifconfig work. Labels are, well, just labels, the kernel doesn't
need them at all. If you're using 'ip' to configure ip addresses, you
can forget about labels (but ifconfig won't work).

Stop using ifconfig. Stop thinking in terms of 'virtal interfaces'.
You can't do what you're trying to do because virtual interfaces don't
exist [*]. Please think in terms of physical interfaces and ip addresses.

> If I set network with ifconfig and not with iproute, network configuration
> seems ok
> So I can't to use iproute (to set interfaces) and iptables becacuse network
> configuration is absent.

To show your current configuration, type:

ip address show

that will give you the _real_ configuration. This is true anyway, even
if you use ifconfig to set it up. You may use ifconfig if you're
more confortable with it, just remember that those 'eth0:1', 'eth0:2', ...
are just _labels_, not iterfaces.
You can't filter packets coming from a label.

.TM.

[*] There are VLANs of course, which are the only real 'virtual interfaces',
and the syntax is different: eg. eth0.1. But those are a different beast.
You can forget about them if you don't play with switches that support
them and with ports in 'trunking' mode.
-- 
      ____/  ____/   /
     /      /       /			Marco Colombo
    ___/  ___  /   /		      Technical Manager
   /          /   /			 ESI s.r.l.
 _____/ _____/  _/		       Colombo@ESI.it


