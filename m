From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Nat
Date: Sun, 08 Sep 2002 23:49:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7BC5EE.7040000@fugmann.dhs.org>
References: <3D7BB687.6010300@iol.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mattia Martinello <m.martinello@iol.it>
Cc: netfilter@lists.netfilter.org

Mattia Martinello wrote:
> 
> iptables -t nat -F POSTROUTING
> iptables -t nat -A POSTROUTING -j DROP
This drops every packet, leaving the box. This is not what you want.

> iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -o ppp0 -j 
> MASQUERADE
> 

First masquerade the packets:
$ iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -o ppp0 \
	-j MASQUERADE

Now only allow packets from the network that is to have internet access 
to pass through the firewall. All these packets go through the FORWARD 
chain in the FILTER tables. This is where you want to filter who should 
have internet access or not.

$ iptables -P FORWARD DROP
$ iptables -A FORWARD -s 192.168.1.0/255.255.255.0 -o ppp0 -j ACCEPT

Now allow only packets related to a connection from the lan to pass 
through the firewall from the internet.

$iptables -A FORWARD -i ppp0 -m state --state RELATED,ESTABLISHED \
	-j ACCEPT

And lastly close up the firewall, but allow the firewall itself to 
receive replys:

$iptables -P INPUT DROP
$iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

And allow clients from the lan's to ssh to the firewall.
$ iptables -A INPUT -i eth+ -p tcp --dport ssh -j ACCEPT

Thats it. If you want the two lans to be able to talk to eachother then add:

$ iptables -A FORWARD -i eth+ -o eth+ -j ACCPET

Hope it helps.
If not, then read and unserstand (thats the importent part) the howtos 
and tutorials for iptables.

Regards
Anders Fugmann

--
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org




