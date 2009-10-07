From: Richard Horton <richard.horton@solstans.co.uk>
Subject: Re: Forward traffic between two interfaces on the same host
Date: Wed, 7 Oct 2009 16:09:41 +0100
Message-ID: <56378e320910070809g335de8f8i857e9129706e7da5@mail.gmail.com>
References: <43743.45717.qm@web31601.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=hD+T48cBxs+Jexgpdyl8YLdH5uTkD16Jr/imYpbKiZc=;
        b=thz4st4du4u/fL6Aaij6wrwaJfq5+ciHsTnr6olrEx67A0squu4OPC5W5XZNiBLxSN
         Rs5aQfKf2iRlqXZ7w8UESiKcZf+fYwTzO1iPZYLkQtxl20ycYaS2qgGFVtRnBQLjxWdC
         ywQtakDfigLBgbBArXNSZVyi8sgHlHLYyn+aQ=
In-Reply-To: <43743.45717.qm@web31601.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Cc: netfilter@vger.kernel.org

2009/10/7 Kostas Pelechrinis <kpele_ntua@yahoo.com>:
> Hi all,
>
> I am new in using iptables so I would like to do a few questions for =
something that maybe many of you find easy :)
>
> In particular, I have a laptop with two wireless interfaces, a Wifi a=
nd a 3G. =A0I would like to share the 3G broadband connection available=
 on this laptop with other machines within my home/internal network thr=
ough the wifi interface. =A0I would like to ask if such functionality i=
s possible to be implemented using iptables.
>
> Even more specific what I need is a 'relay'-like functionality. =A0Le=
t's assume that laptop A has the two interfaces and laptop B has only a=
 wifi interface. =A0Laptop-B will be connected with laptop A through th=
e wifi and laptop A needs to serve all the internet requests of laptop =
B through the 3G usb modem interface.
>
> I think that I need to use rules like the following for laptop A :
>
> (I use the names wifi0 and 3g0 for the corresponding interfaces and x=
xx.yyy.zzz.www for the ip of the 3G interface)
> iptables -A FORWARD -i wifi0 -o 3g0 -j ACCEPT
> iptables -A FORWARD -i 3g0 -o wifi0 -m state --state ESTABLISHED,RELA=
TED -j ACCEPT
> iptables -A POSTROUTING -t nat -s 192.168.0.0/24 -o eth0 -j SNAT --to=
-source xxx.yyy.zzz.www
>
> Do I miss something here ? =A0Do I need to take care of something els=
e as well?

Check that forwarding is turned on in the kernel...

sysctl net.ipv4.ip_forward should return net.ipv4.ip_forward=3D1, if it
doesn't execute 'sysctl -w net.ipv4.ip_forward=3D1' to enable it.

Not sure on the NAT rules as I have very little to do with NAT as
we're using iptables on a private internal network where the address
space in the private ranges is more than adequate enough (using all 3
classes of private addresses)



--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
