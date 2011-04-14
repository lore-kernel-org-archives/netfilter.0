From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Ipset counters question
Date: Thu, 14 Apr 2011 09:16:47 +0200
Message-ID: <4DA69F5F.3010004@univ-nantes.fr>
References: <4D91B511.3040005@univ-nantes.fr> <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu> <4D94224B.4050408@univ-nantes.fr> <alpine.DEB.2.00.1103312005580.16579@blackhole.kfki.hu> <4D94D06C.6070201@univ-nantes.fr> <alpine.DEB.2.00.1103312121170.16841@blackhole.kfki.hu> <4D94DC17.4040906@univ-nantes.fr>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D94DC17.4040906@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Le 31/03/2011 21:55, Jean-Philippe Menil a =E9crit :
>
> That's what i tought, and i needed to be sure.
>
> As i can miss the counters for the moment, i will kept my rules.
> But as i'm very intereted by ipset, i will think to do otherwise.
>
> Thanks a lot.
>
> Regards.
>
Hi,

I return to this story of counters.
Since, i don't really need some counters, but just to know when there i=
s=20
no more traffic for a user to decrement an idle timeout;
i decide to use ipset with the bitmap ip,mac and the timeout value.

However, the timeout doesn't do really what i need, i use a dirty hack=20
to set the timeout counters every time a packet is matched;
so when there are no more packet, the timeout value begin to decrement.

I do this in the bitmap_ipmac_ttest function, i'm just wondering if it=20
is the right place to do this?

Thanks for your advice.

Regards.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

