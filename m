From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: dhcp windows client port
Date: Sat, 12 Nov 2005 18:08:14 +0100
Message-ID: <20051112171451.3D7E76ADE8@smtp.sterenborg.info>
References: <BAY102-F3471223F91A898773DE401AE580@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F3471223F91A898773DE401AE580@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> i wish  the windows machine which receives Internet from the
> firewall pc to be restricted fully apart from the port needed to
> access the internet
> 
> the windows machine has got fully access when my rc.firewall
> contains
> 
> $iptables -A FORWARD -i $LAN_IFACE -j ACCEPT
> 
> which gives to the windows machine access to every port
> 
> i've tried unsuccesully the following command
> 
> $iptables -A FORWARD -p TCP -i $LAN_IFACE -- sport XX -j ACCEPT
> 
> my netstat on the windows machine displays various connections
> few questions now
> 
> 
> 1 which port should be alolwed for the windows machine to see internet
> 2 can i restrct it to  something like :
> $iptables -A FORWARD  -p TCP -i $LAN_IFACE  -sport XX -dport XX -j
> ACCEPT 
> 
> in other words, allow  the windows relevant port for accesing on the
> internet  to be connected to the specific port of the firewall

You will not connect to any port on the firewall. The firewall will
route your packets through to the internet.

To access websites you need DNS (port 53/udp, sometimes tcp) to be able
to resolve the hostname of the website. Further, most websites use http
and/or https, ports 80/tcp and 443/tcp.
So, your ruleset would look like :

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
  -p udp --dport 53 -j ACCEPT
$ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
  -p tcp --dport 53 -j ACCEPT
$ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
  -p tcp --dport 80 -j ACCEPT
$ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
  -p tcp --dport 443 -j ACCEPT

But, this way you will not be able to browse a website that is not
hosted on a standard port (eg 81/tcp).
For more information about Netfilter, check out
http://iptables-tutorial.frozentux.net/iptables-tutorial.html.


Gr,
Rob


