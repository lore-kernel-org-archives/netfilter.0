From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 04:03:25 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040617110325.97064.qmail@web14723.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all 

I need to allow active as well as passive FTP
connections to my FTP server.

My firewall configuration is as follows:
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT DROP
:
/sbin/iptables -A INPUT -m state --state
ESTABLISHED,RELATED -j ACCEPT
:
/sbin/iptables -A INPUT -p tcp --dport 21 --syn -j
ACCEPT
:
/sbin/iptables -A OUTPUT -m state --state
ESTABLISHED,RELATED -j ACCEPT
:

I have following issues relating to above rules:
1. For active FTP requests by remote clients, it drops
the data connection request to the remote client from
the server on the OUTPUT chain. 

2. For passive FTP requests by remote clients, it
drops the data connection request to the server from
remote clients on the INPUT chain.

I expected the RELATED on both INPUT and OUTPUT chains
will accept active as well as passive FTP connections.

The RELATED is defined on Packet Filtering HOWTO by
Rusty Russell as follows:
<quote>
RELATED
A packet which is related to, but not part of, an
existing connection, such as an ICMP error, or (with
the FTP module inserted), a packet establishing an ftp
data connection.
</quote>

What is this FTP module and how to insert it? 

I have already enabled the FTP support as part of the
Linux kernel.

Your comment in this regard is very much appreciated.

Kind regards
Sagara



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - Helps protect you from nasty viruses.
http://promotions.yahoo.com/new_mail

