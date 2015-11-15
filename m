From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: [Bulk] Connection tracking Cli and an ALG for DNS
Date: Sun, 15 Nov 2015 19:45:38 +0100
Message-ID: <5648D2D2.7010107@free.fr>
References: <201511041332.09522.boober95@rogers.com> <201511061727.37090.boober95@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201511061727.37090.boober95@rogers.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bill <boober95@rogers.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>


(I didn't reply to the original sender, my bad. So sending the same mes=
sage again...)

Le 06/11/2015 23:27, Bill a =E9crit :
> I've been looking at this a bit more and it occurs to me that it may =
be I
> don't need 'expect', but can use the regular connection tracking tabl=
e.
>

[...]

>
> If anyone can tell me definitively if I can use a connection or an ex=
pect to
> do what I want, as described below, I'd appreciate it.
>
> /bill
>
>
> On Wednesday 04 November 2015 13:32, Bill wrote:
>> I am looking at creating a DNS_ALG using netfilter connection tracki=
ng.  I
>> believe I understand most of what is needed but am having problems t=
esting
>> the ideas using the Cli from the conntrack-tools package.
>>
>> Basically I have a setup that looks like this, a NAT gateway (with D=
NS) a
>> local host inside the NAT, and a remote host outside the NAT:
>>
>> local host               dns/nat gateway              remote host
>> 192.168.20.171      192.168.20.170                192.168.30.172
>>                                192.168.30.170
>> inside               ----->>> nat >>> ------          outside
>>
>> Thus local host can connect to remote host and is natted thru the ga=
teway,
>> but remote host can't connect to local host as it is blocked by the =
NAT
>> gateway.
>>
>> What want ultimately is for remote to do a DNS on the gateway, and h=
ave the
>> gateway configure the NAT to allow the incoming connection.  I want =
the
>> connection to look as if local has initiated it, ie I want it natted=
 so the
>> connection is between the gateway and the remote host IPs on the out=
side.
>>
>> Ultimately I want to program this into a DNS server or build a DNS_A=
LG, but
>> for now I am just testing out the ideas and trying to test using the
>> conntrack-tools, but I have having limited success.  I can
>> add/delete/modify connections but I haven't been able to create a co=
nntrack
>> 'expectation'.
>>

Do you just want 192.168.20.171, behind a NAT gateway, to be the DNS se=
rver
for outside? Can you confirm that's the case or is there something else=
?

>> In the conntrack-tools there is a set of tests 'test.sh' file that h=
as
>> examples, and they work, but not the 'expectation', test as it is mi=
ssing
>> some options.
>>
>> What I'd like to know is given the above example, where I'd like
>> 192.168.30.172 to connect to an expectation on 192.168.30.170 and be=
 passed
>> thru the NAT to 192.168.20.171, what are the right commends to use?
>>
>> I am pretty sure I need an 'expectation' and not a connection in one=
 of the
>> initial state machine states, but please correct me if I am wrong.
>>

Can't you simply use the iptables DNAT target? If not, can you explain =
why
it won't work for your use case and for what reason you'd need somethin=
g else?

>> /bill
>> --

regards,
Adel BELHOUANE
