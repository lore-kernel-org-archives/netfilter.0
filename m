From: "Michael Frank" <mhf@linuxmail.org>
Subject: Re: Qustion wrt state RELATED,ESTABLISHED
Date: Wed, 07 Jul 2004 14:13:25 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsaq7knqf4evsfm@smtp.pacific.net.th>
References: <20040707051150.381201787@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040707051150.381201787@sterenborg.info>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

On Wed, 7 Jul 2004 07:11:50 +0200, Rob Sterenborg <rob@sterenborg.info> w=
rote:

>> Is my  assumtion correct that state RELATED,ESTABLISHED
>> checks all flags
>> for match and thus this state can (and should be for
>> performance reasons)
>> be the first in each table ?
>
> No, it checks the *state*.
>
> The first packet that is seen in a connection has state NEW, the rest
> have state ESTABLISHED or RELATED (as with e.g. ftp). Since these
> packets are let's say 99% in a connection, the ESTABLISHED and RELATED
> match will match the most packets. Also see the byte/packet counters fo=
r
> this (first 2 columns in the list below).
> That's why you probably want that rule somewhere on top for performance
> reasons because the rules are traversed in the order they are entered,
> and therefore matched in the order they are entered.
>
>> Chain INPUT (policy DROP 0 packets, 0 bytes)
>>   pkts bytes       target     prot opt in     out     source
>>              destination
>
>> 15172 2029K ACCEPT     all  --  any    any     anywhere
>>       anywhere           state RELATED,ESTABLISHED
>
> Rule 1 (state checking)
>
>>   0       0             BADTCP     tcp  --  any  .   any
>> anywhere             anywhere           tcp
>> flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
>
> Rule 2 (flag checking)
>
> So you have 2 separate rules ; 1 for state and 1 for flag checking.
>
>

Thank you for your reply.

I apprectiate that first packet is NEW and others are EST/REL.

My point is, does EST/REL _match_ state and packets exactly and ignore
packets with _mismatching_ flags so I do _not_ have to check them
_before_ EST/REL and check them _only_ for NEW ??

Ok here is bigger example:

Chain INPUT (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               dest=
ination
  437K  100M ACCEPT     all  --  any    any     anywhere             anyw=
here           state RELATED,ESTABLISHED
   488  107K EXTIF      all  --  ppp0   any     anywhere             anyw=
here
     9   588 ACCEPT     all  --  lo     any     anywhere             anyw=
here              < ---lo and eth0 local is still too easy and under deve=
lopment :)
   450 42411 ACCEPT     all  --  eth0   any     anywhere             anyw=
here
     0     0 LOG        all  --  any    any     anywhere             anyw=
here           limit: avg 3/min burst 3 LOG level alert prefix `ipt - INP=
UT dropped: '

Chain EXTIF (1 references)
  pkts bytes target     prot opt in     out     source               dest=
ination
     0     0 BADTCP     tcp  --  any    any     anywhere             anyw=
here           tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
     0     0 BADTCP     tcp  --  any    any     anywhere             anyw=
here           tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
     0     0 BADTCP     tcp  --  any    any     anywhere             anyw=
here           tcp flags:SYN,RST/SYN,RST
     0     0 BADTCP     tcp  --  any    any     anywhere             anyw=
here           tcp flags:FIN,SYN/FIN,SYN
     0     0 BADTCP     tcp  --  any    any     anywhere             anyw=
here           tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
     0     0 BADTCP     tcp  --  any    any     anywhere             anyw=
here           tcp flags:FIN,SYN,RST,PSH,ACK,URG/NONE
     1    28 PINGFLOOD  icmp --  any    any     anywhere             anyw=
here           icmp echo-request
    52  2564 SYNFLOOD   tcp  --  any    any     anywhere             anyw=
here           tcp flags:SYN,RST,ACK/SYN

..... additional NEW enties eg for http

Logging here would be optional - great way to spam the logs.

    69  3422 DROP       all  --  any    any     anywhere             anyw=
here

Chain BADTCP (6 references)
  pkts bytes target     prot opt in     out     source               dest=
ination
     0     0 LOG        all  --  any    any     anywhere             anyw=
here           limit: avg 3/min burst 3 LOG level alert prefix `ipt - Blo=
cked Bad TCP flag: '
     0     0 DROP       all  --  any    any     anywhere             anyw=
here

Chain PINGFLOOD (1 references)
  pkts bytes target     prot opt in     out     source               dest=
ination
     1    28 RETURN     all  --  any    any     anywhere             anyw=
here           limit: avg 10/sec burst 3
     0     0 LOG        all  --  any    any     anywhere             anyw=
here           limit: avg 3/min burst 3 LOG level alert prefix `ipt - Blo=
cked PING Flood: '
     0     0 DROP       all  --  any    any     anywhere             anyw=
here

Chain SYNFLOOD (1 references)
  pkts bytes target     prot opt in     out     source               dest=
ination
    52  2564 RETURN     all  --  any    any     anywhere             anyw=
here           limit: avg 10/sec burst 3
     0     0 LOG        all  --  any    any     anywhere             anyw=
here           limit: avg 3/min burst 3 LOG level alert prefix `ipt - Blo=
cked SYN Flood: '
     0     0 DROP       all  --  any    any     anywhere             anyw=
here


	Regards
	Michael




