From: Michael <mutk@iprimus.com.au>
Subject: Re: understanding ip_conntrack entry
Date: Fri, 04 Oct 2002 12:45:04 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D9D00B0.8080901@iprimus.com.au>
References: <000f01c26b18$2d114990$3201a8c0@leonardo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter ML <netfilter@lists.samba.org>

netstat uses files in /proc/net (from netstat man page) :
/proc/net/dev -- device information

/proc/net/raw -- raw socket information

/proc/net/tcp -- TCP socket information

/proc/net/udp -- UDP socket information

/proc/net/igmp -- IGMP multicast information

/proc/net/unix -- Unix domain socket information

/proc/net/ipx -- IPX socket information

/proc/net/ax25 -- AX25 socket information

/proc/net/appletalk -- DDP (appletalk) socket information

/proc/net/nr -- NET/ROM socket information

/proc/net/route -- IP routing information

/proc/net/ax25_route -- AX25 routing information

/proc/net/ipx_route -- IPX routing information

/proc/net/nr_nodes -- NET/ROM nodelist

/proc/net/nr_neigh -- NET/ROM neighbours

/proc/net/ip_masquerade -- masqueraded connections

/proc/net/snmp -- statistics

It doesn't use or know anything about ip_conntrack
Therefore any statefull activity cannot be shown in netstat. Maybe it 
needs re-writing ?? :)

Cheers,
Michael



Leonardo Rodrigues ( listas ) wrote:

>    Hello Guys,
>
>    I'd like your help to understand this entry from /proc/net/ip_conntrack:
>
>tcp      6 325849 ESTABLISHED src=192.168.10.1 dst=192.168.229.25
>sport=53699 dport=80 [UNREPLIED] \
>    src=192.168.229.25 dst=192.168.10.1 sport=80 dport=53699 use=1
>
>
>    Well ...... 192.168.10.1 is my iptables box and 192.168.229.25 is one of
>my remote machines. My question is .... if this connection is marked as
>ESTABLISHED, shouldnt it appear on 'netstat -an' entries ??? I think it
>should, but it's not appearing there .....
>
>    Sincerily,
>    Leonardo Rodrigues
>
>
>
>
>  
>




