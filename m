From: "Michael P. Ryan" <mryan@mail.arc.nasa.gov>
Subject: strange problem.
Date: Fri, 17 Jan 2003 10:31:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D98357A0-2A49-11D7-A5F4-0003934AB744@mail.arc.nasa.gov>
Mime-Version: 1.0 (Apple Message framework v551)
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
To: netfilter@lists.netfilter.org

Hi,

  On redhat 7.3 iptables 1.2.5, all needed modules appear to be loaded 
correctly.

I have the box setup to nat and that works like a charm, but run into 
problems when I try to port forward to the internal network. Here is 
what I run, all pretty text book from what I can tell:

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

# Portfw section
$IPTABLES -A FORWARD -i eth0 -o eth1 -p tcp --dport 23 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A PREROUTING -t  nat -p tcp -d my.external.ip --dport 23 -j 
DNAT --to 192.168.0.6:23
#


$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

--
No errors are ever given, and iptables -L lists the rules no problem. 
However port 23 is never opened, or shown via netstat -a.

I am on kernel 2.4.18-19.7.x fwiw

Any help or suggestions would be greatly appreciated.

-mike


