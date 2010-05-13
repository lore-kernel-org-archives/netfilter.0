From: Eason Su <ssg2351@gmail.com>
Subject: Re: ipt_reject.c --> ip_route_me_harder ... --> ip_route_output_slow: 
	iif is loopback device?
Date: Thu, 13 May 2010 22:41:03 +0800
Message-ID: <AANLkTikUTyP_huLQKEroldqLkJA8DlC6FkcddTuYBa7M@mail.gmail.com>
References: <AANLkTimahQnqdaHEEB1UgkdG7mp9vysHZNvWKpPTcxI5@mail.gmail.com>
	 <4BE9387A.8080806@plouf.fr.eu.org>
	 <AANLkTindlfLTvOos5RmdVJX-rp0F3mv-fn-CCQ_OjIMr@mail.gmail.com>
	 <AANLkTik2TdQ5cfVx-EfgSKv1AhaXLlGTzdyyQgu0DYLI@mail.gmail.com>
	 <AANLkTimlK7r5LSrG6Nt38t4HVdc6tzGvCuf9OLhDRUcv@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=kwQrIbXoPcT3JQ4HsNBj/541KY9wYkAQcyWOjPLXFr8=;
        b=dv5E02q9P9NiWMFqnmzJ47Q+p0MmxyRM9ty19jiXvDMi0K45+PWPdtWqqyowkHcp5S
         YGI3dZGZOWKD69LjG9OZOCOLGrgHX5F3etEoXtooO6iazICCCezxBbbxF/MwBt7jXskm
         OPUZgS/2VF0nQ6qcbCdW5GJlGu+6mM9+VAss4=
In-Reply-To: <AANLkTimlK7r5LSrG6Nt38t4HVdc6tzGvCuf9OLhDRUcv@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

Hi ratheesh,

I think the issue you met may not have relation with ipt_reject +
policy routing, so let's talk in a separate mail ^_^.


Hi all,

ipt_reject.c using ip_route_output_key (in ip_route_me_harder) to get
RST packet's reverse path's oif may have problem if system has "from
iif xxx" policy routing. Anyone comment on it? Or anyone could kindly
give me some clue on ipt_reject + policy routing scenario?

Thanks.



2010/5/12 ratheesh k <ratheesh.ksz@gmail.com>:
> My question is : what will happen to ping responses ? it will be
> routed correctly.
>
> Thanks,
> Ratheesh
>
> On Tue, May 11, 2010 at 9:57 PM, ratheesh k <ratheesh.ksz@gmail.com> =
wrote:
>> On Tue, May 11, 2010 at 8:15 PM, Eason Su <ssg2351@gmail.com> wrote:
>>> Hi Pascal,
>>>
>>> Thanks for your reply! The RST packet should be sent back via the s=
ame
>>> interface (group2), that is what REJECT with RST target do.
>>>
>>> ip_route_me_harder include two routines, ip_route_output_key and
>>> ip_route_input. ip_route_output_key is to find the wanX which is us=
ed
>>> for reverse path filtering in ip_route_input.
>>>
>>> And I get the wrong wanX from ip_route_output_key because iif is se=
t
>>> to loopback device but not the real device that the packet comes fr=
om,
>>> so the reverse path checking fail in ip_route_input. So ip_route_in=
put
>>> fail, ip_route_me_harder fail.
>>>
>>> If I disable reverse path filtering(echo
>>> 0>/proc/sys/net/ipv4/conf/wanX/rp_filter), everything will be ok to=
o:
>>> ip_route_input ok, ip_route_me_harder ok, send_rst in ipt_REJECT.c =
ok.
>>>
>>> I kind of not agree about ip_route_me_harder use ip_route_output_ke=
y
>>> to get reverse path device, is it possible that ip_route_me_harder =
not
>>> use ip_route_output_key to get reverse path device but just do some
>>> trick to let ip_route_input not do the reverse path checking, or do
>>> the right checking? Obviously echo
>>> 0>/proc/sys/net/ipv4/conf/wanX/rp_filter is not an option.
>>
>> will this affect icmp ping request also ? .
>>
>> -Ratheesh
>>
>>>
>>>
>>>> Hello,
>>>>
>>>> s sg a =E9crit :
>>>>>
>>>>> I meet a routing issue when I try to use ipt_reject RST target in=
 my
>>>>> policy routing enabled linux box (please see below picture).
>>>>>
>>>>> The linux box is configured to support policy routing, iif policy=
=2E The
>>>>> policy is, if packet is from interface group1, then it will looku=
p
>>>>> table 100, this table's default oif is wan1. And if packet is fro=
m
>>>>> interface group2, then it will lookup table 101, this table's def=
ault
>>>>> oif is wan2. The main table's default oif is wan1.
>>>>>
>>>>> The issue is, one packet comes from group2 and then ipt_reject wa=
nts
>>>>> to send RST, but the routing for the RST packet fail
>>>>> (ip_route_me_harder fail).
>>>>>
>>>>> I trace the code in ipt_REJECT.c. ipt_REJECT.c use ip_route_me_ha=
rder
>>>>> to find the RST packet's destination. ip_route_me_harder will fir=
st
>>>>> find the RST packet's reverse path using ip_route_output_key. The
>>>>> trace of ip_route_output_key is like this:
>>>>> ip_route_me_harder --> ip_route_output_key --> ip_route_output_fl=
ow
>>>>> --> __ip_route_output_key --> ip_route_output_slow.
>>>>>
>>>>> In ip_route_output_slow, before fib_lookup, the iif is set to loo=
kback
>>>>> device, not the real device where the packet comes.
>>>>
>>>> This is expected behaviour. The RST packet is locally generated, a=
nd as
>>>> such has iif set to the loopback device.
>>>>
>>>>> So the policy
>>>>> finding in fib_lookup will fail to find table 101 but fall to mai=
n
>>>>> table, so the oif is wan1 but not wan2.
>>>>
>>>> There is one thing I don't understand. The RST packet is generated=
 in
>>>> reply to a packet that was received on interface group2, so I woul=
d
>>>> expect that it sent back via that same interface, not on any wan
>>>> interface. Anyway, it does not matter what interface the original =
packet
>>>> was supposed to be forwarded to.
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>>
>
