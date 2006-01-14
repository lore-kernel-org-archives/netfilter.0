From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: EMAIL and NAT HELP
Date: Sat, 14 Jan 2006 08:48:04 +0100
Message-ID: <000001c618de$da354b90$0101000a@sterenborg.info>
References: <20060114072747.48053.qmail@web54705.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060114072747.48053.qmail@web54705.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org scribbled on :

> I am trying to run our qmail E-Mail server behind our
> firewall.  Our firewall is a linux box running
> iptables.  The current configuration is as following:
> 
> Firewall
> Eth0:  10.10.10.1  --- Internal LAN
> Eth1:  208.10.10.1 --- Primary Internet
> Eth1:0: 208.10.10.2 --- Alias for web (listed in DNS)
> Eth1:1  208.10.10.3 --- Alias for E-mail (listed in
> DNS)
> 
> Email Server
> Eth0:   10.10.10.100
> 
> Web Server
> Eth0:   10.10.10.200
> 
> Basically I need every packet that arrives on
> Ethernet1:1 using ports 110,25,143 forwarded to
> 10.10.10.100.  10.10.10.100 then needs to reference
> all it packets to 208.10.10.1 when send back to
> internet community.

I suppose you have FORWARD policy set to DROP :


$ipt -A FORWARD -m state --state RELATED,ESTABLISHED \
   -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i eth1 -o eth0 \
  -d 10.10.10.100 -p tcp --dport 25 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i eth1 -o eth0 \
  -d 10.10.10.100 -p tcp --dport 110 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i eth1 -o eth0 \
  -d 10.10.10.100 -p tcp --dport 143 -j ACCEPT

$ipt -t nat -A PREROUTING -i eth1 -d 208.10.10.3 \
  -p tcp --dport 25 -j DNAT --to 10.10.10.100
$ipt -t nat -A PREROUTING -i eth1 -d 208.10.10.3 \
  -p tcp --dport 110 -j DNAT --to 10.10.10.100
$ipt -t nat -A PREROUTING -i eth1 -d 208.10.10.3 \
  -p tcp --dport 143 -j DNAT --to 10.10.10.100


Or, if you can use the multiport module :


$ipt -A FORWARD -m state --state RELATED,ESTABLISHED \
   -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i eth1 -o eth0 \
  -d 10.10.10.100 -m multiport -p tcp \
  --dports 25,110,143 -j ACCEPT

$ipt -t nat -A PREROUTING -i eth1 -d 208.10.10.3 \
  -m multiport -p tcp --dports 25,110,143 \
  -j DNAT --to 10.10.10.100


Gr,
Rob


