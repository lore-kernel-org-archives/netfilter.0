Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B01078F
	for <netfilter@vger.kernel.org>; Sat, 15 Feb 2025 04:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739592589; cv=none; b=DTvtb4GsU9VxBh0REiDA8qbLt74OS4Darg3P3Lgd8CunbFe56TB/vWfn7nKTP0Yrmpp7bF+/TtkDN1zLivL+N+bv5NV3fOG89n78BEnpH74FFsnIFM5D8mAeg3EsOf3r9wp4uocC/zyQt6fhkxrhrNYmPrJAKqOOO2yHbfvsKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739592589; c=relaxed/simple;
	bh=q3iUt0aIc350W+5Dm6q4Oknn1/aUUAx6QPc8a1NRrNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=C+PICbqgE+/77F1wtBaN9yNCJVXbLBJOYVH6TUExfUwSV2cd4ctSKW9bq9iPa0jZvXqO/wXI2WPkdNX++blcpWMSz3lb9arCcBo6dNlX90AQ/Hh6egDSs9+ROol4dVVH+Y2F6Cj6pYe0UzfpgZqCHtYs7hKVvrmRnBTpkDk6A4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EirRVUbG; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EirRVUbG"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5fc13355a5bso1287532eaf.3
        for <netfilter@vger.kernel.org>; Fri, 14 Feb 2025 20:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739592586; x=1740197386; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0k+vCnv+FTAR9dWNfaxPUbd1rajaW5tCKdW3cIoUEVk=;
        b=EirRVUbGa33MRDY23+35QTt8zsI+gR3wI2C7euvj8Q3Oa7qRMjt0ODnzVZIRXfjyXl
         dvDihscIW2i/IEkNkf9uYZji11y3DwEm5ZNTjqoAhQY+mqnX9AZSz7zQ0XS5mZ7+JHQZ
         6gr/xdWOnc4p6WbW9YcIMVejvlXJfjxktZJIuyocCQRaRMa7Fi0p9SXWuR+n2pmIXhmO
         VuA11XT6hXpGUYiMHFDEd1ksy6xPEdW0vWVX3jTUVPoCdb9Bl7uMJ3498gGwLu2JtOc5
         8b+TP7MtzfgkhYMp5tYuX8/7J/4YdhCnZhYi7+GnVoOJ14rL+xEOh8a5UXu9AAHz5eWK
         yv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739592586; x=1740197386;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0k+vCnv+FTAR9dWNfaxPUbd1rajaW5tCKdW3cIoUEVk=;
        b=n10YuOf7fsKBr1o8K/WOjkDUTUdi8zLph4PltA6LCXBSnHrTEp7q1jL3FH0TljThQk
         yFHl0XFYkMWtG5/Xv9UVitWQuw5/OJE1q6j9CLIyyb5dn8WuounW8zwziZqunbnwd60g
         OiTG1BFgua+des2YrX+nkSMfezIf+8QBkN5kPUiC9K/vFqYMMo7clEp+mO+XIInrMSVN
         rQLmns5rAU0E607XmVEArtdZC5TfVMHLEq3KFSMufe75M+b6OeXUIx8oVKtDXrmMOsjI
         brGd5LYMQqVfOFyZ904XC6jwFXS0Qozysez+OkYf2RV6o7MLuRl6a7eVQHRJ3kYnbkNh
         ou8A==
X-Gm-Message-State: AOJu0YydFoucPnrFPJLVsx9/A7oF0M/D9wI5aLCIAhZd1b3sL5/VceTf
	5+oTjylcFZrth9hTz+7AqxCchCsqtc4GpJoMgxcTVe69Le327fJ2n2jK3n+WcaoqN9k/Ccd0jbj
	PIKszpgKRhk5+dude11MuDGGwU+42LsyzL1g=
X-Gm-Gg: ASbGnctcIqUp87HTbWWqmq4fkGJT+pfa41ypU71BjNkD/Gv+R0ZyWXEaigZmSV9JzUp
	VB8rhEt+UPiqmGVdB+WSaAkBBrEDDndHrWSVXYLZsrXEG4mCw5/XPPcNYBI7xtiqFLBRfdJ0=
