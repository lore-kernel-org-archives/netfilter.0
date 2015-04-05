From: Todor Todorov <root@4vendeta.com>
Subject: Re: SYNPROXY module with bridge
Date: Sun, 05 Apr 2015 15:52:10 +0300
Message-ID: <55212FFA.9050204@4vendeta.com>
References: <551F008F.6050200@4vendeta.com> <20150405114729.GC23433@acer.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150405114729.GC23433@acer.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org, kadlec@netfilter.org, fw@strlen.de, marc+nf@mbsi.ca, gandalf@netfilter.org, yasuyuki@netfilter.org

Hello,

I was check and as you said REJECT target also doesn't work in Bridge.
Where is the problem - in "br.c" or it must add a check in=20
"ipt_synproxy.c" for is the packet coming from bridged interface?
I find this patch for reject in bridge but doesn't work -=20
http://markmail.org/message/zkd57gfh7htcbyvc#query:+page:1+mid:spwhgpx2=
jl6iholn+state:results

Any help would be useful to me...

Thank you!

----------------------------
Kind regards,
Todor Todorov
System Administrator
4 Vendeta LTD
GSM: +359 895 935 835
root@4vendeta.com
----------------------------

=D0=9D=D0=B0 05.4.2015 =D0=B3. =D0=B2 14:47, Patrick McHardy =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0:
> On 04.04, Todor Todorov wrote:
>> Hello,
>>
>>  From 1 week ago I'm trying to patch synproxy module to work in brid=
ge mode.
>> The problem is that SYNPROXY is not send syn-ack by bridge, its send=
 by
>> default route.
>> I know roughly C language but failed to rewrite and work..
>>
>> This is the topology of the problem:
>>
>> User -----> SYN ------> Firewall - br0 - physdev vlan10
>> Firewall - eth0? -------> SYN-ACK ------> User
>>
>> Should be like:
>>
>> Firewall - br0 - physdev vlan10 -------> SYN-ACK ------> User
>>
>> Please help or some guidance on how to fix this problem.
> You should have a look at the REJECT target, which faces the same pro=
blem.
> Also please CC the netfilter-devel list on questions like that, someo=
ne
> might jump in to help.

