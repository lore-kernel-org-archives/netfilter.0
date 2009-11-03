From: aidan mcgurn <a_mcgurn@yahoo.co.uk>
Subject: iptables ipt_ROUTE
Date: Tue, 3 Nov 2009 11:03:42 -0800 (PST)
Message-ID: <490093.21027.qm@web24104.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024; t=1257275022; bh=XGv7m5RgCyQwvqymCbruCYkUtnr+t/CmXvX+C3RILmw=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=CxtEHgBzOf7tNJiNmoT5m6vQLmMzIUoLi63d0iTSwoxUXdBsJHI7+0bubqkpaeOHJO3rL0NSqoAPw+qlIyHbEmMq2sfcUVJyiFIv20OzUhaz21U1Of6BJ9Q3VcTwa0mYc4oNXzvCOsos8jFQOPPTIx3W+lwb0BW05mmRNqcBBX4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I want to use the libipt_ROUTE facility which is currently not availabl=
e in my linux iptables install.

I did download the =E2=80=9Ciptables_1.3.5/ iptables-1.3.5.tar.bz2=E2=80=
=9D source code and build the .so (despite the ipt_ROUTE.h missing from=
 here).=20

However i=E2=80=99m wondering if u know how i get this to work on my sy=
stem.=20

e.g. i presume i need to build this as a kernel object and insmod it? H=
ow do i buid this from the source i got from 1.3.5?

Ideally i need this facility to route packets via different gateways ba=
sed on port number unless theres anther way to do besides ipt_ROUTE.

Thanks,

/aidan



     =20
