From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multicast packets
Date: Thu, 25 Feb 2010 23:22:25 +0530
Message-ID: <cfeab66d1002250952w58e1651dnd5c104ab10c626d1@mail.gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
	 <201002241933.47105.christoph.paasch@gmail.com>
	 <cfeab66d1002242238m3216eb64ice0ca627cb30fa39@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=F2WsghMz6uQFU17O6PZ3h9tHavrtlhuOIuw1F1LhRsA=;
        b=Rhpf7PiS37T8pKLJBqcKrLrJZrixPzezVRVijyj1YMJuGe+PDu9P2UkOHldeXsZpBc
         27oM/Usz7C9+5w9G1ODsnBJKY3oLPwUwmyX8uoPWAF1vXRvlsffks3LVAZEyTY2F1nEs
         dkO2cKb7U4+BeFJ/XcOKGEd3/faUUCLvFPgco=
In-Reply-To: <cfeab66d1002242238m3216eb64ice0ca627cb30fa39@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

iptables -A INPUT -m state --state ESTABLISHED,RELATES -j ACCEPT .

This is the only rule . No firewall hole for igmp packets .



On Thu, Feb 25, 2010 at 12:08 PM, ratheesh k <ratheesh.ksz@gmail.com> w=
rote:
>>>>>>>>>>udp doesn't go into the established state.
>
> I am running "igmpproxy" on my gateway box . I didnot add any rule in
> INPUT chain to accept igmp packets . But =A0i hve a rule to accept al=
l
> ESTABLISHED state packets . It am able to stream igmp from my desktop
> .
>
> I really believe that " We dont need any rule in FORWARD chain " .
> Because packets are flowing from node to node and routed . So only
> INPUT and OUTPUT chains are involved .
>
> Thanks,
> Ratheesh
>
>
>
> On Thu, Feb 25, 2010 at 12:03 AM, Christoph Paasch
> <christoph.paasch@gmail.com> wrote:
>> As long as there isn't any return-traffic (as it is the case for mul=
ticast-
>> udp), udp doesn't go into the established state.
>>
>> Regards,
>> Christoph
>>
>> On Wed 24 February 2010 wrote ratheesh k:
>>> multicast packets are udp packets . But its flowing only from
>>> upstream to downstream . So packet state will be always "NEW" . ??
>>>
>>> my question is : whether we can see multicast data packets in
>>> ESTABLISHED state ??
>>>
>>> Thanks,
>>> Ratheesh
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>
>> --
>> Christoph Paasch
>>
>> Alcatel-Lucent
>> IP Development
>>
>> www.rollerbulls.be
>> --
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
