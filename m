From: "Jan Kaastrup" <jka@protego.dk>
Subject: RE: Re[2]: PPTP NAT module
Date: Tue, 23 Dec 2003 13:26:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001601c3c94f$fae88e50$2d64a8c0@pcjka>
References: <4693203599.20031223144018@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4693203599.20031223144018@internetplustravel.ru>
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
To: 'Oleg Savostyanov' <savostyanov@internetplustravel.ru>
Cc: netfilter@lists.netfilter.org

Hello Joshua
I see the problem is the clients NAT device. Because of the GRE
protocol, NAT devices are not able to read beneth the GRE protocol.
Maybe it is possible to make a work around if you can configure the NAT
device, but you must have a problem where this is not an option.

Unless the problem exist on the VPN server i see now "big" solution for
this issue :(

Do you now if I am correct that the problem exist on the VPN clients NAT
device and not on the server?

-----Original Message-----
From: Oleg Savostyanov [mailto:savostyanov@internetplustravel.ru] 
Sent: 23. december 2003 12:40
To: Jan Kaastrup
Subject: Re[2]: PPTP NAT module


Hello Jan,

Yes it is possible
It is on production stage on my network now.
There is one server outside my LAN and 7 computers
with private IP's on my net working with above mentioned server.


Monday, December 22, 2003, 7:18:54 PM, you wrote:

JK> Hello Joshua
JK> If I understand you right, you say that it is possible for clients
to
JK> come from the same Ipaddress doing SNAT to the same PPTP server
(poptop
JK> or ?), at the same time. All this using the ip_nat_pptp module?

JK> I didn't thought this was possible because of the protocol! 

JK> Please confirm that this is what you are able to do :)

JK> Thanks a lot
JK> Best regards
JK> Jan Kaastrup
 

JK> -----Original Message-----
JK> From: netfilter-admin@lists.netfilter.org
JK> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Oleg
JK> Savostyanov
JK> Sent: 11. december 2003 16:58
JK> To: netfilter@lists.netfilter.org
JK> Subject: Re: PPTP NAT module


JK> Hello Joshua,
JK> I successfully installed on a 2.4.23 kernel with ip_nat_pptp module
JK> I tested 3 vpn NATed connections to the SAME! server in the outside
JK> world
JK> see below my kernel's .config

JK> #
JK> # Networking options
JK> #
JK> CONFIG_PACKET=y
JK> CONFIG_PACKET_MMAP=y
JK> # CONFIG_NETLINK_DEV is not set
JK> CONFIG_NETFILTER=y
JK> CONFIG_NETFILTER_DEBUG=y
JK> CONFIG_FILTER=y
JK> CONFIG_UNIX=y
JK> CONFIG_INET=y
JK> CONFIG_IP_MULTICAST=y
JK> CONFIG_IP_ADVANCED_ROUTER=y
JK> CONFIG_IP_MULTIPLE_TABLES=y
JK> CONFIG_IP_ROUTE_FWMARK=y
JK> CONFIG_IP_ROUTE_NAT=y
JK> CONFIG_IP_ROUTE_MULTIPATH=y
JK> CONFIG_IP_ROUTE_TOS=y
JK> CONFIG_IP_ROUTE_VERBOSE=y
JK> CONFIG_IP_PNP=y
JK> # CONFIG_IP_PNP_DHCP is not set
JK> # CONFIG_IP_PNP_BOOTP is not set
JK> CONFIG_NET_IPIP=y
JK> CONFIG_NET_IPGRE=y
JK> CONFIG_NET_IPGRE_BROADCAST=y
JK> CONFIG_IP_MROUTE=y
JK> CONFIG_IP_PIMSM_V1=y
JK> CONFIG_IP_PIMSM_V2=y
JK> CONFIG_ARPD=y
JK> CONFIG_INET_ECN=y
JK> # CONFIG_SYN_COOKIES is not set

