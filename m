From: "P theodorou" <props666999@hotmail.com>
Subject: dhcp windows client port
Date: Sat, 12 Nov 2005 16:08:23 +0000
Message-ID: <BAY102-F3471223F91A898773DE401AE580@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello

i wish  the windows machine which receives Internet from the firewall pc
to be restricted fully apart from the port needed to access the internet

the windows machine has got fully access when my rc.firewall  contains

$iptables -A FORWARD -i $LAN_IFACE -j ACCEPT

which gives to the windows machine access to every port

i've tried unsuccesully the following command

$iptables -A FORWARD -p TCP -i $LAN_IFACE -- sport XX -j ACCEPT

my netstat on the windows machine displays various connections
few questions now


1 which port should be alolwed for the windows machine to see internet
2 can i restrct it to  something like :
$iptables -A FORWARD  -p TCP -i $LAN_IFACE  -sport XX   -dport XX -j ACCEPT

in other words, allow  the windows relevant port for accesing on the 
internet  to
be connected to the specific port of the firewall

regards



