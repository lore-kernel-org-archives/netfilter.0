From: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Subject: Re: Possible reasons for INVALID packets ?
Date: Wed, 2 Mar 2005 17:58:36 +0100 (CET)
Message-ID: <Pine.LNX.4.62.0503021752050.4612@L01.THNET>
References: <Pine.LNX.4.62.0503021025540.4201@L01.THNET>
	<200503021935.25498.e-boogie@yandex.ru>
Mime-Version: 1.0
In-Reply-To: <200503021935.25498.e-boogie@yandex.ru>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mikhail Zotov <e-boogie@yandex.ru>
Cc: netfilter@lists.netfilter.org

[...]
>
>>
>>> IN= OUT=eth0 SRC=ROUTER DST=193.108.155.115 LEN=68 TOS=0x00 PREC=0xC0
>>> TTL=64  ID=22467 PROTO=ICMP TYPE=11 CODE=0 [SRC=193.108.155.115
>>> DST=A.LAN.HOST LEN=40 TOS=0x00 PREC=0x00 TTL=1 ID=40760 PROTO=ICMP TYPE=8
>>> CODE=0 ID=20244 SEQ=45126 ]
>>>
> [...]
>>
>> Why would you consider these packets invalid - TYPE=11 is "time exceeded",
>> CODE=0 is "maximum lifetime of the datagram exceeded" - for whatever
>> reason those packets are generated ...
>
> I have (roughly) the following rules in the script:
>
> iptables -A OUTPUT -m state --state INVALID -j LOG \
> --log-prefix "Fired invalid:"
> iptables -A OUTPUT -m state --state INVALID -j DROP
>
> These rules worked at the records I posted.

Well, IMHO these rules will work for tcp/udp connections - but as of icmp, 
the following occurs:

ICMP-echo request 193.108.155.115 -> A.LAN.HOST , which is unreachable, 
thus "time exceeded".

Now take a look at "man iptables", what it says about "INVALID":

"... Possible states are INVALID meaning that the packet could not be 
identified for some reason which includes running out of memory and ICMP 
errors which don't correspond to any known connection, ... "

and indeed, this is the case - your ICMP error does not correspond to any 
known connection, as an ICMP-echo request is always "NEW" .

You should probably allow any outgoing ICMP-traffic to resolv this issue.

Regards,
Michael

