From: Jeremy Sowden <jeremy@azazel.net>
Subject: Re: iptables 1.8.8 fails with error code 111 but iptables 1.8.7
 succeeds with same script
Date: Fri, 17 Jun 2022 15:56:37 +0100
Message-ID: <YqyWJaA282jxUabT@ulthar.dreamlands>
References: <f8b1ba7f-2d59-e068-92ca-a139959aa2fd@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VCIaVIusKP5gQ+mr"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
        s=20190108; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=zQswC+Sx2tkqUQQPKGK+eU+TwTogzaW+WtO4IhvXJu0=; b=U9IPSC88AqM36V0+Dadt8aR26B
        liwaYbUqImZWvlkxTMkIPUA4dBXQHwUHK71QgRWIUkbaH/O7+BW0UGAzIEdJ+T6EQDXLuHyh79UhQ
        gEhUxPrKx63xdMFwiZNXdC6+U3XRNUo6zWGcpeUYAPsGJx7RbZmkilLAFYCh9YP0KMeYSXhO0WbTa
        S5E8P/kqHWgDCUGK53Lp+u6NHOISTMa9pQVQ+zNQdptVoHPci+sY7i9bBbqJcr5AKTFo2k/WryUW1
        Iv+ROaOQFaGJiLcTQ+Rl4BlX+LTe+B7czqkeTDURLZEv0hVgqLg1bAGzdWMzNZrw2+RJna9JymZ7X
        ogCCn/Q 
Content-Disposition: inline
In-Reply-To: <f8b1ba7f-2d59-e068-92ca-a139959aa2fd@gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Amish <anon.amish@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


--VCIaVIusKP5gQ+mr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2022-06-17, at 20:02:13 +0530, Amish wrote:
> I use Arch Linux. Apache 2.4.54 and iptables 1.8.8 (nft based).
>
> I have a setuid script, given below, which runs via apache httpd and
> simply calls "iptables -w -nvL INPUT" and gives the output.
>
> But with iptables 1.8.8 it fails with error code 111 (undocumented
> code)
>
> > curl http://127.0.0.1/ipt.e
> EUID = 0, EGID=33
> iptables exited with exit code=111
> iptables exited with exit code=111
>
> It doesn't even print any error message. (not even to httpd error log
> - via stderr)

It is no longer possible to run iptables under seteuid, since it is not
possible to do so safely.  From 1.8.8, iptables checks whether the UID
matches the EUID and exits with 111 if they differ:

  https://git.netfilter.org/iptables/commit/?id=ef7781eb1437a2d6fd37eb3567c599e3ea682b96

J.

--VCIaVIusKP5gQ+mr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEbB20U2PvQDe9VtUXKYasCr3xBA0FAmKsliUACgkQKYasCr3x
BA2BdBAAusb85ZBxW6XmWm4zjFvv9EfUdqs8dZnWM701nIQRSMr1rVEdATEmY+11
bwOKIC+rbIv7lr1zcVIO2TgLL2RMV41qKbQO21779FvfaH5nH3AdfnyOAMTm80/L
/heztCGZitqXQ3RuhM6mMt4Jxd4lrM89MbP73AF2xX2CBgtXUHsLcnge8m/WTi9H
Qp7tvlj35tFdzkU/IC59XBG88pkluSlks6NlU5rmaJem3PBtIMVOEHATOea2zoyc
XBYdnVk2KPSdtxxGGxYD4IvjSEfPYvkevLBNJ/htACAQz7Y8A8CA5N/uNiR6+l3R
rgumVhUlwaIlu9UPDdyDbCspvR1hilC/n2o6kNZR7j8ZfZwpA4xJjYLHY9Pkw2iy
k2axlwSlqXZa86uGpARIHvdP8Md88chvGPfUiciXJtdWWsJerpgUxIjcZACV8ofQ
p0F54aiBBwC9ePQs48489e5apazveedkVdo8eU2bH7RrVXDtz6pIqlN+pAo62iCt
Vh2m5Zq646bm0KHUYarlzA6XOn0T8CPcsO8SsSbSJwFpps8eg73eCW1ezvvQXzJk
tHbcJx5EnnDTdnYS7rJdZFvVHSUpMDLtgpRmc/FnnLQ3kBXBRiYo+WdhN6OvWi/f
onCy31kbZIIn+bcY1PhXPuVTYhLSlz7bvLKN1n4xb3RvisbBmr4=
=uhLI
-----END PGP SIGNATURE-----

--VCIaVIusKP5gQ+mr--
