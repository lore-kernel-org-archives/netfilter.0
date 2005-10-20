From: Bill Tangren <bjt@aa.usno.navy.mil>
Subject: bad_packets problem?
Date: Thu, 20 Oct 2005 10:52:08 -0400
Message-ID: <4357AF18.2060109@aa.usno.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

I'm new to this list.

I have a Linux (2.6.9-22.EL) box, running iptables version 
1.2.11-3.1.RHEL4. My server is sitting behind a firewall (that I don't 
control), but I have iptables running anyway, as occasionally other 
boxes behind the firewall are compromised.

I think I have a problem with iptables. Part of the script that I use to 
set up iptables is as follows:

IPT="/sbin/iptables"
$IPT -N bad_packets
# bad_packets chain
#

# Drop INVALID packets immediately
$IPT -A bad_packets -p ALL -m state --state INVALID -j LOG \
     --log-prefix "Invalid packet: "
$IPT -A bad_packets -p ALL -m state --state INVALID -j DROP
# Then check the tcp packets for additional problems
$IPT -A bad_packets -p tcp -j bad_tcp_packets
# All good, so return
$IPT -A bad_packets -p ALL -j RETURN


When implemented, this shows up in /etc/sysconfig/iptables as:

-A bad_packets -m state --state INVALID -j LOG --log-prefix "Invalid
  packet: "
-A bad_packets -m state --state INVALID -j DROP
-A bad_packets -p tcp -j bad_tcp_packets
-A bad_packets -j RETURN


So far, so good.

A program called LogWatch summarizes the logs for me. When I use up2date 
to update my RedHat software, I get entries in the log that show up in 
the LogWatch email. The thing is, the "Invalid packet" rule catches a 
few hundred packets a day, and logs them. A number of those packets come 
from 209.132.177.100 (xmlrpc.rhn.redhat.com), the rhn up2date server. 
The LogWatch output can look like this:

 From 209.132.177.100 - 24 packets
   To 10.1.5.154 - 24 packets
      Service: 33353 (tcp/33353) (Invalid packet:,eth0,none) - 4 packets
      Service: 33935 (tcp/33935) (Invalid packet:,eth0,none) - 10 packets
      Service: 33951 (tcp/33951) (Invalid packet:,eth0,none) - 10 packets

The updates take place eventually, but almost never on the first go.
I get LogWatch entries like this every time I run up2date. I am assuming 
that there is some problem with the iptables rules I have set up, but I 
don't know what they might be.

Does anyone have any thoughts on this? [I posted this question on the 
redhat-list, but got no replies, so I thought I might try here.]

Bill Tangren


