From: "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com>
Subject: RE: DNAT problem /  question
Date: Mon, 21 Jun 2004 00:00:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <519AD2BA94FC6E4DB5DE078B2E37CB10A76C98@PDBEX01E.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

=20

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Friday, June 18, 2004 6:15 PM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT problem / question

On Friday 18 June 2004 5:06 pm, Patrick Leslie Polzer wrote:

> On Fri, 18 Jun 2004 17:45:20 +0200
>
> "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com> wrote:
> > Could you please check my config, if I execute this I can not ping=20
> > my internal lan ip of this host 172.25.239.208 any more. I think=20
> > this is really wierd.
>
> Why? These lines:
> > $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT=20
> > --to-destination 11.0.0.16 $IPTABLES -t nat -A OUTPUT -d
> > 172.25.239.220/27 -j DNAT --to-destination 11.0.0.16
>
> are doing everything to keep ALL packets away from you ;) All outgoing

> packets (statement 2) are redirected to 11.0.0.16 and all incoming are

> as well (statement 1)!
> How do you expect ping to work with that? :-O

Good point, but surely a ping packet sent to 172.25.239.220 (let's
overlook the netmask for the time being...) would get redirected to
11.0.0.16, and provided that machine responds to the ping (and the reply
goes back through netfilter's NAT table) the origianting client might
see the reply?

However, I am certainly highly confused by what Bert is trying achieve
here - perhaps the answers to a few questions would help:

1. How many interfaces does the netfilter machine have?   What are their
IP=20
addresses ?

[root@linuxrouter root]# ifconfig eth1:1 172.25.239.207 netmask
255.255.255.224 broadcast 172.25.239.223 up
[root@linuxrouter root]# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:E0:18:02:7E:9B =20
          inet addr:11.0.0.3  Bcast:11.0.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:234000 errors:0 dropped:0 overruns:0 frame:0
          TX packets:117 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:13367392 (12.7 Mb)  TX bytes:5082 (4.9 Kb)
          Interrupt:5 Base address:0xd800 Memory:fb000000-fb000038=20

eth1      Link encap:Ethernet  HWaddr 00:D0:B7:E0:1F:2C =20
          inet addr:172.25.239.208  Bcast:172.25.239.223
Mask:255.255.255.224
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:234540 errors:0 dropped:0 overruns:0 frame:0
          TX packets:685 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:13429554 (12.8 Mb)  TX bytes:69016 (67.3 Kb)
          Interrupt:11 Base address:0xd400 Memory:fa000000-fa000038=20

eth1:1    Link encap:Ethernet  HWaddr 00:D0:B7:E0:1F:2C =20
          inet addr:172.25.239.207  Bcast:172.25.239.223
Mask:255.255.255.224
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:11 Base address:0xd400 Memory:fa000000-fa000038=20

lo        Link encap:Local Loopback =20
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:57 errors:0 dropped:0 overruns:0 frame:0
          TX packets:57 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0=20
          RX bytes:6489 (6.3 Kb)  TX bytes:6489 (6.3 Kb)

2. Where is machine 11.0.0.16?   How are packets routed to that frm the=20
netfiler machine?

machine 11.0.0.16 is in the same physical network.

3. What address are you sending the ping packets from (and to)?   How is
that=20
client routed to the netfilter box?

in both ways. From the 172. network. and from the 11. network. Pinging
goes fine, until I execute my script

4. What, in simple terms, are you trying to achieve with the two rules
which Patrick has queried above?

In fact the problem is that I have in a internal network only limited
ip's, I have everything in the 172.25.239.0/27 network. Which gives me
only 20 something ip's. What I need are 40-50 ip's that need to talk to
each other. (all in the 11 network) But I still want to have access to
some (20) of these boxes from the outside world (our intranet).
Therefore I just want to do ip aliasing : meaning 172.25.239.207 should
be the alias for 11.0.0.16 for example.

Thx,

Bert





