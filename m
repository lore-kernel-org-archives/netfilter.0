From: "Yogini Parkhi" <yparkhi@bivio.net>
Subject: RE: nat problem...
Date: Fri, 22 Nov 2002 14:52:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <385DA3327471554CA86AACAA2BBB8130250EFD@plstnexc01.corp.networkrobots.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Rahul Jadhav <rahul@iatp.org>, netfilter@lists.netfilter.org

Hi Rahul,
Couple of tips that might help you...
1:=20
Use "iptables -L -v -n"
Look at the packet and byte counters in there and see which ones of your =
accept rules actually are accepting packets.

2:
Also a log rule at the end of your FORWARD chain might help identify =
what kinds of packets are getting dropped.  The log rule will look =
something like
$iptables -A FORWARD -m limit -j LOG -log-prefix "RAHULS_LOG"
This will log packets to your syslog "/var/log/messages" usually. You =
can observ those and debug further.

I suspect your syn packets are getting dropped.=20
Add the following rule right before: "$iptables -A FORWARD -p tcp -i =
$extra_dev -m state --state NEW,ESTABLISHED,RELATED --dport 80 -j =
ACCEPT" This rule you have.

$iptables -A FORWARD -p tcp -i $extra_dev --syn --dport 80 -j ACCEPT

Hopefully this rule will solve your immediate issue. Then the packet and =
byte counters will point out the unnecessary rules to you and you can =
remove those.

Hope this helps,
-Yogini




-----Original Message-----
From: Rahul Jadhav [mailto:rahul@iatp.org]
Sent: Friday, November 15, 2002 12:45 PM
To: netfilter@lists.netfilter.org
Subject: nat problem...

I have a setup without a dmz, ie, the servers (http, mail, ssh) share =
the same subnet as my intranet clients (dhcp). The iptables script I am =
struggling with allows clients to browse the net but refuses them =
connections to the servers. Somehow the firewall refuses tcp/udp =
connections meant for the servers. The firewall machine runs no public =
services (forwards traffic only).
the forward and nat rules that i use are

public_ip=3Dexternal web ip
intra_dev=3Dinternal iface
extra_dev=3Dexternal iface
intra_ip=3Dinternal ip
extra_ip=3Dexternal ip
http=3Dhttp server ip
mail=3Dmail server ip

# forward
$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# do I need these 2 lines
$iptables -A FORWARD -p tcp -i $intra_dev -o $extra_dev -j ACCEPT
$iptables -A FORWARD -p udp -i $intra_dev -o $extra_dev -j ACCEPT

$iptables -A FORWARD -p tcp -i $extra_dev -m state --state =
NEW,ESTABLISHED,RELATED --dport 80 -j ACCEPT
$iptables -A FORWARD -p tcp -i $extra_dev -m state --state =
NEW,ESTABLISHED,RELATED --dport 81 -j ACCEPT

$iptables -A FORWARD -p tcp -i $extra_dev -o $intra_dev --dport 80 -d =
$http -j ACCEPT
$iptables -A FORWARD -p tcp -i $extra_dev -o $intra_dev --dport 81 -d =
$mail -j ACCEPT

# prerouting
$iptables -A PREROUTING -t nat -p tcp -i $extra_dev -d $public_ip =
--dport 80 -j DNAT --to $http
$iptables -A PREROUTING -t nat -p tcp -i $extra_dev -d $public_ip =
--dport 81 -j DNAT --to $mail

# postrouting
# either these 2 rules or the masquerade rule works

$iptables -A POSTROUTING -t nat -p tcp -o $extra_dev -s $intra_lan -d =
$universe -j SNAT --to $extra_ip
$iptables -A POSTROUTING -t nat -p tcp -o $extra_dev -s $intra_lan -d =
$universe -j SNAT --to $extra_ip

$iptables -A POSTROUTING -t nat -o $extra_dev -j MASQUERADE

does someone see a problem that I can't. Also, could someone enlighten =
me about the output chain and whether or not I need it here.
Thanks

Rahul



