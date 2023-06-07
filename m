From: Eric <evil.function@proton.me>
Subject: Re: Resetting the timeout counter for a named set element?
Date: Wed, 07 Jun 2023 19:07:53 +0000
Message-ID: <ZXwm7RMinLplGQK8cvyRXHCqBdTgEHc0QoCNLjQeGdwpCE3QLu63FmTwuBKbhv-YHH9vmWD-OSKwsISvIUIkKDPIcx0D75ceketK-kRvd4Y=@proton.me>
References: <0ed31677-f634-1494-ccf1-1dd60a31a518@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=w3kduoyaovhc3pinzmbnububxu.protonmail; t=1686164882; x=1686424082;
        bh=MR3oiOMyW89BoiFZXGTmvEaEiJtCnK7q40vFDRfSCN4=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=PtSzyDVPrxkcBpN2xMYcmpeXis48sj9I6WhF0VDNT2m/wumqSBjCZU1H7/DE1/LY9
         VsDnkrsYZRyxDSkFGBFS2A60JVP/W0yRPfE6u1bpJZ1gZ13Hbgza9SvwZUUdPld22c
         hYcqQ5fBepWgRlRAax/+KGL30xBDwRdXBWeGpKhq9UHHfdC/hoolm7NVswmjA12iYi
         gmBUjKlynE2vAUazWjOl6N7ik8ZVuy1WEtb/GzLhi92trH8QQOiQ4bq3nvY42uf+Ey
         cUrCiT/J7MX7anvDosT6eW4M53nX3n+hrRAuKQBcMBaoyJMfIgM7MeyYT5MfGnS0H2
         h1KfBChRyV8tg==
In-Reply-To: <0ed31677-f634-1494-ccf1-1dd60a31a518@gmx.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?utf-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On Wednesday, June 7th, 2023 at 08:10, Lars Nood=C3=A9n <lars.nooden@gmx.co=
m> wrote:
> 1) Is there a way to reset time timeout counter so that the set can be
> told to extend the lifetime of a particular element? If so would
> attempting to re-add the same element to the named set do that?

Yes, but only in-band so any 'nft add ...' is a no-op for already existing =
elements (I had some questions on this maybe a year ago).

Assuming you've already create a set, say 'doh_ipv4', with 'flags dynamic,t=
imeout', then

  nft add rule inet filter input 'udp dport 1234  update @doh_ipv4 { ip dad=
dr }  drop'

Will update the expiration time to your timeout value when you send a udp p=
acket to port 1234.

The equivalent command does not exist, so it's fairly painful to maintain o=
ut-of-band lists and update their sets accordingly.

  nft update element ...

An 'nft add element' simply ensures that the set contains the item of inter=
est, but does not alter/update its expiration time.