JK> #
JK> #   IP: Netfilter Configuration
JK> #
JK> CONFIG_IP_NF_CONNTRACK=y
JK> CONFIG_IP_NF_FTP=y
JK> # CONFIG_IP_NF_AMANDA is not set
JK> CONFIG_IP_NF_TFTP=y
JK> CONFIG_IP_NF_IRC=y
JK> CONFIG_IP_NF_CT_PROTO_GRE=y
JK> CONFIG_IP_NF_PPTP=y
JK> CONFIG_IP_NF_QUEUE=y
JK> CONFIG_IP_NF_IPTABLES=y
JK> CONFIG_IP_NF_MATCH_LIMIT=y
JK> CONFIG_IP_NF_MATCH_MAC=y
JK> # CONFIG_IP_NF_MATCH_PKTTYPE is not set
JK> CONFIG_IP_NF_MATCH_MARK=y
JK> CONFIG_IP_NF_MATCH_MULTIPORT=y
JK> CONFIG_IP_NF_MATCH_TOS=y
JK> # CONFIG_IP_NF_MATCH_RECENT is not set
JK> # CONFIG_IP_NF_MATCH_ECN is not set
JK> # CONFIG_IP_NF_MATCH_DSCP is not set
JK> CONFIG_IP_NF_MATCH_AH_ESP=y
JK> CONFIG_IP_NF_MATCH_LENGTH=y
JK> CONFIG_IP_NF_MATCH_TTL=y
JK> CONFIG_IP_NF_MATCH_TCPMSS=y
JK> CONFIG_IP_NF_MATCH_HELPER=y
JK> CONFIG_IP_NF_MATCH_STATE=y
JK> CONFIG_IP_NF_MATCH_CONNTRACK=y
JK> CONFIG_IP_NF_MATCH_UNCLEAN=y
JK> CONFIG_IP_NF_MATCH_OWNER=y
JK> CONFIG_IP_NF_FILTER=y
JK> CONFIG_IP_NF_TARGET_REJECT=y
JK> CONFIG_IP_NF_TARGET_MIRROR=y
JK> CONFIG_IP_NF_NAT=y
JK> CONFIG_IP_NF_NAT_NEEDED=y
JK> CONFIG_IP_NF_TARGET_MASQUERADE=y
JK> CONFIG_IP_NF_TARGET_REDIRECT=y
JK> CONFIG_IP_NF_NAT_PPTP=y
JK> CONFIG_IP_NF_NAT_PROTO_GRE=y
JK> # CONFIG_IP_NF_NAT_LOCAL is not set
JK> CONFIG_IP_NF_NAT_SNMP_BASIC=y
JK> CONFIG_IP_NF_NAT_IRC=y
JK> CONFIG_IP_NF_NAT_FTP=y
JK> CONFIG_IP_NF_NAT_TFTP=y
JK> CONFIG_IP_NF_MANGLE=y
JK> CONFIG_IP_NF_TARGET_TOS=y
JK> # CONFIG_IP_NF_TARGET_ECN is not set
JK> # CONFIG_IP_NF_TARGET_DSCP is not set
JK> CONFIG_IP_NF_TARGET_MARK=y
JK> CONFIG_IP_NF_TARGET_LOG=y
JK> CONFIG_IP_NF_TARGET_ULOG=y
JK> CONFIG_IP_NF_TARGET_TCPMSS=y
JK> CONFIG_IP_NF_ARPTABLES=y
JK> CONFIG_IP_NF_ARPFILTER=y
JK> CONFIG_IP_NF_ARP_MANGLE=y




JK> Wednesday, December 10, 2003, 2:03:55 AM, you wrote:

JJ>> I know there have been a pile of questions about this module in the
JK> past, but
JJ>> I can't seem to find any responses about the behaviour I am seeing.

JJ>> I am currently running a 2.4.23 kernel with the lastest officially
JK> released
JJ>> POM patches applied to it. The network being protected by the
JK> firewall is
JJ>> providing NAT for the hosts behind it. If the ip_nat_pptp module is
JK> loaded,
JJ>> none of the protected clients can establish an outbound PPTP
JK> session. If the
JJ>> conntrack modules are removed, a single session can be established
JK> (as would
JJ>> be expected).

JJ>> The remote PPTP server log shows the initial TCP connection, but
JK> never sees
JJ>> any GRE traffic from the connecting host.

JJ>> I have seen posts about the local NAT kernel option, I have tried
it
JK> both ways
JJ>> with the same results. If there are any kernel settings in
JK> particular that I
JJ>> may be missing, please let me know.

JJ>> My iptables firewall rules include a default policy of DROP for
JK> INPUT and
JJ>> FORWARD, ACCEPT for OUTPUT. The first line in the rules includes an
JK> ACCEPT
JJ>> for the INPUT chain for established and related connection. There
is
JK> also a
JJ>> rule allowing any traffic for all protocols to any host which
JK> originates from
JJ>> the protected network on the internal interface.





-- 
Best regards,
 Oleg
mailto:savostyanov@internetplustravel.ru



