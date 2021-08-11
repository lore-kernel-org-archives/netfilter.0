From: Harry <simonsharry@gmail.com>
Subject: Re: Why aren't INPUT and FORWARD chains available to a
 locally-generated packet?
Date: Thu, 12 Aug 2021 05:07:39 +0530
Message-ID: <CACj4R3-01PcZeY480-ZqUkMoWKp3Odo1=xgMm7XTYSi3MWaJGg@mail.gmail.com>
References: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
 <ac4eed88-b4e0-353d-42e4-17f92418bad9@thelounge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAi22qu6b7c+05ru1Thj/3u3TlQzbvPeQ+t/aSDrMww=;
        b=sie1foB1HP8Wcwikw1t5fl4bO6FnFjmi2FvpLAwe8ueWgDAHnGtPi26QJuZwWzL5UI
         IfGnPlDU6/1HqtoIOToar984acl84C/Uc5DOa9gUkZJay0lU4IDlL0w0vxdaG3exiagE
         kr2DCh4dguAMPS9ZM6IfT+s2DCAjI5U+qgJGPcrovkn4Yk47cD+wu8aQSY/0i6Yz1bix
         kbV7+HG2lluFqv9HIWawjrAdrVlSVWGjncl8QdXEpieKCWkqWFSP54cympOP/D42vUxu
         LQrIl7cv5KC6R2mseK81g5To8dgh5GHmrgfQbghyWOjgJafZtX/31C2Na5kntEHZTV0r
         IJhw==
In-Reply-To: <ac4eed88-b4e0-353d-42e4-17f92418bad9@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

On Wed, Aug 11, 2021 at 8:02 PM Reindl Harald <h.reindl@thelounge.net> wrote:
>
> Am 11.08.21 um 16:12 schrieb Harry S:
> >
> > Let's say a process on a router host generates a packet. This packet
> > goes to the OUTPUT chain, following which a routing decision is made.
> > Now, this packet could be destined either for the loopback interface,
> > or for one of the host's many ethernet interfaces. If so, why
> > shouldn't Netfilter bring the packet to the same INPUT / FORWARD
> > decision-fork in the path that exists for an incoming packet soon
> > after it has crossed PREROUTING?
>
> because it did not enter from the network nor is it forwarded which
> means you are a middlebox

True, it didn't enter the network stack from the 'wire', but shouldn't
the routing and table/chain semantics apply to it equally? For, an
application running on the same host won't care where the packet came
from: from the wire, or from another local process?
