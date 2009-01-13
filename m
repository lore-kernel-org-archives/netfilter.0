From: Peter Renzland <peter@dancing.org>
Subject: False reading of /proc/net/ip_conntrack
Date: Tue, 13 Jan 2009 03:28:10 -0500
Message-ID: <D9A969EE-E387-4F8A-9313-9D4A2F5A5391@dancing.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Suppose we want to count connections.  We might use wc, grep, sed,  
awk, or dd.

It turns out that only cat reads 100% of the records in the file.

wc, grep, and sed each read exactly about every other line.

awk reads 75%.

dd reads 80%.



Is this generally known?  Is it generally so?


The system I'm working with is a WRT54GL router running Tomato v1.23,  
Busybox v1.12.3, Linux 2.4.20 mips


Here's a transcript:

wc -l /proc/net/ip_conntrack                        73 /proc/net/ 
ip_conntrack
wc -l < /proc/net/ip_conntrack                     73
cat /proc/net/ip_conntrack | wc -l                 138

grep -c '' /proc/net/ip_conntrack                  73
grep -c '' < /proc/net/ip_conntrack                73
cat /proc/net/ip_conntrack | grep -c ''            138

sed n '$=' /proc/net/ip_conntrack                  73
sed -n'$=' < /proc/net/ip_conntrack                73
cat /proc/net/ip_conntrack | sed -n '$='           137

awk 'END{print NR}' /proc/net/ip_conntrack         97
awk 'END{print NR}' < /proc/net/ip_conntrack       97
cat /proc/net/ip_conntrack | awk 'END{print NR}'   136

wc -l /proc/net/ip_conntrack                        72 /proc/net/ 
ip_conntrack



Peter
