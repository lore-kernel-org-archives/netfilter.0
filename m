From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: iptables links
Date: Mon, 18 Jul 2011 10:35:43 -0700
Message-ID: <4E246EEF.2060809@arpa.org>
References: <4E03BB34.70704@abpni.co.uk> <alpine.LNX.2.01.1106240143500.20064@frira.zrqbmnf.qr> <4E03D4F7.9040609@abpni.co.uk> <alpine.LNX.2.01.1106250007250.16290@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1106250007250.16290@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, Jonathan Tripathy <jonnyt@abpni.co.uk>

I've had the need for the same functionality, so I wrote the script 
below.  It takes one argument - the name of the chain for which you want 
to delete any rules that reference it.  It prints the iptables commands 
to run to delete the respective rules.

#!/bin/bash
# unlink-chain.sh
# Erik Schorr 2010
# Permission to use, modify, and redistribute granted to anyone for any 
purpose.
# Use this program at your own risk.
# Author disclaims any responsibility for quality or usefulness of this 
program.
PATH=/sbin:/usr/sbin:$PATH
SEARCHCHAIN=$1
if [ "$SEARCHCHAIN" ]; then
   for n in nat filter raw; do
     iptables -t $n -S | grep -e "^-A.*-j $SEARCHCHAIN " | sed -e 
"s/^-A/-D/g" -e "s/^/iptables -t $n /g"
   done
else
   echo "usage: $0 <target chain>"
fi

### snip

# ./unlink-chain.sh DROP_SPYWARE
iptables -t filter -D EGRESS_OUT -d x.x.x.x/32 -p tcp -m comment 
--comment "SPYWARE 20110215" -j DROP_SPYWARE

Enjoy.

On 6/24/2011 3:12 PM, Jan Engelhardt wrote:
> On Friday 2011-06-24 02:06, Jonathan Tripathy wrote:
>
>> On 24/06/2011 00:44, Jan Engelhardt wrote:
>>> On Friday 2011-06-24 00:16, Jonathan Tripathy wrote:
>>>
>>>> Hi Everyone,
>>>>
>>>> Is there any quick command that I can use with iptables to remove all links
>>>> to
>>>> a chain, as well as removing the chain itself?
>>> No, -F would clean the chain, and -X would remove them, which are
>>> currently two separate operations with the iptables(8) frontend.
>> Hi There,
>>
>> Thanks for this, however I already knew those commands. I'm looking for a
>> command to clear the links to the chain (the commands above clear the chain
>> itself), however I'm guessing is there none?
> Indeed there are none.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

