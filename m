From: Gustav Petersson <gustav.petersson@karlskrona.net>
Subject: Re: how do i forward ftp from my firewall to an internal server?
Date: Sun, 29 Feb 2004 20:15:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40423A46.5070604@karlskrona.net>
References: <200402291636.i1TGaYBJ018559@server5.bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402291636.i1TGaYBJ018559@server5.bandwidthco.com>
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
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org

Thanks for your reply Mark.
I should have explained better. I know that ftp uses two ports with a 
different setup for active and passive mode. That is not the problem. 
Right now I am only DNATing the control port and my INPUT,OUTPUT and 
FORWARD chains have a default policy of ACCEPT. The rules I posted are 
the _only_ rules I have for my firewall. The problem is that when I 
telnet to my $EXTIP port 21 I should get a welcome message and be able 
to send some commands but from logging all traffic to and from my 
internal ftp server I can see the following traffic:
Client->FTP: SYN
FTP->Client: SYN ACK
Client->FTP: ACK
FTP->Client: ACK PSH
FTP->Client: ACK PSH
FTP->Client: ACK PSH
FTP->Client: ACK PSH
Client->FTP: RST

after this short exchange the connection is terminated. If i telnet to 
$EXTIP port 80 and do a 'GET /' everything works fine. I have tried 
proftpd, in.ftpd, wu-ftpd and they all give the same result so it's not 
a problem with the ftp server software.

Gustav Petersson

Mark E. Donaldson wrote:

>The FTP protocol works completely differently than http, particularly in the
>way connections are negotiated and accepted.  You must also account for both
>active and passive modes. I'm assuming the rules you have here are for new
>connections to your FTP server?  What are your FTP rules for the FORWARD
>chain?
>
>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org
>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Gustav Petersson
>Sent: Saturday, February 28, 2004 12:28 AM
>To: netfilter@lists.netfilter.org
>Subject: how do i forward ftp from my firewall to an internal server?
>
>Like the subject line says.. how do I do it?
>
>I have port http traffic forwarded to the same server but when i use the
>same rule with only the port(s) changed for ftp traffic my ftp server opens
>the connection but immediately closes it again. I have tried running both
>the standard in.ftpd and proftpd. Any help would be greatly appreciated.
>
>Gustav Petersson
>
>I am running debian 3.0 with kernel 2.4.24 and I have the following modules
>loaded:
>
>ipt_LOG
>ipt_state
>iptable_filter
>ip_nat_ftp
>ip_conntrack_ftp
>iptable_nat
>ip_conntrack
>ip_tables
>
>Here is my firewall config:
>#!/bin/sh
> 
>EXT_IP=1.2.3.4
>INT_IP=192.168.x.x
>
>modprobe iptable_nat
>modprobe ip_conntrack_ftp
>modprobe ip_nat_ftp
> 
>echo "1" > /proc/sys/net/ipv4/ip_forward
> 
>iptables -P INPUT ACCEPT
>iptables -F INPUT
>iptables -P OUTPUT ACCEPT
>iptables -F OUTPUT
>iptables -P FORWARD ACCEPT
>iptables -F FORWARD
>iptables -t nat -F
>
># NAT
>iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 213.88.181.68
> 
> 
>
>
># Forward port 80 to internal server
>iptables -A PREROUTING -t nat -p tcp -d $EXT_IP --dport 80 \
>        -j DNAT --to $INT_IP:80
>
># Forward ports 20 and 21 to internal server iptables -A PREROUTING -t nat
>-p tcp -d $EXT_IP --dport 20 \
>        -j DNAT --to $INT_IP:20
> 
>
>
>iptables -A PREROUTING -t nat -p tcp -d $EXT_IP --dport 21 \
>        -j DNAT --to $INT_IP:21
>
>
>
>
>  
>



