From: Jason Opperisano <opie@817west.com>
Subject: Re: Need an advice
Date: Tue, 23 Nov 2004 11:46:22 -0500
Message-ID: <20041123164622.GA2134@bender.817west.com>
References: <C97EC9D40F9B8E469B2187228615909104853C@mail.crescat.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <C97EC9D40F9B8E469B2187228615909104853C@mail.crescat.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 23, 2004 at 05:47:10PM +0600, Hirantha Wijayawardena wrote:
> Hi,
>
> Thank a lot for those posts. I have an ADSL router which is built-in
> NAT
> to the LAN users.
>
> <INTERNET> <--> <ADSLROUTER (NAT enabled)> <--> <eth0><LINUX
> FIREWALL><eth1>
>
> INET_IFACE="eth0"
> INET_IP="192.168.1.2"
>
> LAN_IP="10.1.1.1"
> LAN_IFACE="eth1"
>
> IPTABLES="/usr/sbin/iptables
> $IPTABLES -N allowed
> $IPTABLES -N tcp_packets
>
> 1.) I do not wanted to enable the NAT on my Linux firewall but tight
> the
> security for the LAN users, though the following rule is still valid!
> Is
> it ture?
>
> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT -to $INET_IP

looks fine to me.

> 2.) If I need to install and enable squid/SquidGuard on the Linux
> firewall and redirect LAN user's initial web request to the squid
> authentication page. Is the following rules are enough?
>
> $IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p tcp --dport 80 \
>               -j REDIRECT --to-ports 3128
> $IPTABLES -A OUTPUT -j ACCEPT -m state --state NEW -o $INET_IFACE \
>               -p tcp --dport 80

if you're doing transparent redirection--keep in mind that both the LAN
users and the firewall/proxy will need to be able to do DNS lookups.

> 3.) How do I enable LAN users to access specific services on the
> internet (i.e. http,https,pop3,mms and dns) only and block all other
> ports. Is it possible with following rules?
>
> $IPTABLES -A INPUT -i $INET_IFACE -p tcp ! --syn --source-port 25 \
>               -s $INET-IP --destination-port 1024: -j ACCEPT
> $IPTABLES -A OUTPUT -o $INET_IFACE -p tcp -s $INET_IP --source-port
> 1024: \
>               --destination-port 25 -j ACCEPT
>
> $IPTABLES -A INPUT -i $INET-IFACE -p tcp ! --syn --source-port 80 \
>               -s $INET-IP --destination-port 1024: -j ACCEPT
> $IPTABLES -A OUTPUT -o $INET_IFACE -p tcp -s $INET_IP --source-port
> 1024: \
>               --destination-port 80 -j ACCEPT
>
> and so on...

i see sample rule sets all the time like this, with the two-way rules
that make me think back to the days of ipchains, and why i ended up
switching to IPF...  anyways, the modicum of added security from writing
your rules this way (to me) doesn't seem worth the added convolution.
allow established reply packets first, and allow your requests out.

also--if your intent is to allow the internal LAN users to access these
services on the Internet--you need to be modifying the FORWARD
chain--not INPUT and OUTPUT.  also--if you're trying to force your users
through the proxy, allowing them out on port 80 kinda defeats the
purpose (i know, i know--NAT PREROUTING will take precedence):

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  # smtp dns pop3 https mms
  for tcpport in 25 53 110 443 1755; do
    iptables -A FORWARD -i $LAN_IFACE -o $INET_IFACE -p tcp --syn \
      -m state --state NEW --sport 1024:65535 --dport $tcpport -j ACCEPT
  done

  # dns mms
  for udpport in 53 1755; do
    iptables -A FORWARD -i $LAN_IFACE -o $INET_IFACE -p udp \
      -m state --state NEW --sport 1024:65535 --dport $udpport -j ACCEPT
  done

> 4.) If I run the DNS service (DNS forwarder) on the Linux firewall, is
> following rule is still valid as previous mail explained?
>
> $IPTABLES -A tcp_packets --dport 53 -j allowed

the vast majority of DNS name resolution requests are UDP, not TCP.  if
you want to run a caching DNS server on your firewall:

  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

  # allow internal clients to make DNS requests to firewall
  iptables -A INPUT -i $LAN_IFACE -p tcp --syn -m state --state NEW \
    --sport 1024:65535 --dport 53 -j ACCEPT
  iptables -A INPUT -i $LAN_IFACE -p udp -m state --state NEW \
    --sport 1024:65535 --dport 53 -j ACCEPT

  iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

  # allow firewall to make DNS requests to Internet
  iptables -A OUTPUT -o $INET_IFACE -p tcp --syn -m state --state NEW \
    --sport 1024:65535 --dport 53 -j ACCEPT
  iptables -A OUTPUT -o $INET_IFACE -p udp -m state --state NEW \
    --sport 1024:65535 --dport 53 -j ACCEPT

> Please advice since I need to get good understand about iptables
> before
> I going to implement stage.
>
> Thanks in advance.
>
> - Hirantha

hope this helps...

-j

--
"I've figured out an alternative to giving up my beer. Basically,
 we become a family of traveling acrobats!"
        --The Simpsons

