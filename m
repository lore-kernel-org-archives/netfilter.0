From: mike <jericho@zoomtown.com>
Subject: comments + suggestions on my script
Date: Mon, 20 Jan 2003 10:39:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030120153937.BAQB8263.mta03.fuse.net@smtp.fuse.net>
Reply-To: jericho@zoomtown.com
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

ok here's my script that I've been working on for awhile.  Here's what I'm trying to acheive, I run a  dns, http, smtp servers and nat for my windows box.  I just wanna know if there's any holes or anything that can be improved.  Thanks Mike


iptables="/usr/sbin/iptables"
## Source NAT all outgoing connections
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 66.161.456.32

## Create block chain
$iptables -F
$iptables -N block


## Allow connections that are alrealy established or related back in.
$iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT

## network test stuff
$iptables -P FORWARD DROP
$iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

## Things we want to accept as incoming. 
## www.  smtp.  ssh.  domain.
$iptables -A block -p tcp --dport www -j ACCEPT
$iptables -A block -p tcp --dport domain -j ACCEPT
$iptables -A block -p udp --dport domain -j ACCEPT
$iptables -A block -p tcp --dport ssh -j ACCEPT
$iptables -A block -p tcp --dport smtp -j ACCEPT


### allow everything from me on my windows box
$iptables -A block -s 192.168.0.2 -d 0/0 -p all -j ACCEPT

### allow rndc commands
$iptables -A block -p tcp --dport 953 -s 127.0.0.1  -j ACCEPT

### my isp nameserver crap
$iptables -A block -s 66.161.456.132 -d 0/0 -p all -j ACCEPT
$iptables -A block -s 216.68.43.19 -d 0/0 -p all -j ACCEPT
$iptables -A block -s 216.68.53.19 -d 0/0 -p all -j ACCEPT

## Drop everything else
$iptables -A block -j DROP

## Jump to block chain from INPUT and FORWARD chains.
$iptables -A INPUT -j block
$iptables -A FORWARD -j block
## INPUT has a default to accept. If it doesn't fit the -j block, drop it.
$iptables -A INPUT -j DROP


