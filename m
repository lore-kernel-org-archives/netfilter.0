From: Khanh Tran <khanh@slc.edu>
Subject: RE: problem with DNAT ..
Date: Mon, 17 Feb 2003 11:17:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB5F2@EXCHANGE>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henti Smith <bain@tcsn.co.za>, netfilter@lists.netfilter.org

Try:

$IPTABLES -A FORWARD -i $ETH -d $MAIL_SERVER --protocol tcp --dport 80 -j
ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $WEBMAIL_IP --dport 80 -j DNAT --to
$MAIL_SERVER:80

Khanh Tran
Network Operations
Sarah Lawrence College


-----Original Message-----
From: Henti Smith [mailto:bain@tcsn.co.za]
Sent: Monday, February 17, 2003 11:06 AM
To: netfilter@lists.netfilter.org
Subject: problem with DNAT ..


hi all 

I have some DNAT rules which seems not to be working and I don't understand
why not here is the rules : 

I have aliased the IP's on the firewall in front of the servers to control
access and such (this cannot be changed)

$IPTABLES -t nat -I PREROUTING -d $WEBMAIL_IP 		-p tcp --dport 80
-j DNAT --to-dest $MAIL_SERVER:80
$IPTABLES -t nat -I PREROUTING -d $WEBMAIL_IP 		-p tcp --dport 443
-j DNAT --to-dest $MAIL_SERVER:443
$IPTABLES -t nat -I PREROUTING -d $LIVE_IP  		-p tcp --dport 110
-j DNAT --to-dest $MAIL_SERVER:110
$IPTABLES -t nat -I PREROUTING -d $IMSI_LIVE_IP1 	-p tcp --dport
0:65535 	-j DNAT --to-dest $IMSI_INT_IP1
$IPTABLES -t nat -I PREROUTING -d $IMSI_LIVE_IP2 	-p tcp --dport
0:65535 	-j DNAT --to-dest $IMSI_INT_IP2
$IPTABLES -t nat -I PREROUTING -d $IMSI_LIVE_IP1 	-p udp --dport
0:65535 	-j DNAT --to-dest $IMSI_INT_IP1
$IPTABLES -t nat -I PREROUTING -d $IMSI_LIVE_IP2 	-p udp --dport
0:65535 	-j DNAT --to-dest $IMSI_INT_IP2

in the output of iptables -t nat -L I get all the rules as they should be : 

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       udp  --  anywhere             external      udp to:internal
DNAT       udp  --  anywhere             external      udp to:internal
DNAT       tcp  --  anywhere             external      tcp to:internal
DNAT       tcp  --  anywhere             external      tcp to:internal
DNAT       tcp  --  anywhere             external      tcp dpt:pop-3
to:internal:110
DNAT       tcp  --  anywhere             external      tcp dpt:https
to:internal:443
DNAT       tcp  --  anywhere             external      tcp dpt:www
to:internal:80

But when I telnet to port 110 on external I don't get to the internal port
110 nor with any of the other stuff.
Can anybody suggest places to look at why not ? 

Henti 



