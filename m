From: "Umar Qureshey" <umar.qureshey@lantronix.com>
Subject: RE: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless interface
Date: Thu, 3 Jun 2010 15:31:19 -0700
Message-ID: <F24C979D1AFD4E4292B911441CBA242407FCFE@2putt.int.lantronix.com>
References: <F24C979D1AFD4E4292B911441CBA242407FCFB@2putt.int.lantronix.com> <AANLkTikBjPz7zSp7KpAsnhbyfP94TwsGrbIcXdjP2r6z@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: agashi shipora <gashipo@gmail.com>
Cc: netfilter@vger.kernel.org

Yes, however, to select CONFIG_BRIDGE_NF_EBTABLES there is a dependency=
 on CONFIG_BRIDGE_NETFILTER, even though the help screen of CONFIG_BRID=
GE_NETFILTER states "Enabling or disabling this option doesn't enable o=
r disable ebtables."

I edited the Kconfig file in net/bridge/netfilter to remove this depend=
ency and recompiled the kernel with CONFIG_BRIDGE_NF_EBTABLES enabled a=
nd *no* CONFIG_BRIDGE_NETFILTER enabled.  Now my wireless radio is asso=
ciating and getting DHCP like it has been before this whole netfilter f=
iasco which cost me a much consternation and time.  My research has nar=
rowed down the issue to the br_filter.c code (this is included in the b=
uild by the CONFIG_BRIDGE_NETFILTER define).  When I remove this object=
 code from my build, radio is fine (but to remove this br_filter.c's co=
de, I had to modify Kconfig as stated above so I'll still have ebtables=
  support).  My guess is maybe some default setting of this bridge code=
 is rejecting all packets on the radio interface.
In my case, I only wanted ebtables support and not iptables, ip6tables,=
 or arptables.

Anyone know why CONFIG_BRIDGE_NF_EBTABLES is made dependent on CONFIG_B=
RIDGE_NETFILTER??
Should I expect some ebtables stuff to be broken because of my change t=
o Kconfig?

-----Original Message-----
=46rom: agashi shipora [mailto:gashipo@gmail.com]=20
Sent: Wednesday, June 02, 2010 8:04 PM
To: Umar Qureshey
Cc: netfilter@vger.kernel.org
Subject: Re: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless inte=
rface

Hi,
> My purpose for enabling CONFIG_BRIDGE_NETFILTER is to enable ebtables=
 so
> I can do L2-NATing.
To use ebtables  , enable CONFIG_BRIDGE_NF_EBTABLES.

Thanks
GP

On Thu, Jun 3, 2010 at 7:42 AM, Umar Qureshey
<umar.qureshey@lantronix.com> wrote:
> Hi,
>
> I posted a message earlier but upon further experimentation, it seems
> that enabling CONFIG_BRIDGE_NETFILTER is causing my wireless to stop
> transmitting/receiving any TCP/IP traffic. =A0I am able to associate =
with
> an AP but not even ARP packets are going through so DHCP and anything
> else are out of the question. =A0Basically, I am dead in the water.
> My purpose for enabling CONFIG_BRIDGE_NETFILTER is to enable ebtables=
 so
