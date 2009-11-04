From: aidan mcgurn <a_mcgurn@yahoo.co.uk>
Subject: ipt ROUTE
Date: Wed, 4 Nov 2009 04:15:45 -0800 (PST)
Message-ID: <917815.12910.qm@web24108.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024; t=1257336945; bh=xGOT/Ox96uyR7a23ByAGWxY3xVjEvWDYbhvKPny467I=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=gHkZkqa4iyW71GXcz6uUuSm8AJkUUcKeCyYh6mKYU1AUPSjewDdCuAtUH0j875vJutjqrULeLteSy5gEihTVB0se1rtgHyB9APxCYCZ4fO78nB9AvXyXd0Zipd+kpgML5iQpoMRxxLQ4wQCyd06DILuSXObBZqD8HBzbMGrfYpk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,
(apologies in advance - don't seem to have the option to reply within t=
he same thread so re-sending this)
thanks for the response.
I had looked through the archives and did again but i'm fairly new to n=
etfilters iptables and i can't see=20
any other way of routing using dst:port via different gateways besides =
using the ipt ROUTE lib.

That been the case, can u please directme on how to build the ipt_ROUTE=
 kernel object for this or is it a patch thats required?
As i said i downloaded 1.3.5 iptables code from netfilter and did a mak=
e but it only builds the shared objects, no kernel objects which
i presume i need to install a ipt_ROUTE.ko to get the -j ROUTE option t=
o work?
alternatively is there any iptables package which includes this?


thanks for any help here,
/aidan


=3D=3D=3D=3D=3D=3D=3D=3D
Search the
 archives:

--=20
Eray
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>Hi,

I want to use the libipt_ROUTE facility which is currently not availabl=
e in my linux \
iptables install.

I did download the =C3=A2=E2=82=AC=C5=93iptables_1.3.5/
 iptables-1.3.5.tar.bz2=C3=A2=E2=82=AC source code and build \
the .so (despite the ipt_ROUTE.h missing from here).=20

However i=C3=A2=E2=82=AC=E2=84=A2m wondering if u know how i get this t=
o work on my system.=20

e.g. i presume i need to build this as a kernel object and insmod it? H=
ow do i buid \
this from the source i got from 1.3.5?

Ideally i need this facility to route packets via different gateways ba=
sed on port \
number unless theres anther way to do besides ipt_ROUTE.

Thanks,

/aidan


     =20
