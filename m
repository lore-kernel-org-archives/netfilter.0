From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: understanding ip_conntrack entry
Date: Thu, 3 Oct 2002 17:05:09 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c26b18$2d114990$3201a8c0@leonardo>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter ML <netfilter@lists.samba.org>


    Hello Guys,

    I'd like your help to understand this entry from /proc/net/ip_conntrack:

tcp      6 325849 ESTABLISHED src=192.168.10.1 dst=192.168.229.25
sport=53699 dport=80 [UNREPLIED] \
    src=192.168.229.25 dst=192.168.10.1 sport=80 dport=53699 use=1


    Well ...... 192.168.10.1 is my iptables box and 192.168.229.25 is one of
my remote machines. My question is .... if this connection is marked as
ESTABLISHED, shouldnt it appear on 'netstat -an' entries ??? I think it
should, but it's not appearing there .....

    Sincerily,
    Leonardo Rodrigues



