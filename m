From: "mike" <jericho@fuse.net>
Subject: comments + suggestions on script hopefully can help others out
Date: Sat, 26 Oct 2002 02:56:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003e01c27cbc$da32bf90$0200a8c0@winbox>
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

Ok I've been testing things out here and there and I think I finally got my
firewall script exactlly how I need it.  I'm hoping this can help others
out, cause it's a pain looking through as much stuff as I did for examples
and that.  Start with what I intend to do.  1.) I want to block EVERYTHING
coming in.  2.) allow services that I want to run, I'll be running a DNS
server, mail, pop3 etc.  3.) Using my linux box as a gateway for my 2
windows comps so I setup IP MASQ for them to connect to internet.  Here's
what I've come up with, I've got some questions underneath on things I'm a
little fuzzy on, some things just weren't comprehending

iptables="/usr/sbin/iptables"

## Create block chain
  $iptables -N block

## Allow connections that are alrealy established or related back in.
  $iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
^^ I'm taking this as whatever is running, it'll accept connections back?

## network test stuff
$iptables -P FORWARD DROP
$iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
^^ NAT stuff I'm not real big on, not exactly sure how this works, or what
it lets in and out, but it gets my other boxes online

## Things we want to accept as incoming.
## www.  smtp.  domain.  http.  ident.
  $iptables -A block -p tcp --dport ftp -i eth0 -j ACCEPT
  $iptables -A block -p tcp --dport www -i eth0 -j ACCEPT
  $iptables -A block -p udp --dport www -i eth0 -j ACCEPT
  $iptables -A block -p tcp --dport domain -i eth0 -j ACCEPT
  $iptables -A block -p udp --dport domain -i eth0 -j ACCEPT
  $iptables -A block -p tcp --dport smtp -i eth0 -j ACCEPT
  $iptables -A block -p tcp --dport auth -i eth0 -j ACCEPT

### windows box
$iptables -A block -s 192.168.0.2 -d 0/0 -p all -j ACCEPT

### friend to leech from ftp
$iptables -A block -p tcp --dport 21 -s 150.135.141.93 -j ACCEPT

### nameserver crap
$iptables -A block -s 66.152.144.154 -d 0/0 -p all -j ACCEPT
$iptables -A block -s 231.68.4.10 -d 0/0 -p all -j ACCEPT
$iptables -A block -s 231.68.5.10 -d 0/0 -p all -j ACCEPT

## Drop everything else
  $iptables -A block -j DROP

 ## Jump to block chain from INPUT and FORWARD chains.
  $iptables -A INPUT -j block
  $iptables -A FORWARD -j block
## INPUT has a default to accept. If it doesn't fit the -j block, drop it.
  $iptables -A INPUT -j DROP


That's my script hopefully someone can use this as a starting point.  If
someone could clear up for me what the ESTABLISHED and MASQUERADING chains
do exactly would be awesome.  Please feel free to offer any comments or
suggestions.  Thanks Mike



