From: "Paco Orozco" <pakusland@gmail.com>
Subject: How to clear conntrack table
Date: Thu, 8 Nov 2007 10:35:05 +0100
Message-ID: <7c2474d40711080135gf14a6d5m9c8109e3d81846d9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=/ZkFvWDLc467P/mdvTXNiB9323QcT+LwgK/Bw7mj8ZM=;
        b=e0ZVaG1hei8o5lXgJrJxLSwD6WvbT/anng8x09Qm96Eye/sGJQWy6k+GOGi+PlAAoTKoy8MJBFnly5hXEnSkC4iX1M2rIdKkBtCQ7HwaFnkKzDLm3pn3eVFE04dUhSesoff8maR12eLsdTxogvvRxsRlz510edyd6q0/l5VIU5s=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hiya,

I've got a cluster of firewalls, using iptables and HA (heartbeat) in
active - passive mode.

When node 1 has de main IP address, I stablish a ssh connection from
outside to inside.
If node 2 takeovers this main IP address, for example with hb_takeover
HA's command, this connection, and those has been stablished are
maintained.
Trully, node 2 creates a new conntrack entry, with new sequence numbers.

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
