From: =?ISO-8859-1?Q?S=3F=E9bastien_Cramatte?= 
	<scramatte@zensoluciones.com>
Subject: Why REJECT target  is not supported with MANGLE ?
Date: Wed, 09 Jan 2008 23:20:42 +0100
Message-ID: <478548BA.2020903@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Why REJECT target  is not supported with MANGLE ?


My server is running debian etch4 with 2.6.22 kernel  and setuped as 
traffic shaper + transparent bridge

The command with connlimit  bellow won't work and return me "Invalid 
Argument"

iptables  -t mangle -N mytable
iptables --table mangle --append POSTROUTING --out-interface br0 --match 
physdev --physdev-is-bridged --physdev-out eth0 --jump  mytable

iptables  -t mangle -A mytable --proto tcp --match connlimit 
--connlimit-above 15 --connlimit-mask 32 --jump REJECT
iptables  -t mangle -A mytable --jump CLASSIFY --set-class 1:10

How can I achieve this kind of setup ?

Regards
