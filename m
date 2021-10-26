From: Benno <b.ohnsorg@freenet.de>
Subject: Re: nft list empty
Date: Tue, 26 Oct 2021 22:32:15 +0200
Message-ID: <bb50c53c-f365-92b9-87c5-193a77ca3ace@freenet.de>
References: <YXhWwPas9vnN2XDi@granicus.if.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
         s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DHIv8rViOpj7Q5kNuhq0dpQL0Mahr1VUqMRBLSYmzwM=; b=vSK3eq2fNXj4FJuDstB/JJ6nl5
        mvNgbdj7XP7PKEbCH/WY2Q+R9lZaQYxIg0QOEVqWI7o8REwW2+F1jOqW6gjPjfc74TcDYFsoppXCo
        fTHRpHGRWy1lA6AfuEyxL0PJJbKh9BRN1bnbXOMoM02cJ0OLAR9RTNV9YK9WRYg3CuHKAQ6YiG1Av
        w1I1jtRqYoDBWP7nyV5htiGnuaN8d6OOUnE1Gmyndf+GNNgK77+rXLShx/ogR9NkpSYE3V6+iPa+W
        UNnIxAUyhoolcYMPZo4QMCmcF4nf/24Pd5/eI5DTfPexQdNRYwmJfWJOgT2XgbAVbGiZSJISiFnFx
        e7 
In-Reply-To: <YXhWwPas9vnN2XDi@granicus.if.org>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Nathan Wagner <nw@hydaspes.if.org>, netfilter@vger.kernel.org



Am 26.10.21 um 21:28 schrieb Nathan Wagner:
> For some reason, 'nft list ...' doesn't seem to print anything out.
> A nft create table seems to create the table, but other than an
> error if I try to create it again, I don't have any way to tell.
>=20

Which version of nftables are you using? Does nft list tables or nft
list chains output your rules? (Kernel 4.15 is from 2018, most major
distributions moved to at least 4.19. Currently nftables 1.0.0 is stable
but not yet available in all distributions.)

Is nft really the binary from the nftables package or something wrapped/
enhanced by a distribution? Is there an alias in your shell? (In Bash
this can be avoided by using 'nft' =E2=80=93 single quotes.)
