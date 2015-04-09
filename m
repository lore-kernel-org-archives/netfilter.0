From: "Vince Cooper" <swUjefra@dcemail.com>
Subject: Clarification needed on use of -m owner --uid-owner
Date: Wed, 8 Apr 2015 20:53:58 -0700
Message-ID: <20150408205358.39C1E112@m0005309.ppops.net>
Reply-To: <swUjefra@dcemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm new to iptables and would appreciate it if someone could point out to me if -m owner --uid-owner spring can be used in the following rules:

(1) iptables -A OUTPUT -o lo -m owner --uid-owner spring -j ACCEPT

(2) iptables -A OUTPUT -o eth0 -m owner --uid-owner spring -j REJECT

(3) iptables -A OUTPUT -p tcp -m tcp -m conntrack -d 123.123.123.123 -o eth0 -m owner --uid-owner spring --dport 443 -j ACCEPT --ctstate NEW,ESTABLISHED 

(4)
(a) iptables -A OUTPUT -p tcp -m tcp -m conntrack -o tun0 -m owner --uid-owner spring --dport 80 -j ACCEPT  --ctstate NEW,ESTABLISHED

(b) iptables -A OUTPUT -p tcp -m tcp -m conntrack -o tun0 -m owner --uid-owner spring --dport 443 -j ACCEPT  --ctstate NEW,ESTABLISHED

(c) iptables -A OUTPUT -p udp -m udp -m conntrack -o tun0 -m owner --uid-owner spring --dport 53 -j ACCEPT  --ctstate NEW,ESTABLISHED

(d) iptables -A OUTPUT -p tcp -m tcp -m conntrack -o tun0 -m owner --uid-owner spring --dport 53 -j ACCEPT  --ctstate NEW,ESTABLISHED

Additional info:

I.  No root account was created during installation of Debian Wheezy
II. Name of account of user is spring

Thanks.

Vince

_____________________________________________________________
Washington DC's Largest FREE Email service. ---> http://www.DCemail.com ---> A Washington Online Community Member --->
http://www.DCpages.com