X-Google-Smtp-Source: AGHT+IGuDU1X+DA0Tm/utcqAcBgDhZ/AI2XdGl4pAE5yYk2qVlHyEe5s6FhVPbCZfgN8j59upuL3LlGzlRlnXJ3QCNY=
X-Received: by 2002:a4a:ee96:0:b0:5fc:947b:c33f with SMTP id
 006d021491bc7-5fcc54f0bd9mr1110517eaf.0.1739592586558; Fri, 14 Feb 2025
 20:09:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
In-Reply-To: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Sat, 15 Feb 2025 06:09:30 +0200
X-Gm-Features: AWEUYZn5cGvMoc-p5pZyCp-yr4pZoJwTWpfvt1I6nJFgMJr2bMnyskPZSAwc1AM
Message-ID: <CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
Subject: Re: Static bidirectional static NAT for duplicate IP devices using iptables
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 1:57=E2=80=AFAM Alon Bar-Lev <alon.barlev@gmail.com=
> wrote:
>
> Hello,
>
> I am sure this was addressed before, I tried to find relevant
> information but could not. I appreciate any assistance.
>
> Constraints
>
> * Two devices with the same IP, this cannot be changed.
> * Devices do not have a default router, they must communicate with
> applications on the same IP network.
> * Host applications should access the two devices using UDP and TCP
> based protocols.
>
> Network Solution
>
> * To avoid address conflict, each device resides on a different VLAN.
>
> APPLICATION -->
> Kernel -->
> * v10@eth0 - interface on VLAN=3D10
> * v11@eth0 - interface on VLAN=3D11
>
> Switch -->
> * Port1 VLAN=3D10
>   * DEVICE1 [10.0.0.10]
> * Port2 VLAN=3D11
>   * DEVICE2 [10.0.0.10]
>
> Diagram [In fixed width font]:
> ---
> ,-----------+--------.       ,----------+-+--------.
> |           |v10@eth0|.......|          |1|VLAN=3D10 |---DEVICE1 [10.0.0.=
10]
> |APPLICATION|    eth0|-------|   Switch +-+--------+
> |           |v11@eth0|.......|          |2|VLAN=3D11 |---DEVICE2 [10.0.0.=
10]
> `-----------+--------'       `----------+-+--------'
> ---
>
> I would like to have a bidirectional static NAT so that per
> application point of view:
> * DEVICE1 will be 192.168.110.10
> * DEVICE2 will be 192.168.111.10
> And per device point of view:
> * APPLICATION will be 10.0.0.11
>
> I thought of having v10@eth0 address 192.168.110.1 and v11@eth0
> address 192.168.111.0, however, I am unsure how to set up the
> bidirectional translation to the device virtual address using SNAT
> without creating duplicate addresses.
>
> Any assistance will be appreciated.
>
> Regards,
> Alon Bar-Lev

Hi,

I made some progress using nftables which is nicer and simpler than
iptables for this mission.
However, I am unable to figure out how to re-write the ARP
request/reply, there are no good examples of how to use ARP rewrite.
I need to rewrite the ARP request to be the same as the translation.

This is the configuration I reached so for v10 is the interface of
vlan 10 and v11 is the interface of vlan 11.

v10:
   Host: 10.0.0.11<=3D>192.168.110.11
   Device: 10.0.0.10<=3D>192.168.110.10
v11:
   Host: 10.0.0.11<=3D>192.168.111.11
   Device: 10.0.0.10<=3D>192.168.111.10

table ip mytable {
        chain prerouting {
                type filter hook prerouting priority -300; policy accept;
                iifname "v10" ip daddr 10.0.0.11 ip daddr set 192.168.110.1=
1
                iifname "v11" ip daddr 10.0.0.11 ip daddr set 192.168.111.1=
1
                iifname "v10" ip saddr 10.0.0.10 ip saddr set 192.168.110.1=
0
                iifname "v11" ip saddr 10.0.0.10 ip saddr set 192.168.111.1=
0
        }
        chain output {
                type filter hook output priority -300; policy accept;
                ip saddr 192.168.110.11 ip saddr set 10.0.0.11
                ip saddr 192.168.111.11 ip saddr set 10.0.0.11
                ip daddr 192.168.110.10 ip daddr set 10.0.0.10
                ip daddr 192.168.111.10 ip daddr set 10.0.0.10
        }
}

Now I just need to figure out how to manage the ARP.

Regards,
Alon
