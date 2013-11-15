From: "Pol Hallen" <iptablesml@fuckaround.org>
Subject: advice about my first iptables rules
Date: Fri, 15 Nov 2013 12:40:36 +0100
Message-ID: <9c0b81def7eb50034ab99aa2738d159e.squirrel@fuckaround.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all :-)
First off all I ask sorry for this newbies question. I study iptables and
I need speak with someone about my first iptables rules, my situation:

internet --- SERVER --- lan

On the server I wrote this rules and I'd like understand if I can modify
and/or add new rules to blocks any malicious network attacks (from
internet and lan too - a compromised internal lan client could build
problems). (I use also fail2ban and psad). Thanks for help!

Pol

iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -f -j DROP
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -f -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT

