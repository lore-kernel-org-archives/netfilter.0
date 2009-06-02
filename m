From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: what is the '-m' flag?
Date: Tue, 2 Jun 2009 22:36:49 +0200
Message-ID: <200906022236.54167.christoph.paasch@gmail.com>
References: <4A258A3A.8080200@veltrac.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1289579.WeDWiiJbyp";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=uz4+5rS0UQrxLx5o6DYnlrBtzMteooCunVt7Ym+O6A4=;
        b=CQcX9Y4I9jgglaffSlFytatfd+S0kFuyvTTQ7xK9tsyxVtxm6HQySzpRZg4b3evcE3
         V4KnwpoAqNNbe2FRpYloy4dJPMMLC9ZfUBS52WVu7FYLb25C1bZno+OKRupV8BxL2QHX
         n+LvovHPFh8uDMkiDUUPFhb8Mt0Yju//1JNdA=
In-Reply-To: <4A258A3A.8080200@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Cc: netfilter@vger.kernel.org

--nextPart1289579.WeDWiiJbyp
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Look in the manpage of iptables.

-m loads the iptables extension.

On Tue June 2 2009 wrote Leonardo Carneiro:
> what the '-m' flag does in iptables? i'd search google and read the
> manual, but did not found anything.
>
> a old script running in a firewall of my network have some rules like
> these: iptables -A PREROUTING -p udp -m udp -d $inet_ip -i eth0 --dport
> 8282 -j DNAT --to-destination 192.168.1.102
>
> tks in

--
Christoph Paasch

www.rollerbulls.be
--

--nextPart1289579.WeDWiiJbyp
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkoljWEACgkQLHtZTroOLZuGEwCfZZ1Otcv2kcacWd7p2SnbLO29
gWYAn0LK4YA9U91cLib6+fCK9/CUKqBV
=2t1N
-----END PGP SIGNATURE-----

--nextPart1289579.WeDWiiJbyp--
