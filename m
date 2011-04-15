From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Ipset counters question
Date: Fri, 15 Apr 2011 15:10:22 +0200
Message-ID: <4DA843BE.8000800@univ-nantes.fr>
References: <4D91B511.3040005@univ-nantes.fr> <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu> <4D94224B.4050408@univ-nantes.fr> <alpine.DEB.2.00.1103312005580.16579@blackhole.kfki.hu> <4D94D06C.6070201@univ-nantes.fr> <alpine.DEB.2.00.1103312121170.16841@blackhole.kfki.hu> <4D94DC17.4040906@univ-nantes.fr> <4DA69F5F.3010004@univ-nantes.fr> <alpine.DEB.2.00.1104151442240.26797@blackhole.kfki.hu>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104151442240.26797@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Le 15/04/2011 14:53, Jozsef Kadlecsik a =E9crit :
> Hi,
>
> On Thu, 14 Apr 2011, Jean-Philippe Menil wrote:
>
>> Le 31/03/2011 21:55, Jean-Philippe Menil a =E9crit :
>>> That's what i tought, and i needed to be sure.
>>>
>>> As i can miss the counters for the moment, i will kept my rules.
>>> But as i'm very intereted by ipset, i will think to do otherwise.
>> I return to this story of counters.
>> Since, i don't really need some counters, but just to know when ther=
e is no
>> more traffic for a user to decrement an idle timeout;
>> i decide to use ipset with the bitmap ip,mac and the timeout value.
>>
>> However, the timeout doesn't do really what i need, i use a dirty ha=
ck to set
>> the timeout counters every time a packet is matched;
>> so when there are no more packet, the timeout value begin to decreme=
nt.
>>
>> I do this in the bitmap_ipmac_ttest function, i'm just wondering if =
it is the
>> right place to do this?
> The proper way would be to reset the timeout value by the SET target,
> which is not supported yet.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>            H-1525 Budapest 114, POB. 49, Hungary
Hi,

you mean, in the iptables userspace?

Why not, had a flag like "-idle" in ipset, and reset the timeout to=20
defaults when the flag is set?

I'm just asking this, to be sure to do this properly, even if this=20
request is margin.

Thanks for your advice

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

