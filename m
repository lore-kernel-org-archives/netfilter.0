From: Chris Born <ragable@attbi.com>
Subject: Re: Letting Hotline downloads through
Date: Thu, 17 Oct 2002 07:57:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.1.6.0.20021017075728.00b98cf8@mail.attbi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to setup a Hotline server on an internal NATed machine and I'm 
having problems with getting clients to download. Here's what I have so far:

$EXTIF="eth1"
$INTIF="eth0"
$IPTABLES=/sbin/iptables
$EXTIP=12.252.56.159
$RAGABLE=192.168.0.2

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 5500:5503 -m state 
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF --dport 5549 -m state --state 
NEW,ESTABLISHED,RELATED
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 5500:5003 -j DNAT 
--to $RAGABLE:5500:5503
$IPTABLES -A PREROUTING -t nat --dport 5549 -j SNAT --to $EXTIP

According to the Hotline server documentation, incoming connection requests 
come in on ports 5500 - 5503 while outgoing download connections are on 
port 5549. People are able to connect to the server just fine, but are 
unable to download so I'm wondering what rules I need to let the downloads 
through.

-Chris Born 



