From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Fri, 05 Sep 2008 12:55:26 +0200
Message-ID: <48C1101E.10501@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu> <48BD362C.8020301@netfilter.org> <48BD5931.7050703@bock.nu> <48BD6846.9030006@netfilter.org> <48BD6FEC.5090100@bock.nu> <48BE5547.8030505@netfilter.org> <48BE747D.3010106@bock.nu> <48BFD49A.8070304@netfilter.org> <48BFE25F.2080002@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BFE25F.2080002@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org

Bernhard Bock wrote:
>> 1) does /var/log/conntrackd.log - or syslog - tells anything relevant?
>> Are the entries being comitted to kernel-space successfully?
> 
> according to both conntrackd.log and syslog, entries are being commited.
> I see no relevant negative entries in both logs (except of course the
> INVALID packets).
> 
>> 2) Can you see the committed entries in the kernel via `conntrack -L'
>> after the fail-over?
> 
> yes.
> 
>> 3) Are you noticing any abnormal CPU consumption?
> 
> no.

Is there any pattern in the invalid log messages that your rule-set
matches during the fail-over?

Are the packets hitting invalid or new-not-syn in your rule-set?

Can you check if the packets that are logged as invalid have a
state-entry? Just take one of the log messages and do `conntrack -L -p
tcp --dport XYZW' to check if there is a state-entry about that
connection while it keeps logging the packet as such state-entry would
not exist.

Are you noticing state-entries marked as UNREPLIED in TCP states !=
SYN_SENT?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
