From: Tom <tom@tomdp.com>
Subject: locally access server behind firewall
Date: Wed, 01 Sep 2004 19:53:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41360CA0.6090109@tomdp.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have a linux firewall (iptables), and a linux server with apache 
behind that firewall. My provider blocks ports below 1024, so I have a 
prerouting-rule that redirects traffic like this:

$IPTABLES -A PREROUTING -t nat -i $WWW p tcp -d $EXTIP --dport 8888 -j 
DNAT --to $SERVER:80

I also have 2 forward-rules:

$IPTABLES -A FORWARD -i $WWW -o $LAN -p tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -i $LAN -o $WWW -p tcp --sport 80 -j ACCEPT

and I have these two lines to allow my local pc's to connect to the 
firewall with ssh and stuff like that:
$IPTABLES -A INPUT -i $LAN -s $INTLAN -j ACCEPT
$IPTABLES -A OUTPUT -o $LAN -d $INTLAN -j ACCEPT


where:
  $EXTIP = my external IP address
  $WWW is eth1
  $LAN is eth0
  $SERVER = my server's internal IP address.
  $INTLAN = "192.168.0.0/24"

This works really well when I try to connect from the outside to my 
webserver. But, if I try to connect to http://myserver.com:8888 from the 
internal network (or from my server itself), I always get 'connection 
refused'. I'm pretty sure I need some other rules, but can someone 
please help me in the good direction here? Thanks a lot!!



PS: Here's a little drawing of the situation:

SERVER (eth0) <----> (eth0) GATEWAY-PC (eth1) <----> internet


