From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: Re: Altering a packet's port
Date: Tue, 22 Mar 2005 10:15:09 -0500
Message-ID: <01f501c52ef1$f0400290$bf07a8c0@civicXp>
References: <00c501c52e56$acbe6070$bf07a8c0@civicXp><opsn0cqeu476nf2y@xonix>
	<002201c52e7e$4fe76950$6500a8c0@DEFIANT>
	<1111490995.4267.18.camel@hubcap.ljm.dom>
	<01a401c52eed$67fd5670$bf07a8c0@civicXp>
	<Pine.LNX.4.60.0503220959020.6816@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0503221011390.6816@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org


Yes, I have 2 sshd, on both ports 22 and 8022.

As a return rule, I tried :

-A POSTROUTING -d 192.168.7.0/24 -s e.f.g.h -p tcp --sport 8022 -j 
SNAT --to-source e.f.g.h:22

but that rule doesn't have any hits.

----- Original Message ----- 
From: "R. DuFresne" <dufresne@sysinfo.com>
To: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, March 22, 2005 10:12 AM
Subject: Re: Altering a packet's port


> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
> if sshd is there listening on port 8022, do you have rules setup for the 
> packets that are returned as well?
>
> Thanks,
>
> Ron DuFresne
>
> On Tue, 22 Mar 2005, R. DuFresne wrote:
>
>> --[PinePGP]--------------------------------------------------[begin]--
>>
>>
>> do you have sshd listening on port 8022 on e.f.g.h?
>>
>> Thanks,
>>
>> Ron DuFresne
>>
>> On Tue, 22 Mar 2005, Nicolas Ross wrote:
>>
>>> What I'm trying to do isn't working...
>>>
>>> In my nat table I have :
>>>
>>> -A PREROUTING -s 192.168.7.0/24 -d e.f.g.h -p tcp \
>>> --dport 22 -j DNAT --to-destination e.f.g.h:8022


