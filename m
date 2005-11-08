From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: IPTABLES PROBLEM
Date: Tue, 8 Nov 2005 13:08:00 -0600
Message-ID: <200511081308.01754.rob0@gmx.co.uk>
References: <20051108170808.94047.qmail@web26603.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051108170808.94047.qmail@web26603.mail.ukl.yahoo.com>
Content-Disposition: inline
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

On Tuesday 2005-November-08 11:08, Micol lupen wrote:
> I have a lan whit 10 pc (use win9X) and have ip

Win9x? Ugly!

> //ETHERNET INTERFACE file conf.ps
> !/bin/bash

Missing the # at the beginning of that line. You don't really need a 
"shabang" line at all for just running a few simple commands.

> ifconfig eth0 10.10.10.50 netmask 255.255.255.0
> ifconfig eth1 178.133.80.74 netmask 255.255.255.248
> route add -net default gw 178.133.80.73 netmask
> 255.255.255.248
> # END SCRIPT CONF.PS

Slackware will do this for you. Run "netconfig" or just edit 
"/etc/rc.d/rc.inet1.conf".

> //--- I WRITE IN /etc/resolv.conf
> NAMESERVER=151.99.125.1

Nope. "nameserver 151.99.125.1".

> //--------FIREWALL SCRIPT firewall.ps

If at /etc/rc.d/rc.firewall, Slackware will run it for you.

> echo 1 > /proc/sys/net/ipv4/ip_forward

Normally this should come at the end. I put a "0" in at the beginning 
and then "1" after firewall protections are in place. (Similar to the 
script Rob posted just now.)

> $IPTAB -P INPUT DROP
> $IPTAB -P FORWARD DROP

Okay.

> $IPTAB -P OUTPUT  DROP

Unless you know exactly what you plan to do with OUTPUT filtering, I 
strongly suggest you give it up.

> # FROM LAN TO INTERNET
> $IPTAB -A INPUT -s 10.10.10.0/24 -i eth0 -j ACCEPT

No, that's from LAN to firewall machine. See "man iptables", near the 
beginning, where the tables and their built-in chains are described.

> # FORWORDING
> $IPTAB -A FORWARD -i eth0 -s 10.10.10.0/24 -j ACCEPT
> $IPTAB -A FORWARD -i eth1 -d 10.10.10.0/24 -j ACCEPT

Okay. I think that would work, anyway. I do it differently, see next.

> # QUERY DNS (SERVER-> CLIENT)
> $IPTAB -A INPUT -i eth1 -p udp -s $NAMESERVER --sport
> 53 -m state --state ESTABLISHED -j ACCEPT

A simple --state RELATED,ESTABLISHED -j ACCEPT rule along with OUTPUT 
policy of ACCEPT would do better. I put that rule in a "State" chain 
and jump to State from both INPUT and FORWARD.

But that (INPUT) has nothing to do with your problem below.

> #NAT
> $IPTAB -t nat -A POSTROUTING -o eth1 -s 10.10.10.0/24
> -j SNAT --to $IPADD

Okay.

> WHEN I START TO FIREWALL THE CLIENT CAN'T TO GO TO
> INTERNET, HELP ME !!!!

And how are you diagnosing this? What did you try? What happened?

> P.S. excuse me for my bad english

Your English is fine. Work on your troubleshooting skills. :)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

