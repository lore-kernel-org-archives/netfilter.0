From: Antoine Souques <corum@via.ecp.fr>
Subject: Problem with arptables et mangle
Date: Sat, 24 Jul 2010 18:44:23 +0200
Message-ID: <4C4B1867.6050006@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have some trouble to mangle the hardware arddresses with arptables. It 
works fine with IP adresses, but I cannot enter a rule with 
--mangle-hw--(d|s)

# arptables -A FORWARD --h-length 6 -s 138.195.130.6 --opcode 2 -j 
mangle --mangle-hw-s 00:01:30:12:3c:70

And my box tells me : Bad argument `00:01:30:12:3c:70'

kernel :  Debian GNU/Linux, kernel 2.6.26-2-amd64

# lsmod |grep arp
arpt_mangle             6400  0
arptable_filter         6656  0
arp_tables             18832  1 arptable_filter
x_tables               25224  2 arpt_mangle,arp_tables

I have the version 0.0.3.3 of arptables

Thanks,

Antoine
