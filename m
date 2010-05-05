From: Bill Bogstad <bogstad@pobox.com>
Subject: what is atomicity of iptables packet processing?
Date: Wed, 5 May 2010 11:56:00 -0400
Message-ID: <h2u2d6a9f6f1005050856pc4d54582z7ccb7f79cb71991c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=mime-version
	:date:message-id:subject:from:to:content-type; s=sasl; bh=4SHhaI
	H/7W0pdg6dX+jAnfYorWI=; b=Ypj+3bX2oyO/5DPyRwUOlwkT3mlszrNX7ClqZH
	d3LHkzJKIR7VSxUM2YQdbliRKe/DdVQwe2chK12LjVxnmrUesjYJIfq6d1DGhOUV
	VKy+961BfJPY7Euzi6hxvkWcvq33HcHZmM4sY3b3laXmTUQpETP9L2YfmId7/ilr
	r00FM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>

I'm developing some chains/rules for use in the mangle table which
will make use of connection marking for packets related to TCP servers
running on the local machine.   I want to modify packets sent by the
local server based on information in incoming packets.   It seems to
me that the obvious way to do this is to mark the connection
appropriately in the mangle INPUT chain and then modify the outgoing
packets in the OUTPUT chain based on on the connection marks.

However, I'm concerned about the atomicity of packet processing by
xtables.  Since incoming packets may not be synchronized with outgoing
packets, there is the possibility that the INPUT chain rules might be
modifying the connection marking at the same time that the OUTPUT
chain rules are using the mark to modify the packet.   Even worse, I'm
considering building up the connection mark in the INPUT chain one bit
at a time and the correct mark won't be in place until after all rules
in the INPUT chain (or subchains) are completed.

So my questions are:

Does iptables/xtables fully process one packet at a time or can
multiple packets be in various tables/chains at the same time?

If the answer is multiple packets, can someone suggest a way for these
packets/connections to make processing single threaded AND
run to completion?

On a related note, how atomic is single rule processing?   If in a
single rule, I use CONNMARK to mark a connection can I assume that
no other CONNMARK can modify the mark at the same time.   (--set-xmark
involves two operations: zeroing based on mask and XOR based on value
which may be a race condition.)

If there are any other issues involving connection marks/parallel
processing/race conditions etc., I would like to here about them as
well.

Thanks,
Bill Bogstad
