From: Joshua Jackson <iptables@vortech.net>
Subject: Re: PPTP NAT module
Date: Thu, 11 Dec 2003 11:49:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111149.45143.iptables@vortech.net>
References: <200312091803.55451.jjackson@vortech.net> <9115313499.20031211185755@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9115313499.20031211185755@internetplustravel.ru>
Content-Disposition: inline
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
To: Oleg Savostyanov <savostyanov@internetplustravel.ru>, netfilter@lists.netfilter.org

Thanks. I will build a kernel from your config and give it a go.

Josh

On Thursday 11 December 2003 10:57, Oleg Savostyanov wrote:
> Hello Joshua,
> I successfully installed on a 2.4.23 kernel with ip_nat_pptp module
> I tested 3 vpn NATed connections to the SAME! server in the outside world
> see below my kernel's .config
>
> #
> # Networking options
> #
> CONFIG_PACKET=y
> CONFIG_PACKET_MMAP=y
> # CONFIG_NETLINK_DEV is not set
> CONFIG_NETFILTER=y
> CONFIG_NETFILTER_DEBUG=y
> CONFIG_FILTER=y
> CONFIG_UNIX=y
> CONFIG_INET=y
> CONFIG_IP_MULTICAST=y
> CONFIG_IP_ADVANCED_ROUTER=y
> CONFIG_IP_MULTIPLE_TABLES=y
> CONFIG_IP_ROUTE_FWMARK=y
> CONFIG_IP_ROUTE_NAT=y
> CONFIG_IP_ROUTE_MULTIPATH=y
> CONFIG_IP_ROUTE_TOS=y
> CONFIG_IP_ROUTE_VERBOSE=y
> CONFIG_IP_PNP=y
> # CONFIG_IP_PNP_DHCP is not set
> # CONFIG_IP_PNP_BOOTP is not set
> CONFIG_NET_IPIP=y
> CONFIG_NET_IPGRE=y
> CONFIG_NET_IPGRE_BROADCAST=y
> CONFIG_IP_MROUTE=y
> CONFIG_IP_PIMSM_V1=y
> CONFIG_IP_PIMSM_V2=y
> CONFIG_ARPD=y
> CONFIG_INET_ECN=y
> # CONFIG_SYN_COOKIES is not set
>
> #
> #   IP: Netfilter Configuration
> #
> CONFIG_IP_NF_CONNTRACK=y
> CONFIG_IP_NF_FTP=y
> # CONFIG_IP_NF_AMANDA is not set
> CONFIG_IP_NF_TFTP=y
> CONFIG_IP_NF_IRC=y
> CONFIG_IP_NF_CT_PROTO_GRE=y
> CONFIG_IP_NF_PPTP=y
> CONFIG_IP_NF_QUEUE=y
> CONFIG_IP_NF_IPTABLES=y
> CONFIG_IP_NF_MATCH_LIMIT=y
> CONFIG_IP_NF_MATCH_MAC=y
> # CONFIG_IP_NF_MATCH_PKTTYPE is not set
> CONFIG_IP_NF_MATCH_MARK=y
> CONFIG_IP_NF_MATCH_MULTIPORT=y
> CONFIG_IP_NF_MATCH_TOS=y
> # CONFIG_IP_NF_MATCH_RECENT is not set
> # CONFIG_IP_NF_MATCH_ECN is not set
> # CONFIG_IP_NF_MATCH_DSCP is not set
> CONFIG_IP_NF_MATCH_AH_ESP=y
> CONFIG_IP_NF_MATCH_LENGTH=y
> CONFIG_IP_NF_MATCH_TTL=y
> CONFIG_IP_NF_MATCH_TCPMSS=y
> CONFIG_IP_NF_MATCH_HELPER=y
> CONFIG_IP_NF_MATCH_STATE=y
> CONFIG_IP_NF_MATCH_CONNTRACK=y
> CONFIG_IP_NF_MATCH_UNCLEAN=y
> CONFIG_IP_NF_MATCH_OWNER=y
> CONFIG_IP_NF_FILTER=y
> CONFIG_IP_NF_TARGET_REJECT=y
> CONFIG_IP_NF_TARGET_MIRROR=y
> CONFIG_IP_NF_NAT=y
> CONFIG_IP_NF_NAT_NEEDED=y
> CONFIG_IP_NF_TARGET_MASQUERADE=y
> CONFIG_IP_NF_TARGET_REDIRECT=y
> CONFIG_IP_NF_NAT_PPTP=y
> CONFIG_IP_NF_NAT_PROTO_GRE=y
> # CONFIG_IP_NF_NAT_LOCAL is not set
> CONFIG_IP_NF_NAT_SNMP_BASIC=y
> CONFIG_IP_NF_NAT_IRC=y
> CONFIG_IP_NF_NAT_FTP=y
> CONFIG_IP_NF_NAT_TFTP=y
> CONFIG_IP_NF_MANGLE=y
> CONFIG_IP_NF_TARGET_TOS=y
> # CONFIG_IP_NF_TARGET_ECN is not set
> # CONFIG_IP_NF_TARGET_DSCP is not set
> CONFIG_IP_NF_TARGET_MARK=y
> CONFIG_IP_NF_TARGET_LOG=y
> CONFIG_IP_NF_TARGET_ULOG=y
> CONFIG_IP_NF_TARGET_TCPMSS=y
> CONFIG_IP_NF_ARPTABLES=y
> CONFIG_IP_NF_ARPFILTER=y
> CONFIG_IP_NF_ARP_MANGLE=y
>
>
>
>
> Wednesday, December 10, 2003, 2:03:55 AM, you wrote:
>
> JJ> I know there have been a pile of questions about this module in the
> past, but JJ> I can't seem to find any responses about the behaviour I am
> seeing.
>
> JJ> I am currently running a 2.4.23 kernel with the lastest officially
> released JJ> POM patches applied to it. The network being protected by the
> firewall is JJ> providing NAT for the hosts behind it. If the ip_nat_pptp
> module is loaded, JJ> none of the protected clients can establish an
> outbound PPTP session. If the JJ> conntrack modules are removed, a single
> session can be established (as would JJ> be expected).
>
> JJ> The remote PPTP server log shows the initial TCP connection, but never
> sees JJ> any GRE traffic from the connecting host.
>
> JJ> I have seen posts about the local NAT kernel option, I have tried it
> both ways JJ> with the same results. If there are any kernel settings in
> particular that I JJ> may be missing, please let me know.
>
> JJ> My iptables firewall rules include a default policy of DROP for INPUT
> and JJ> FORWARD, ACCEPT for OUTPUT. The first line in the rules includes an
> ACCEPT JJ> for the INPUT chain for established and related connection.
> There is also a JJ> rule allowing any traffic for all protocols to any host
> which originates from JJ> the protected network on the internal interface.


