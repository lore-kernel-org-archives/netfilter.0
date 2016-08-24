From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Add element in set when element already present.
Date: Wed, 24 Aug 2016 16:53:38 +0200
Message-ID: <20160824145338.GA8282@salvia>
References: <e145e82f-0b0f-50df-c9ce-d1c2446f9543@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e145e82f-0b0f-50df-c9ce-d1c2446f9543@laposte.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Mika=EBl?= Fourrier <mikael.fourrier@laposte.net>
Cc: netfilter@vger.kernel.org

Hi,

On Tue, Aug 23, 2016 at 06:51:32PM +0200, Mika=EBl Fourrier wrote:
> Hi,
>=20
> When I add an element in a set (same with maps) and the set already conta=
ins
> the element, the command fails with an error. Worse: I try to add multiple
> elements and at least one of these elements is already in the set, the
> command fails without adding any element. Why do you use this semantic? It
> would be more ergonomic if you could just add elements in a set without
> checking its content.

Just sent a patchset to address this. Two for kernel:

http://patchwork.ozlabs.org/patch/662322/
http://patchwork.ozlabs.org/patch/662323/

Four for userspace (include two tests).

http://patchwork.ozlabs.org/patch/662333/
http://patchwork.ozlabs.org/patch/662331/
http://patchwork.ozlabs.org/patch/662332/
http://patchwork.ozlabs.org/patch/662330/

        # nft add set inet filter myset { type ipv4_addr\; }
        # nft add element inet filter myset { 0.0.0.0 }
        # nft add element inet filter myset { 0.0.0.0 }
        # nft create element inet filter myset { 0.0.0.0 }
        <cmdline>:1:1-45: Error: Could not process rule: File exists
        create element inet filter myset { 0.0.0.0 }
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The 'create' command complains if the element exists, the 'add'
command returns success if it already exists.

This basically provides the same semantics that we have already in
other objects.
