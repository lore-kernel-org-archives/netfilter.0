From: "hare ram" <hareram@sol.net.in>
Subject: Problem With NAT to NAT with IPTABLES
Date: Mon, 28 Oct 2002 12:11:36 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ca01c27e4d$0fd20980$13fcc5cb@nextto>
References: <Pine.LNX.4.44.0210272214080.12317-100000@laptop1.agatha> <200210280048.01995.netfilter@newkirk.us>
Reply-To: "hare ram" <hareram@sol.net.in>
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
To: netfilter@lists.netfilter.org

Hi all

i have DSL 2MB connection with my provider
he is authenticating and giving me 2MB Bandwidth
i am using for my internal office purpose

i have zyxel ADSL modem which is is Doing NAT
since i have lot of corporate users, i want to manage the bandwidth, so i
added another Redhat Linux box in between user and Zyxel ADSL router with 2
NIC
the set up look like below


Corporate users---NIC1--NIC2--ADSL LAN--ADLS WAN--UPLink/DownLink provider


the problem is iam getting very poor response when i use iptables NAT to NAT
configuration
the configuration is like this

Internal Users are using  192.168.2.5 to 192.168.2.200 subnet is
255.255.255.0
Internal user Gateway is (NIC1) 192.168.2.1

NIC2 IP address is 192.168.4.2 with the subnet if 255.255.255.0
ADSLLAN ip address is 192.168.4.1 with the Subnet if 255.255.255.0
NIC2 and ADSLLAN is connected with Cross cable

ADSL WAN ip address is Dynamic

This is what my present configuration of LAN
but iam getting very poor responce of browsing, when iam doing any of the PC
from corporate users

when i remove the Linux box , iam getting good speed, but its sharing the
bandwidth that, any one can pull 2MB, iam not able to monitor

in the Redhat Linux 7.3 iam running Squid and Transparent proxy, with
Iptables prerouting from 80 port to 3128
its able to serve the request but very slow responce, never gone yet to CBQ.

I have another Setup in another Office

Corporate users---NIC1--NIC2--Cisco LAN-- Cisco WAN--UPLink/DownLink
provider

here iam getting Cisco LAN is Public IP address, and My NIC2 also Public
Address
here my above setup working with any hassels

can any suggest me what is wrong, any recomendation on the above setup
where NAT to NAT giving problem

thanks in advance
hare





