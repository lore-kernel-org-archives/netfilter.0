From: =?iso-8859-1?Q?Jo=E3o_Carlos_Garcia?= <jc.garcia@quintaonda.com.br>
Subject: Invalid Argument
Date: Mon, 6 Sep 2004 09:48:04 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <004701c4940f$c155c320$0800a8c0@supreme>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,=20

I=B4m trying to configure iptables rules, but ...
I=B4m testing the rules in a separeted environment, but the final =
topology will be the following
ADSL -- [ LINUX ] -- LOCAL NETWORK

The script look like this

    #!/bin/sh
    INTIF=3Deth0
    EXTIF=3Deth1
    INTIP=3D192.168.0.3
    EXTIP=3D172.16.0.3

    echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
    echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp
    echo 1 > /proc/sys/net/ipv4/ip_forward
    for f in /proc/sys/net/ipv4/conf/*/rp_filter;=20
    do=20
    echo 1 > $f;=20
    done

    iptables -F INPUT
    iptables -F OUTPUT
    iptables -F FORWARD
    iptables -A INPUT -j DROP
    iptables -A FORWARD -j DROP
    iptables -A OUTPUT -j DROP
    ...

    iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o $EXTIF -j SNAT =
--to-source $EXTIP

When the script run the last rule ( NAT ), occurs an error : iptables =
invalid argument.
I want that the iptables change the source IP address ( 192.168 ) to his =
ip address ( 172.16.0.3 ) to all connection to Internet

Could anyone help me ?
Thanks in advanced
Jo=E3o Carlos




---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.745 / Virus Database: 497 - Release Date: 27/8/2004
