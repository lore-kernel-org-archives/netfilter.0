From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: Corrupted packets + Logs
Date: Wed, 17 Sep 2003 12:56:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309171256.49551.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.samba.org

Hi all ,

( As far as possible please answer to my 2 questions :-)  )

My stuff :
-1 single Computer hosting an FTP server and an HTTP one . that's all . ( no 
NAT nor FORWARD )

#1 
I'm learning networks and i saw that there are some tools that send 
"corrupted" packets to a host to have an idea of the local OS ( an exemple is 
nmap ) .
I would like my firewall to drop all corrupted packets .
I made a search on google with the words " iptables drop corrupted packets" 
but i cannot find any clear-enough documentation . 
Would you help me ?
Perhaps you want to see NETFILTER-about configuration of my kernel ?
Here you are :
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_FTP=y
# CONFIG_IP_NF_AMANDA is not set
# CONFIG_IP_NF_TFTP is not set
CONFIG_IP_NF_IRC=y
CONFIG_IP_NF_QUEUE=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_MATCH_LIMIT=y
CONFIG_IP_NF_MATCH_MAC=y
CONFIG_IP_NF_MATCH_PKTTYPE=y
CONFIG_IP_NF_MATCH_MARK=y
CONFIG_IP_NF_MATCH_MULTIPORT=y
CONFIG_IP_NF_MATCH_TOS=y
# CONFIG_IP_NF_MATCH_RECENT is not set
# CONFIG_IP_NF_MATCH_ECN is not set
# CONFIG_IP_NF_MATCH_DSCP is not set
CONFIG_IP_NF_MATCH_AH_ESP=y
CONFIG_IP_NF_MATCH_LENGTH=y
CONFIG_IP_NF_MATCH_TTL=y
CONFIG_IP_NF_MATCH_TCPMSS=y
# CONFIG_IP_NF_MATCH_HELPER is not set
CONFIG_IP_NF_MATCH_STATE=y
CONFIG_IP_NF_MATCH_CONNTRACK=y
CONFIG_IP_NF_MATCH_UNCLEAN=y
CONFIG_IP_NF_MATCH_OWNER=y
CONFIG_IP_NF_FILTER=y
CONFIG_IP_NF_TARGET_REJECT=y
CONFIG_IP_NF_TARGET_MIRROR=y
CONFIG_IP_NF_NAT=y
CONFIG_IP_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_MASQUERADE=y
CONFIG_IP_NF_TARGET_REDIRECT=y
CONFIG_IP_NF_NAT_LOCAL=y
CONFIG_IP_NF_NAT_SNMP_BASIC=m
CONFIG_IP_NF_NAT_IRC=y
CONFIG_IP_NF_NAT_FTP=y
CONFIG_IP_NF_MANGLE=y
CONFIG_IP_NF_TARGET_TOS=y
CONFIG_IP_NF_TARGET_ECN=y
CONFIG_IP_NF_TARGET_DSCP=y
CONFIG_IP_NF_TARGET_MARK=y
CONFIG_IP_NF_TARGET_LOG=y
CONFIG_IP_NF_TARGET_ULOG=y
CONFIG_IP_NF_TARGET_TCPMSS=y
CONFIG_IP_NF_ARPTABLES=y
# CONFIG_IP_NF_ARPFILTER is not set
# CONFIG_IP_NF_ARP_MANGLE is not set


#2
I would like iptables to log into /var/log/messages .
What have a got to configure into syslogd && iptables to do it ?
What rules have i got ad apply ?

If there is a better solution than making it into messages ,
how should i manage it ?

I already saw, after a google search , tha tkind of questions but the answers 
are un little bit complicated for me .
Would you have i link ( at least ) tha texplain it to me ?

Thanks for all , in advance .


