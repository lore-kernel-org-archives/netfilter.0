From: "Paco Orozco" <pakusland@gmail.com>
Subject: How to clear conntrack table
Date: Thu, 8 Nov 2007 08:29:49 +0100
Message-ID: <7c2474d40711072329s15c4431dg7fe6747247b6d21b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=pMny+YIIobmhDKpmlSGBgvnsm2dBxhuwzuHGAnCV8uo=;
        b=PbYFqgcdfBBZyg7s1k2rCE42cBMX/XlwOuPpt4Si3DsjQcit8xMOt04fjMqTMevEecfwRBX8GEQiY20hShf3MZbgbzmzmTVq7SMUJKCjEw+Zl1L5D1wIHT2wpq4Lt8HKCiDtH1IvsRahVy6gIzgn9H8OXRaNwpRA5Hq/QikfaPs=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: paco.orozco@upcnet.es

Hiya,

I've got a cluster of firewalls, using iptables and HA (heartbeat) in
active - passive mode.

When node 1 has de main IP address, I stablish a ssh connection from
outside to inside.
If node 2 takeovers this main IP address, for example with hb_takeover
HA's command, this connection, and those has been stablished are
maintained.
Trully, node 2 creates a new conntrack entry, with new sequence numbers=
=2E

But If I do a takeover in node 1, without rebooting it before. The
main IP address is taken by node 1.
The ssh connection isn't maintained, because conntrack has a ASSURED
entry on node 1, the first one was created, that has diferents states
(sequence numbres) from established connection in node 2.
So, this ssh freezes and it isn't maintained. If I try to ssh again
there's no problem.

Obviously, If I reboot node 1 before taking the main IP address, all
works correctly, but I'd like to have a better solution, for example
I'd like to clear conntrack table before taking the main IP address.

Does Anyone know It it is possible? Do you have similar environments?

Thanks in advance...

Paco

--=20
-------------------------------------
Aquel que planta =E1rboles bajo los
que sabe muy bien que nunca se
sentara, ha descubierto el aut=E9ntico
significado de la vida.
