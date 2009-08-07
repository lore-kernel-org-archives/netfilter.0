From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: types of NAT with netfilter
Date: Fri, 7 Aug 2009 20:49:35 +0530
Message-ID: <cfeab66d0908070819p66d977beo7ae1a0276c1487ff@mail.gmail.com>
References: <cfeab66d0908070422i40b6efb9x901d3d839a6fee03@mail.gmail.com>
	 <1249647001.29388.25.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3OboZb1DqsUiom5+Ga6xLEO87UXMdkcbi+8EOVly6Uk=;
        b=c6PZ0lq163uHBqxyxQBW0WkxwoVRm52on4lTgN9ZqgxtEQmc7cqLrGjm4Xmyak3z3k
         euzpf6Yy33fAV4kn0wdIAfFeRRakdzcAtFJo7JxWmI5fNOgMhnEn1CdLENYl2RbBV/ae
         aZSY8QFrMqk4yv6Gt5ASZ3M4+K+z3LzkFaGI4=
In-Reply-To: <1249647001.29388.25.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

My aim is to test whether my router supports what kind of NAT ..and to
know abt how we can make  nat types that are not supported  ,working
=2E....


A { client computer } --------------------------> Router
------------------------> internet ...

This is my   setup .

Thanks,
Rat





On Fri, Aug 7, 2009 at 5:40 PM, Thomas Jacob<jacob@internet24.de> wrote=
:
> On Fri, 2009-08-07 at 16:52 +0530, ratheesh k wrote:
>> Hi ,
>>
>> =A0I have a linux router with =A0only one rule
>>
>> =A0 iptables -t nat -A POSTROUTING -i eth0 -o eth1 -j MASQUERADE
>>
>>
>> =A0What i understood is (by googling net ) is that =A0adding this wi=
ll
>> give symmetric nat support to my router , is it true =A0???.
>
> Yes
>
>> =A01. To have =A0" full cone nat" support =A0what should i do ?? =A0=
Is it same
>> as DMZ configuration ??
>>
>> =A02 . restricted nat and port restricted nat cannot be implemented
>> using iptables ???
>
> These are all technically inferior to symmetric NAT, and are AFAIK
> not provided by netfilter/iptables.
>
> I suggest you describe in detail(!) what you want to achieve to the l=
ist
> (possibly with ASCII diagrams) and then maybe people can help
> you out.
>
>
>> =A03 . i installed windows STUC and tested . Test results show it is=
 a
>> portrestricted nat ... But if i make default policy for wan INPUT an=
d
>> wan PREROUING as REJECT , test =A0got failed ??? is it iptables
>> dependend ??
>>
>> Thanks,
>> atheesh
>
>
>
