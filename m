From: Rahul Jadhav <rahul@iatp.org>
Subject: nat problem...
Date: Fri, 15 Nov 2002 14:45:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DD55CD4.70704@iatp.org>
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
To: netfilter@lists.netfilter.org

I have a setup without a dmz, ie, the servers (http, mail, ssh) share the same subnet as my intranet clients (dhcp). The iptables script I am struggling with allows clients to browse the net but refuses them connections to the servers. Somehow the firewall refuses tcp/udp connections meant for the servers. The firewall machine runs no public services (forwards traffic only).
the forward and nat rules that i use are 

public_ip=external web ip
intra_dev=internal iface
extra_dev=external iface
intra_ip=internal ip
extra_ip=external ip
http=http server ip
mail=mail server ip

# forward
$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# do I need these 2 lines
$iptables -A FORWARD -p tcp -i $intra_dev -o $extra_dev -j ACCEPT
$iptables -A FORWARD -p udp -i $intra_dev -o $extra_dev -j ACCEPT

$iptables -A FORWARD -p tcp -i $extra_dev -m state --state NEW,ESTABLISHED,RELATED --dport 80 -j ACCEPT
$iptables -A FORWARD -p tcp -i $extra_dev -m state --state NEW,ESTABLISHED,RELATED --dport 81 -j ACCEPT

$iptables -A FORWARD -p tcp -i $extra_dev -o $intra_dev --dport 80 -d $http -j ACCEPT
$iptables -A FORWARD -p tcp -i $extra_dev -o $intra_dev --dport 81 -d $mail -j ACCEPT

# prerouting
$iptables -A PREROUTING -t nat -p tcp -i $extra_dev -d $public_ip --dport 80 -j DNAT --to $http
$iptables -A PREROUTING -t nat -p tcp -i $extra_dev -d $public_ip --dport 81 -j DNAT --to $mail

# postrouting
# either these 2 rules or the masquerade rule works

$iptables -A POSTROUTING -t nat -p tcp -o $extra_dev -s $intra_lan -d $universe -j SNAT --to $extra_ip
$iptables -A POSTROUTING -t nat -p tcp -o $extra_dev -s $intra_lan -d $universe -j SNAT --to $extra_ip

$iptables -A POSTROUTING -t nat -o $extra_dev -j MASQUERADE

does someone see a problem that I can't. Also, could someone enlighten me about the output chain and whether or not I need it here.
Thanks

Rahul



