From: duren duren <jusdurian_jr@yahoo.com>
Subject: Ask: Default Policy DROP for INPUT, OUTPUT and FORWARD
Date: Sat, 16 Feb 2008 22:19:37 -0800 (PST)
Message-ID: <24410.61709.qm@web55403.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

i want build firewal for router in one machine as a
squid proxy server,  caching dns server and bandwith
limiter with HTB.

i use default policy DROP for forward, input, and
output

-------- code ----------------
# Clean old firewall
$IPT -F
$IPT -X
$IPT -t nat -F
$IPT -t nat -X
$IPT -t mangle -F
$IPT -t mangle -X

$MPROBE ip_conntrack
$MPROBE ip_conntrack_ftp
$MPROBE ip_nat_ftp
$MPROBE ip_nat_irc

# Setting default filter policy
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

# Unlimited access to loop back
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# Allow UDP, DNS and Passive FTP
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT
------------ end of code
--------------------------------------

and my problem is, what filter i must write so my
client can connect into my router.
first i only define PREROUTING, FORWARD and
POSTROUTING, but my client can't ping into router.

so, if i want default policy DROP for forward, input,
output, prerouting and postrouting, what i want to do?
must i define all of this for allow my client?


thanks


      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
