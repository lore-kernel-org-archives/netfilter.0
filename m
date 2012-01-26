From: Mrunal Upadhyay <m.upadhyay@sta.samsung.com>
Subject: Set DSCP field for ipv6 packets using ip6tables command
Date: Wed, 25 Jan 2012 18:00:25 -0600
Message-ID: <083EE18768D966439D1223E96B690A910629868CBA@staex7mb2.telecom.sna.samsung.com>
References: <083EE18768D966439D1223E96B690A910629868A65@staex7mb2.telecom.sna.samsung.com>
 <alpine.LNX.2.01.1201252203130.24440@frira.zrqbmnf.qr>
 <083EE18768D966439D1223E96B690A910629868C79@staex7mb2.telecom.sna.samsung.com>
 <alpine.LNX.2.01.1201260039130.25025@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1201260039130.25025@frira.zrqbmnf.qr>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Jan Engelhardt <jengelh@medozas.de>

>>>-j TOS sets the Class field in IPv6 and TOS field in IPv4.
>>
>>I tried to use the -j TOS option but it only sets the TOS field to 
>>Minimize-Delay, Maximize-Throughput, Maximize-Reliability, 
>>Minimize-Cost or Normal-Service.
>
>It supports setting arbitrary values and optionally keeping certain 
>prior bits: -j TOS --set-tos 0xab/0xcd, see manpage for details.
>
>I guess we can add recognition of the "EF" strings et al to TOS as well, 
>but then again, I don't see DSCP having set significant foot into the 
>world. Even Linux's packet scheduler still uses the TOS mnemonics.

>>I am more interested in setting the Differentiated Service Code Point 
>>Bits to classes EF, BE or any of CSxx or AFxx classes just for ipv6 
>>packets using ip6tables command.

Ok so now I understand using -j TOS --set-tos would help me to set the desired DSCP value based on the value I pass.

But does the current ip6tables command support TOS target for IPV6 packets?