> I can do L2-NATing.
>
> Is there some dependencies that have to be enabled simultaneously in =
the
> kernel build to get ebtables working? =A0I'd hope and think Kconfig w=
ould
> apprise one of such dependencies.
>
> The kernel version is 2.6.28.
>
> iwconfig shows proper association:
> # iwconfig
> lo =A0 =A0 =A0 =A0no wireless extensions.
>
> eth0 =A0 =A0 =A0no wireless extensions.
>
> wlan0 =A0 =A0 IEEE 802.11 =A0ESSID:"insurrection54g"
> =A0 =A0 =A0 =A0 =A0Mode:Managed =A0Channel:6 =A0Access Point: 00:1A:7=
0:EE:2C:6F
> =A0 =A0 =A0 =A0 =A0Bit Rate=3D48 Mb/s =A0 Tx-Power=3D0 dBm
> =A0 =A0 =A0 =A0 =A0RTS thr=3D2318 B =A0 Fragment thr=3D2318 B
> =A0 =A0 =A0 =A0 =A0Encryption key:off
>
>
>
> The AP has been set to DHCP but I never get an IP:
> # ifconfig
> lo =A0 =A0 =A0 =A0Link encap:Local Loopback
> =A0 =A0 =A0 =A0 =A0inet addr:127.0.0.1 =A0Mask:255.0.0.0
> =A0 =A0 =A0 =A0 =A0UP LOOPBACK RUNNING =A0MTU:16436 =A0Metric:1
> =A0 =A0 =A0 =A0 =A0RX packets:0 errors:0 dropped:0 overruns:0 frame:0
> =A0 =A0 =A0 =A0 =A0TX packets:0 errors:0 dropped:0 overruns:0 carrier=
:0
> =A0 =A0 =A0 =A0 =A0collisions:0 txqueuelen:0
> =A0 =A0 =A0 =A0 =A0RX bytes:0 (0.0 B) =A0TX bytes:0 (0.0 B)
>
> wlan0 =A0 =A0 Link encap:Ethernet =A0HWaddr 00:20:4A:9D:00:94
> =A0 =A0 =A0 =A0 =A0UP BROADCAST RUNNING MULTICAST =A0MTU:1500 =A0Metr=
ic:1
> =A0 =A0 =A0 =A0 =A0RX packets:0 errors:0 dropped:0 overruns:0 frame:0
> =A0 =A0 =A0 =A0 =A0TX packets:3 errors:0 dropped:0 overruns:0 carrier=
:0
> =A0 =A0 =A0 =A0 =A0collisions:0 txqueuelen:1000
> =A0 =A0 =A0 =A0 =A0RX bytes:0 (0.0 B) =A0TX bytes:1818 (1.7 KiB)
>
> Relevant kernel .config:
> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> # CONFIG_PACKET_MMAP is not set
> CONFIG_UNIX=3Dy
> # CONFIG_NET_KEY is not set
> CONFIG_INET=3Dy
> # CONFIG_IP_MULTICAST is not set
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_FIB_HASH=3Dy
> CONFIG_IP_PNP=3Dy
> # CONFIG_IP_PNP_DHCP is not set
> CONFIG_IP_PNP_BOOTP=3Dy
> # CONFIG_IP_PNP_RARP is not set
> # CONFIG_NET_IPIP is not set
> # CONFIG_NET_IPGRE is not set
> # CONFIG_ARPD is not set
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> # CONFIG_INET_XFRM_TUNNEL is not set
> # CONFIG_INET_TUNNEL is not set
> # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> # CONFIG_INET_XFRM_MODE_TUNNEL is not set
> # CONFIG_INET_XFRM_MODE_BEET is not set
> # CONFIG_INET_LRO is not set
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> # CONFIG_TCP_MD5SIG is not set
> # CONFIG_IPV6 is not set
> # CONFIG_NETWORK_SECMARK is not set
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_DEBUG=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> CONFIG_BRIDGE_NETFILTER=3Dy
>
> #
> # Core Netfilter Configuration
> #
> # CONFIG_NETFILTER_NETLINK_QUEUE is not set
> # CONFIG_NETFILTER_NETLINK_LOG is not set
> # CONFIG_NF_CONNTRACK is not set
> # CONFIG_NETFILTER_XTABLES is not set
> # CONFIG_IP_VS is not set
>
> #
> # IP: Netfilter Configuration
> #
> # CONFIG_NF_DEFRAG_IPV4 is not set
> # CONFIG_IP_NF_QUEUE is not set
> # CONFIG_IP_NF_IPTABLES is not set
> # CONFIG_IP_NF_ARPTABLES is not set
> # CONFIG_BRIDGE_NF_EBTABLES is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> CONFIG_STP=3Dy
> CONFIG_BRIDGE=3Dy
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dy
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_ECONET is not set
> # CONFIG_WAN_ROUTER is not set
> # CONFIG_NET_SCHED is not set
>
>
> Regards,
> Umar
>
>
> *********************************************************************=
*
> This e-mail is the property of Lantronix. It is intended only for the=
 person or entity to which it is addressed and may contain information =
that is privileged, confidential, or otherwise protected from disclosur=
e. Distribution or copying of this e-mail, or the information contained=
 herein, to anyone other than the intended recipient is prohibited.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
