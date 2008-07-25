From: "Sebastien Tricaud" <stricaud@inl.fr>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Fri, 25 Jul 2008 11:43:38 +0200 (CEST)
Message-ID: <3186.217.109.32.54.1216979018.squirrel@mail.inl.fr>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com>
    <20080723094512.GA2250@khasse.inl.fr> <488766CB.9060102@trash.net>
    <20080724074144.GE2250@khasse.inl.fr> <488857CE.3060406@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488857CE.3060406@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: Eric Leblond <eric@inl.fr>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org, toady@inl.fr


    |>>> Someone should send a patch which adds helper functions to ease that
    |>>> task in a day or two.

I want to add a few features, but the patch will appear on the devel list very
shortly.

    |
    |> I will try to look into it. I know that kernel was automatically
    |> computing checksum if it was set to zero in packet vefore verdict but
    |> the feature seems to have disappear.
    |
    | I'm not aware of this feature. Was it present in ip_queue?

I wrote a program two years ago to alter packets without worrying about
checksums (putting 0 instead). Let's not do any assumption there.

I am going to send the checksum patch for libnetfilter_queue very soon, and
then write a sample program to explain how packet alteration can be done
easily.


Cheers,
Sebastien.


