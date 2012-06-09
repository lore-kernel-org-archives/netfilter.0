From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: Cannot block entire country with ipset or recent. How!?
Date: Fri, 08 Jun 2012 23:37:18 -0600
Message-ID: <20120608233718.d46yxn49kwsoos48@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org

HellO!!,

I know this sounds strange but I need to block an entire country if it  
hits a connection limit threshold. For the purpose of this test I set  
that to 1 so it hits fast. Please note that iam already using conn  
mask of 0.

Both examples just BAN my individual IP and not all of the country. How?

Regards,
JP


------------ This is the example with ipset -----------

# WE CREATE THE IPSET LISTS
ipset -N CR_set iphash
ipset -N WHOLE_set iphash
ipset -N Ban_list iptree --timeout 3800

# wE CREATE AN APPLY THE CHAIN
iptables -N reject_whole_country
iptables -A INPUT -j reject_whole_country
iptables -A reject_whole_country -m geoip --src-cc CR -j SET --add-set  
WHOLE_set src
iptables -A reject_whole_country -m set --match-set WHOLE_set src -m  
connlimit --connlimit-above 1 --connlimit-mask 0 -j SET --add-set  
Ban_list src
#This rules apply for ban lists
iptables -A INPUT -m set --match-set Ban_list src -j REJECT


------------ This is the example with -m recent -----------

iptables -A INPUT -m recent --rcheck --seconds 3800 -j REJECT
iptables -N reject_whole_country
iptables -A INPUT -j reject_whole_country
iptables -A reject_whole_country -m geoip --src-cc CR -j SET --add-set  
WHOLE_set src
iptables -A reject_whole_country -m set --match-set WHOLE_set src -m  
connlimit --connlimit-above 1 --connlimit-mask 0 -m recent --set -j  
REJECT


