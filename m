From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: locally access server behind firewall
Date: Wed, 1 Sep 2004 14:13:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409011809.i81I94Fh094124@jkcpub.iserver.net>
References: <41360CA0.6090109@tomdp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41360CA0.6090109@tomdp.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Tom' <tom@tomdp.com>, netfilter@lists.netfilter.org

Hi Tom,

I think your Apache server is expecting connections on port 80 & your
Nat'ing will occur only if the packet comes in form the $WWW interface.
Since you are on the local LAN the packets are not Nat'ted and hence you get
the connection refused from the server as it is getting requests on a port
where no application is listening.

You don't need any rule, just type http://myserver.com within the LAN.


Hope this helps!
Regards,

Deepak Seshadri


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Tom
Sent: Wednesday, September 01, 2004 1:54 PM
To: netfilter@lists.netfilter.org
Subject: locally access server behind firewall

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




