From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: Why doesn't the UDP source port change?
Date: Wed, 10 Jun 2009 13:33:34 +0200
Message-ID: <200906101333.37727.christoph.paasch@gmail.com>
References: <dac45060906100409m9614b66if48f11eb5d425a3d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1485149.oatmLAXWx4";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=aBnBdMAP+cAf5/HNYYhkq4Zh7v8X0nCYGOn/EniwKsw=;
        b=YUexUhUYo2aolRwJzDxWEBvZZy5DTatm5BDT4yPTsWOh/KBUdiu5QLVYbqi+t6x/yF
         5lkRItWUT4SRTn/KMMCCdBZyqbeAEvd5f/lcpDjW9pV7HgU5bBz3mjXbHTljpQDSpn6w
         WhsYwl/iUNuDYBV51tBaXI7BGXRFTQqOLCot0=
In-Reply-To: <dac45060906100409m9614b66if48f11eb5d425a3d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mark Ryden <markryde@gmail.com>
Cc: netfilter@vger.kernel.org

--nextPart1485149.oatmLAXWx4
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

manpage iptables:

MASQUERADE
	.........
       --random
              Randomize source port mapping If option --random is used then
	      port mapping will be randomized (kernel >= 2.6.21).

On Wed June 10 2009 wrote Mark Ryden:
> Hello,
> I am trying and having success to build a NAT using MASQUERADE target;
>
> I have a machine with two interfaces. eth0 is an internal IP of
> 192.168.0.45 (internal)
> network. eth1 is 10.0.0.1 (also intenal network)
>
> On this machine I run this:
>
> iptables -A POSTROUTING -t nat -o eth0 -s 10.0.0.0/24 -d 0/0 -j MASQUERADE
> iptables -A FORWARD -i eth1 -j ACCEPT
>
> I have a second machine, 10.0.0.189. This machine is connected directly to
> 10.0.0.1. (I can ping 10.0.0.1). It has only one nic.
> On this machine, the default gw is 10.0.0.1
>
> Now, when I send from 10.0.0.189 a UDP packet to a different machine
> on 192.168.0 network (for example,
> 192.168.0.10) , it goes through the NAT on 10.0.0.1. I see that the
> source and destination UDP ports stay the same
> in the sender **and** in the receiver. When dealing with real NAT (when one
> side has external IP address), than the UDP **source** is changed by the
> NAT, and it is not the same on the receiver and the sender.
>
> My question is: how should I configure the rules so that the UDP
> source port will
> be changed by the NAT so it will not be the same on the receiver and the
> sender? rgs,
> Mark
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Christoph Paasch

www.rollerbulls.be
--

--nextPart1485149.oatmLAXWx4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkovmg4ACgkQLHtZTroOLZvbLgCgh4ZkbNB2wfZEVI2/N9pz/bCg
F9sAoJaS8Ll+SRNQsK0Ir3tIZGSiHHe0
=QvJO
-----END PGP SIGNATURE-----

--nextPart1485149.oatmLAXWx4--
