From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Bad Argument `lo'
Date: Thu, 04 Oct 2012 21:14:29 +0200
Message-ID: <506DE015.2090606@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

i using iptables (version 1.4.14) on a LMDE(Debian like) with kernel 
3.5.3. Some days before i watched my logs after several weeks again. :-) 
And i spotted the error message:

Bad argument `lo'

So i searched at google to get a solution and i got one. Some user told 
to put the <lo> into ticks, like this

'!lo'

My iptables-rules regarding on this problem were looking so,

...
iptables -A INPUT -i ! lo -s 127.0.0.1 -j DROP
...

and i changed this line to,

...
iptables -A INPUT -i '!lo' -s 127.0.0.1 -j DROP
...

Now i am not sure, if this works correctly. <iptables -L> shows me the 
device "!lo",

######################################################################
Chain INPUT (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source destination
     0     0 LOG        all  --  !lo    any     localhost anywhere 
        limit: avg 3/sec burst 5 LOG level warning prefix "Loopback 
gespooft: "
     0     0 DROP       all  --  !lo    any     localhost anywhere
######################################################################

but i am not sure if this works correctly. Does somebody knows if this 
trick works correctly?

regards Markus
