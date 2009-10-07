From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Forward traffic between two interfaces on the same host
Date: Wed, 7 Oct 2009 18:24:54 +0200
Message-ID: <33be4bb30910070924la1d34bco3e18c0b625b5c25@mail.gmail.com>
References: <43743.45717.qm@web31601.mail.mud.yahoo.com>
	 <56378e320910070809g335de8f8i857e9129706e7da5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Yls3+pp822Zls/CfRWMZodT4yLJXsYPSigV4px+G7I8=;
        b=sthBdrwSP5kio2c0E3X3VWkknvG5CzEBGaza+qU23ZGGzkfeKwgTpZfN+beXPUI0DY
         k3mCbfGZ8Rt1GACk9atn3wgr2VndfxXCfHkEankALpIJ8EGpBahs9XZlmJ2760ZTXL+Z
         dniZDcklJfITBK+61qmF0Pomouk221bh7klnY=
In-Reply-To: <56378e320910070809g335de8f8i857e9129706e7da5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kostas Pelechrinis <kpele_ntua@yahoo.com>, netfilter@vger.kernel.org

2009/10/7 Richard Horton <richard.horton@solstans.co.uk>:
> 2009/10/7 Kostas Pelechrinis <kpele_ntua@yahoo.com>:
>> Hi all,
>>
>> I am new in using iptables so I would like to do a few questions for=
 something that maybe many of you find easy :)
>>
>> In particular, I have a laptop with two wireless interfaces, a Wifi =
and a 3G. =A0I would like to share the 3G broadband connection availabl=
e on this laptop with other machines within my home/internal network th=
rough the wifi interface. =A0I would like to ask if such functionality =
is possible to be implemented using iptables.
>>
>> Even more specific what I need is a 'relay'-like functionality. =A0L=
et's assume that laptop A has the two interfaces and laptop B has only =
a wifi interface. =A0Laptop-B will be connected with laptop A through t=
he wifi and laptop A needs to serve all the internet requests of laptop=
 B through the 3G usb modem interface.
>>
>> I think that I need to use rules like the following for laptop A :
>>
>> (I use the names wifi0 and 3g0 for the corresponding interfaces and =
xxx.yyy.zzz.www for the ip of the 3G interface)
>> iptables -A FORWARD -i wifi0 -o 3g0 -j ACCEPT
>> iptables -A FORWARD -i 3g0 -o wifi0 -m state --state ESTABLISHED,REL=
ATED -j ACCEPT
>> iptables -A POSTROUTING -t nat -s 192.168.0.0/24 -o eth0 -j SNAT --t=
o-source xxx.yyy.zzz.www
>>
>> Do I miss something here ? =A0Do I need to take care of something el=
se as well?
>
> Check that forwarding is turned on in the kernel...
>
> sysctl net.ipv4.ip_forward should return net.ipv4.ip_forward=3D1, if =
it
> doesn't execute 'sysctl -w net.ipv4.ip_forward=3D1' to enable it.
>
> Not sure on the NAT rules as I have very little to do with NAT as
> we're using iptables on a private internal network where the address
> space in the private ranges is more than adequate enough (using all 3
> classes of private addresses)
>
>


In addition to Richard's comments: It seems wrong to suddenly have
eth0 on the nat-rule instead of 3g0. Also, if you get a dynamic
ip-address on the 3g-interface, you might want to use MASQUERADE
instead of SNAT.

/Oskar
