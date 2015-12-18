From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Packet disappears after DNAT?
Date: Thu, 17 Dec 2015 16:41:48 -0800
Message-ID: <CAKmUPx4xc3nAzXsgCH+EPxC218V5FUhvR4nCCcDCEVRqbMUPwQ@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
	<5662BD03.60004@plouf.fr.eu.org>
	<CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>
	<56653CCC.6020603@plouf.fr.eu.org>
	<CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>
	<20151215130638.GA6295@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=6nKrlklYRPRTaJkaF/6S+QEcLQa+4TKOJZAKlfXFjbA=;
        b=n2LePcZpcTWMzDSyJQ+nZ8j+regrmpP905c6jfeZBA+eTwhrcJz3Cp/3Z3N82vepXp
         DtC2QDxQgnR6z//HtZnPQ4A3odXfpSYXPCkuFKgQagLePwknVPjgod+EF+9nOOV6AsBm
         09Ge5+BvVEI/Lw5PzKdsN5y/Fv1MdE1ezJwgnmhr00pm81Vx2FnZ1eaum5Wdzv65/pHX
         knQVrpGORnv7mvBbjWTx+AyCs/EbFX6gvyyqDbBC3ulf9AkVlPVsjn/trmcyiaUBjVBj
         8UuIEjOxnFZYEFKsAxq0wmZMoCgUZGht3cblAxacQT0+x4wdbON/NexrHm3irfYHgkYq
         VT9w==
In-Reply-To: <20151215130638.GA6295@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, Dec 15, 2015 at 5:06 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Tue, Dec 15, 2015 at 04:21:30AM -0800, Scott Bronson wrote:
>> Gotta say, running `echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables` in my
>> script makes me a little queasy.
>
> JFYI: The br-nf thing was moved to a separated module since 3.18. So
> now this finally requires explicit modprobing.

Thanks Pablo.  Is this the right logic to use for all kernels?

- if /proc/sys/net/bridge/bridge-nf-call-iptables doesn't exist
  - modprobe br_netfilter
- echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

    - Scott
