From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 01:11:45 +0200
Message-ID: <4C6C68B1.1070201@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C65CD.6090707@plouf.fr.eu.org> <4C6C660F.9030400@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C660F.9030400@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
> On 18/08/10 23:59, Pascal Hambourg wrote:
>>
>> Grant Taylor a =E9crit :
>>   =20
>>> On 08/17/10 17:44, Jonathan Tripathy wrote:
>>>     =20
>>>> When using a single Linux host with lots of bridges, would there e=
ver be
>>>> a time, even for a few seconds, where traffic would "jump" bridges=
?
>>>>       =20
>>> No.  Such should not be possible.
>>>     =20
>> It depends what "traffic" means. Ethernet frames, no. IP packets, ye=
s if
>> the box also acts as an IP router between the bridges.
>>   =20
> Hmm for such to happen, the bridge where the traffic came in on would=
=20
> have to have an IP address, wouldn't it?

I don't think so, the bridge interface just needs to be linked to the I=
P
stack (which is now done automatically by recent kernels AFAIK). Router=
s
can have unnumbered interfaces.
