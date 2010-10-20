From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons ACCOUNT
Date: Wed, 20 Oct 2010 11:16:29 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010201116060.3551@obet.zrqbmnf.qr>
References: <201010181712.03160.maarten@ba.be> <201010191009.32841.maarten@ba.be> <1287506749.13167.1042.camel@laplaplian> <201010201025.55825.maarten@ba.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201010201025.55825.maarten@ba.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org, Bob Miller <bob@computerisms.ca>


On Wednesday 2010-10-20 10:25, Maarten Vanraes wrote:

>> > ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask
>> > found: 194.0.234.0/255.255.255.0
>> > ACCOUNT: Table insert problem. Aborting
>
>this error message is due to a previous publicnet rule, and it can't seem to 
>find the matching network. even though it is the same one. (i suspect it is due 
>to network being 194.0.234.0/24 and the matcher is checking 
>194.0.234.0/255.255.255.0 ). also i suspect there is a another bug when 
>removing the rule that the matcher can't find the correct one (also due to 
>different netmask notations?) and thus not everything is removed which means 
>that i can't reinsert that one.

Do you have a minimal testcase available?
