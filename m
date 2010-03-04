From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: miscellaneous netfilter questions
Date: Thu, 4 Mar 2010 11:22:20 +0530
Message-ID: <cfeab66d1003032152q2e4574dh2ccf3e4d1f753000@mail.gmail.com>
References: <20100303165419.87692fvlklxfna68@webmail.physik.uni-muenchen.de>
	 <4B8E94F7.4080908@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=zEOb9WyiF9NGJIF/IUEwHzjHftOshCGr5foGCxopW0s=;
        b=aSOrD4OMzbnsNQ32WIoHwFlygE3Qb4HJdO2lx26RgRxlsKQw1EL/2o4pGjj5I88DTn
         7woYNAP3OVgcllSY7uLB0SqLvWIGapguVRPGT03uggy8CyuCgISiHQUpVSg5ETIgAFJ7
         dBILK6Xl723dxgJ8DrIqktaLdi5upPO51ejoU=
In-Reply-To: <4B8E94F7.4080908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

>> In that case, what happens to packets for which conntracking was
>> disabled (NOTRACK in raw)? Are they also de-fragment or not?
>
> Good question. I have no answer. This requires some code reading or a
> bit of testing.

for IPV4 .

if we have NAT enabled , packets should be defragmented at PREROUTING
chain to map to correct destination { ip + port }

if dont have NAT also , defaragmented packets doesnt have information
about ports , i think it should be defragmented . I dont know about
HOOK in which  it happens .

Thanks,
Ratheesh



On Wed, Mar 3, 2010 at 10:27 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Christoph Anton Mitterer a =E9crit :
>>
>> 1) If I disable conntracking for packets using NOTRACK in raw what
>> happens if I e.g. match the state later in filter? Does the rule
>> simply not match for such packets or is it INVALID?
>
> Packets processed with the NOTRACK target have the UNTRACKED state.
>
>> 2) The addrtype module provides several address types. Where can I
>> find which addreses are _exactly_ matched by a given type for a give=
n
>> protocol (especially IP4/6).
>> I'm especiylly (but not only) interested in what LOCAL actually mean=
s?
>> Is it all addresses of a hosts network interfaces PLUS the ALL
>> addresses on that networks (like a "localnets")?
>> Or is it all the addresses which the kernel thinks the host has itse=
lf, e.g.
>
> The latter, I guess.
>
>> 3) --fragment
>> a) It's quite clear what happens if one uses "-f" or "! -f" but what
>> happens if neither of the tow is give? Does it mean "! -f" or is it
>> like "match not fragmented packets AND fragmented packets (both the
>> first AND further fragments).
>
> The latter, obviously. All packets are matched regardless of fragment=
ation.
>
>> b) Is it true, that when conntracking is used, that packets are
>> automatically defragmented so one doesn't have to care on fragments =
at
>> all?
>
> For IPv4, indeed when conntrack is enabled incoming fragmented datagr=
ams
> are reassembled before the PREROUTING chains. Note that packets which
> are to be delivered locally are reassembled by the stack (not by
> conntrack) before the INPUT chains anyway, so you never see fragments=
 in
> INPUT chains.
>
> AFAIK things work a bit differently for IPv6 : fragmented datagrams a=
re
> "virtually" reassembled for conntrack (the reason being that an IPv6
> router does not handle fragmentation/reassembly), but continue to exi=
st
> as fragments through the ip6tables chains and the IPv6 stack.
>
>> In that case, what happens to packets for which conntracking was
>> disabled (NOTRACK in raw)? Are they also defragmented or not?
>
> Good question. I have no answer. This requires some code reading or a
> bit of testing.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
