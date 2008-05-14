From: "=?ISO-8859-1?Q?J=FCrgen_Rochol?=" <juergen.rox@gmail.com>
Subject: Netfiler REAL Rule Match Sequence
Date: Wed, 14 May 2008 17:21:49 -0300
Message-ID: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=9X5iNXko923WHpNqVcInpPKEKR82Qdcb7ivnupOIPHE=;
        b=wGBjYAfIqil+zCCLGfP1tvlCyGRtZuT70OLFfF8NiAStSZw/KTv0mS6/IAtnyDGzx7j5HjJeWlcrB1lrv/2Dm6QjBTjcbu1hh4aADzFu1kw1TAxFh3d5FIR6kFCVHv4a7RWde5CRaRZ6WVFBa7QSIgrrKBLrCT9u9vBw9+j1AUM=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

My question is related to the sequence that rules are evaluated in the
Linux Kernel with Netfilter.

I'm aware of chains (INPUT, OUTPUT, FORWARD ...) and also tables
(filter, nat and mangle) and how they're related.

But my question is:  imagine a single packet passing trough the
machine (PRE_ROUTING, FORWARDING and POS_ROUTING chains).
Suppose also that I've got rules in mangle table at PRE_ROUTING, nat
at PREROUTING, and in nat at POSTROUTING.

So this packet should be evaluated first in mangle at PRE_ROUTING. If
a match happens, what happens(besides the rule match action)?
1. The packet continues its flow and its also evaluted in NAT at
PREROUTING as well as NAT at POSTROUTING (if it passes the rules, of
course)
2. Or the filter stops to evaluate at the VERY FIRST match, without
caring about other possible matches withing other tables at the other
chains?

Putting in a simple way, is the packet evaluated under a unique single
rule list or several rules lists -- one for each chain?

Thank you all in advance.

Best Regards,

J=FCrgen
