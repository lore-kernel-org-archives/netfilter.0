From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Waiting until first release of NFTABLES
Date: Mon, 24 Feb 2020 10:25:14 +0100
Message-ID: <e36d450d-6707-4902-9378-a326504e5840@thelounge.net>
References: <c4e081c5-3bb9-827e-a382-388fe4d859de@satchell.net>
 <875zfwssw1.fsf@goll.lan> <b0399d25-901e-38a8-7359-8096516a818e@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b0399d25-901e-38a8-7359-8096516a818e@satchell.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: list@satchell.net, netfilter@vger.kernel.org



Am 24.02.20 um 06:02 schrieb Stephen Satchell:
> As for other packages with version numbers of 0.x, I'm not all that
> concerned in a firewall router for anything except the firewall facility
> itself.=C2=A0 This router will have, as its sole job, filtering incoming =
and
> outgoing packets to my upstream.

1.0 vesions in the opensource world typically stand for "feature
complete" and you couldn't care less about features developers are
planning when you don't miss and use them


besides that "nftables" is not the "firewall facility itself", it's the
package with the userland tools

the kernel does the filtering and has no version 0.9 for decades
