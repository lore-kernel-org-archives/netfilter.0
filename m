From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Blocking ports for outsider
Date: Mon, 11 Feb 2008 14:52:50 +0100
Message-ID: <004f01c86cb5$64a933f0$0b0ffe0a@NS006819>
References: <1202726951.23042.0.camel@tarak.lk.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1202726951.23042.0.camel@tarak.lk.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Hi,
>     I have a mail server which has two interface eth0[internal],
> eth1[external]. i want certain ports like 25, 110, 995 will
> be open for
> outsider as wel as local, and some port 10000, 5666 , will be open for
> local only.. , if anyone help me out regarding this...
>
> i'm a mail-system guy,so i'm not very much aware of iptables rules, if
> anyone give me some documentation links for Mailling System related
> iptables documentation, that will be helpful for me

It's best practice to have everything closed and just open up the ports
(to specific IP's) where needed.

$LAN could be the network address you're using or a specific IP.

$ipt -P INPUT DROP
$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A INPUT -m state --state NEW -i lo -j ACCEPT
$ipt -A INPUT -m state --state NEW -p tcp -m multiport \
  --dports 25,110,995 -j ACCEPT
$ipt -A INPUT -m state --state NEW -s $LAN -p tcp \
  -m multiport --dports 5666,10000 -j ACCEPT

If you don't have the multiport match, you can do this instead:

$ipt -P INPUT DROP
$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A INPUT -m state --state NEW -i lo -j ACCEPT
$ipt -A INPUT -m state --state NEW -p tcp --dport 25 -j ACCEPT
$ipt -A INPUT -m state --state NEW -p tcp --dport 110 -j ACCEPT
$ipt -A INPUT -m state --state NEW -p tcp --dport 995 -j ACCEPT
$ipt -A INPUT -m state --state NEW -s $LAN -p tcp \
  --dport 5666 -j ACCEPT
$ipt -A INPUT -m state --state NEW -s $LAN -p tcp \
  --dport 10000 -j ACCEPT

As you can see the latter do the same rules as the first rules, there
are just more rules to process.

Oskar Andreasson wrote a good iptables tutorial.
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Grts,
Rob


