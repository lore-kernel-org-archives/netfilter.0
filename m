From: Antonio Alvarez <aramirez@teneinformatica.com>
Subject: Trasparent Proxy problem
Date: Fri, 11 Jun 2004 19:17:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086977845.1883.37.camel@Toshiba.Toshiba>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-v0mIKt7bo76orLHYGbhe"
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
To: netfilter <netfilter@lists.netfilter.org>


--=-v0mIKt7bo76orLHYGbhe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all

My firewall have three network interfaces 2 public ips and another one
private ip...
I`m gonna use load balancing with:

ip route add default nexthop via gw1 nexthop via gw2 , 

to here that's ok, but i got problems with transparent proxy 

iptables -t nat -A PREROUTING -s private subnet --dport 80 -j REDIRECT
--to-ports 3128 

my linux local machine use can't connect to internet, any aideas????

Thanks in advance

Antonio Alvarez


--=-v0mIKt7bo76orLHYGbhe
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.10">
</HEAD>
<BODY>
Hi all<BR>
<BR>
My firewall have three network interfaces 2 public ips and another one private ip...<BR>
I`m gonna use load balancing with:<BR>
<BR>
ip route add default nexthop via gw1 nexthop via gw2 , <BR>
<BR>
to here that's ok, but i got problems with transparent proxy <BR>
<BR>
iptables -t nat -A PREROUTING -s private subnet --dport 80 -j REDIRECT --to-ports 3128 <BR>
<BR>
my linux local machine use can't connect to internet, any aideas????<BR>
<BR>
Thanks in advance<BR>
<BR>
Antonio Alvarez<BR>
<BR>
</BODY>
</HTML>

--=-v0mIKt7bo76orLHYGbhe--


