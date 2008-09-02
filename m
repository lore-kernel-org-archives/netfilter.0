From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Tue, 02 Sep 2008 14:48:44 +0200
Message-ID: <48BD362C.8020301@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BD32CC.5010203@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org

Bernhard Bock wrote:
> Pablo Neira Ayuso wrote:
>> That's exactly the test that I do in my testbed and it works fine here,
>> the problem must be elsewhere. The following line should help to see how
>> the connection tracking is marking the traffic as invalid:
>>
>> echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid
>>
>> However, please see the comment below before doing this and repeating
>> the test.
> 
> I didn't know one can increase the verbosity. Now I get some (more)
> helpful logs.
> 
> kernel: nf_ct_tcp: invalid packet ignored IN= OUT= SRC=10.5.0.101
> DST=10.6.6.102 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=9977 DF PROTO=TCP
> SPT=39101 DPT=80 SEQ=3381624888 ACK=0 WINDOW=5840 RES=0x00 SYN URGP=0 OPT
> 
> Invalid syn packet? Hm. And then:
> 
> kernel: nf_ct_tcp: killing out of sync session IN= OUT= SRC=10.6.6.102
> DST=10.5.0.101 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=80
> DPT=41647 SEQ=3243074286 ACK=3280173284 WINDOW=5792 RES=0x00 ACK SYN
> URGP=0 OPT

I though that your problem was that you cannot even recover the flows in
the first failover, but it seems to me that you have triggered several
fail-overs between the nodes. There's no way to hit this in a clean
session - ie. empty connection tracking table. Please, see the end of
this email.

>> Are you using a sane stateful rule-set similar to the described in the
>> conntrack-tools website? What kernel version are you using? If your
>> kernel is < 2.6.22 you have to disabled TCP window tracking on both nodes.
>>
>> echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
> 
> 
> I'm using 2.6.25, from Fedora 9.
> And I have set /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal to 1.
> 
> Here are my rules:
> 
> -A FORWARD -m state --state INVALID -j LOG --log-prefix "Invalid:"
> -A FORWARD -m state --state INVALID -j DROP
> -A FORWARD -p tcp ! --syn -m state --state NEW -j LOG --log-prefix "New
> not syn:"
> -A FORWARD -p tcp ! --syn -m state --state NEW -j DROP
> -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A FORWARD -m state --state NEW -m tcp -p tcp --syn -d 10.6.6.0/24 -j ACCEPT
> -A FORWARD -m state --state NEW -m udp -p udp -s 10.5.0.0/24 -d
> 10.6.6.0/24 -j ACCEPT
> -A FORWARD -j LOG --log-prefix "Packet dropped:"
> -A FORWARD -j DROP

Looks sane.

>> There is a new script `primary-backup.sh' that replaces the old
>> script_master.sh and script_backup.sh. Although this is not directly
>> related it would be worth to use that instead as it will be the standard
>> in the upcoming release.
> 
> I'll replace it for future tests. For now, I don't want to mess around
> at too many places at the same time unless it's related to the problem.

If you are triggering several fail-overs with unclean session, the new
script should help. So please, give it a try. It will take you a couple
of minutes to get it working.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
