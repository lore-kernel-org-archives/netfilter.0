From: hdemir@metu.edu.tr
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sun, 5 May 2013 00:39:16 +0300
Message-ID: <9a3b8ec43ac420e45247dd70d2a597e1.squirrel@sqrl.metu.edu.tr>
References: <5185444B.3090602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5185444B.3090602@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Flex <aflexzor@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Alex,

I have a that problem also.I solved with CPU Affinity and disabled all =
the
power properties of the hardware (s1, s2, s3). But with the syn attack =
the
problem is that conntrack number increasing too fast. I have a max valu=
e
of 10 million and it fills up about less than 10 min.

=FD also wonder about how to stop ddos of conntrack max value. Perhaps
somebody shoul implement conntrack without syn, syn-ack. I think Junioe=
r
has this feature. Like having syncoockies in conntrack.


Regards.

hdemir.

> Hello Netfilter,
>
> Ive been receiving lately two types of syn floods on an Intel Xeon
> 2.4ghz + 4GB machine exclusively dedicated for this and the findings
> have me very confused:
>   I have syn cookies enabled and checked to be working as per syslog.
> This machine has a 10gigabit uplink so I know that networking isnt a
> bottleneck here (bandwith or router hardware based).
>
> SCENARIO 1: the first attack was: 105mbits @ 330,000 pps and it broug=
ht
> the machine to 100% CPU usage and over 50% packetloss Load average 12=
=2E
> At that time it had a simple iptables script that that had less then =
5
> blacklists of port 80 ips and then a ACCEPT On port 80, nothing fancy=
=2E I
> disabled iptables and load average went down immediately to 8 but the=
re
> was still high packet loss so basically we where DoSed efficiently.
>
> SCENARIO 2: After that the attacker sent only a 30mbit synflood @ 70,=
000
> pps .. Now i had less packet loss, and interestingly with iptables
> enabled it would create almost immediate packetloss. At this time I
> tried to explore installing conntrack-tools information about the sta=
te
> table. conntrack said that with iptables enabled and syncookies the
> maximum entries where 1300 ONLY... and a CPU usage reported by HTOP o=
f
> 40% on SI. After that I decided to drop iptables all together and
> immediately port 80 started flowing with normal traffic (we have less
> than 1mbit clean traffic) . No packetloss was present, because iptabl=
es
> was disabled conntrack did not report any entries and netstat-na |wc =
-l
> reported less than 300.
>
> Questions:
>
> a.) Can anybody suggest why there is so much CPU overhead when iptabl=
es
> is turned on and dealing with such PPS? Is this normal? Usually what =
CPU
> usage does a syn flood cookie enabled take?
>
> b.) Is there a chance that the attacker exausted something else iam n=
ot
> seeing?
>
>
> Thanks for the help guys
>
> Alex
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


