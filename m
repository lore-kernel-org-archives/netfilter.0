From: =?iso-8859-1?B?SOVrYW4gRW5nYmxvbQ==?= <cynic_0@hotmail.com>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 01:59:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F156GvVgpKW4bG00052192@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I've tried with blocking broadcasts, but the result is the same, iptables=20
says the packets are  dropped, and yet the dhcpd is responding.

Could it make any difference with another dhcpd ?

/H=E5kan E.


>From: H=E5kan Engblom <cynic_0@hotmail.com>
>To: netfilter@lists.netfilter.org
>Subject: Re: source-mac filtering
>Date: Sun, 11 Jan 2004 01:43:30 +0100
>
>Yes I can try that.
>
>However I do managed to get the DHCP-discovery packets dropped (and logged=
=20
>as dropped) by a general DROP-rule after having matched on vaild source-ma=
c=20
>addresses. But even if iptables consider the packets to be dropped, they=20
>are still forwarded to the dhcpd. This could be seen using "iptables -L -v"
>
>I think it's more likely that the dhcp-server listens on a very low layer.
>
>I'll try it anyway.
>
>/H=E5kan E.
>
>
>>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>>To: <netfilter@lists.netfilter.org>
>>Subject: Re: source-mac filtering
>>Date: Sun, 11 Jan 2004 00:25:25 +0000
>>
>>On Sunday 11 January 2004 12:13 am, Pawel Staszewski wrote:
>>
>> > Hello
>> >
>> > Maybe try to block broadcast to the "blocked" client....
>> > "-m pkttype --pkttype broadcast ........."
>> >
>> > I use it and this work fine...
>>
>>You can use a rule with this match in it to stop your DHCP server giving =

>>out
>>addresses?
>>
>>I thought DHCPD caught the packets before they ever got to netfilter,
>>therefore you couldn't block the traffic with any sort of rule.
>>
>>Antony.
>>
>>--
>>Ramdisk is not an installation procedure.
>>
>>                                                      Please reply to the=
=20
>>list;
>>                                                            please don't =

>>CC me.
>>
>>
>
>_________________________________________________________________
>Hitta r=E4tt k=F6pare p=E5 MSN K=F6p & S=E4lj http://www.msn.se/koposalj
>
>

_________________________________________________________________
Hitta r=E4tt p=E5 n=E4tet med MSN S=F6k http://search.msn.se/


