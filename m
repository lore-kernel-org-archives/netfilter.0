From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Major NAT Problem
Date: Thu, 12 Feb 2004 18:31:15 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402130231.i1D2V5Un010316@server5.bandwidthco.com>
References: <Sea2-F19kyCKDkb9pPF00000901@hotmail.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea2-F19kyCKDkb9pPF00000901@hotmail.com>
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
To: 'Ted Erickson' <tederickson7582@hotmail.com>, netfilter@lists.netfilter.org

Ted - This sounds like a case of ICMP type 3 code 0 packets being dropped by
your ISP.  Some web sites are working for you because the packets are
getting there, and the server's return packets are getting back to you just
fine.  The sites that appear to be "hanging" are probably due to the DF
packets being dropped because either a reduced MTU or fragmentation is
needed.  However, if the ICMP Path MTU messages are being dropped, your
system is not aware of this.  Add this rule to your script and see if your
problem corrects itself:
 
$IPT -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu.
 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ted Erickson
Sent: Thursday, February 05, 2004 6:55 PM
To: netfilter@lists.netfilter.org
Subject: Major NAT Problem

I am somewhat new to IPTables but not to linux.  I have a major problem.  
Some background first... I have a PPoA SDSL connection with Qwest running at
640k/up/down.  I have a static block of 8 addresses.....I have a connection
from the DSL modem to eth0 on my Redhat 9.0 box and I have my local network
pluged into eth1.  The only thing running on the linux box is IPTables
nothing else.  I turned on echo 1 > /proc/sys/net/ipv4/ip_forward and
enabled MASQ in several different ways..... no problem.  I can surf the
internet just fine on my local network machine but I have ONE BIG PROBLEM!!!

  I can't view a handfull of websites.  If I take the linux box out of the
picture and throw a cheap Linksys Router on the same DSL connection I can
see all the web sites i want.  IPTables is blocking something but I don't
know what? I can't find any info on the web with this problem.  I need to
fix this ASAP or I will have to go with something else, but I want to stay
with linux.

theo

_________________________________________________________________
Get some great ideas here for your sweetheart on Valentine's Day - and
beyond. http://special.msn.com/network/celebrateromance.armx




