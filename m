From: =?iso-8859-1?Q?Andr=E9_Paulsberg?= <Andre.Paulsberg@evry.com>
Subject: RE: Quick help with stateless firewall
Date: Mon, 17 Jun 2013 07:23:22 +0000
Message-ID: <838AB161BE491743AE3CA3A916CF1CC601A35086@ccdex004>
References: <51BCFB07.3060408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51BCFB07.3060408@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

There are no ICMP rules at all in your example , I would reckon you nee=
d 2 rules on a stateless firewall ( atleast ).

ONE for ICMP type 8 on OUTPUT ( your machine sending ECHO REQUEST ) , n=
ot need as long as you have ACCEPT for all OUTPUT .
and ONE for ICMP type 0 on INPUT ( other machines sending ECHO REPLY ba=
ck to your machine ) .

/sbin/iptables -A OUTPUT -p icmp -icmp-type 8 -j ACCEPT
/sbin/iptables -A INPUT -p icmp -icmp-type 0 -j ACCEPT

If you want others to be able to ping your machine you do the reverse w=
ay with the rules !

And since you ONLY need 2 services , you may want to remove this rule=20
/sbin/iptables -A INPUT -p tcp --dport 1000:65535 -j ACCEPT

If you need to allow for outgoing return traffic you should allow sourc=
e-services you need/use .
/sbin/iptables -A INPUT -p tcp --sport 80 --dport 1025:65535 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --sport 53 --dport 1025:65535 -j ACCEPT
/sbin/iptables -A INPUT -p udp --sport 53 --dport 1025:65535 -j ACCEPT

And same for OUTPUT ( unless you continue with all ACCEPT )
/sbin/iptables -A OUTPUT -p tcp --dport 80 --sport 1025:65535 -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 53 --sport 1025:65535 -j ACCEPT
/sbin/iptables -A OUTPUT -p udp --dport 53 --sport 1025:65535 -j ACCEPT
Or just
/sbin/iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
/sbin/iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

As a common rule with stateless firewalls YOU might wanna accept 2 more=
 ICMP types

/sbin/iptables -A OUTPUT -p icmp -icmp-type 3 -j ACCEPT
/sbin/iptables -A OUTPUT -p icmp -icmp-type 11 -j ACCEPT
/sbin/iptables -A INPUT -p icmp -icmp-type 3 -j ACCEPT
/sbin/iptables -A INPUT -p icmp -icmp-type 11 -j ACCEPT

Type 3 is used for all types of "unreachable" messages , and type 11 is=
 "time exceed" -
most commonly used for traceroute replies , but it is also sent for pac=
kets that travel "too far" :)


Best regards
Andr=E9 Paulsberg
Senior Network Engineer=20
Core Network
Operation, Network, Nordic Operations
andre.paulsberg@evry.com
M +47 xxx yyyyy


