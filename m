From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: libnetfilter_queue+libnetfilter_conntrack: Performance
Date: Mon, 22 Jun 2009 13:13:39 -0300
Message-ID: <3fdd6ce00906220913v4f9a4957hca6dceccd948693a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=aT+kdlbxhRf62yDV7BZUTidx2vfT1gVN4nUwdcfIruE=;
        b=A6MHGXMteu3VZR5mhvzbuCYnDYmOCcCQkTGo9zm9J7WzEN5SVHpUfy3fKwNN1KsA3q
         eptDa4q200lexQM7dQR8iT78iJMwLUHDaBATeFkOkoWvYq5VW8R+36er6lyK/QB9Xj3F
         BShYXZdPmrcmr+N0qgWrT/3xg0mrpqwp3KWNY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

Hello all,

During some time I was trying to do NAT at user-space. Now I have done
it, and works 'fine'(thanks to Eric, which answered me at this list
about libnetfilter_conntrack).
The code does what it need to do, but it seems to have a few
performance loss. I'm capturing by libnetfilter_queue the first packet
of each new connection(--state NEW -j NFQUEUE). I get the payload,
create the conntrack entry, and set the verdict to NF_ACCEPT.

It happens too fast, and a little time after the proccess it's blocked
and ready to receive the next packet. But the packet seems to pass by
just after a few seconds(about 3,4..) later.

When I simply accept the packet, and don't create any conntrack entry,
the packet seems to be sent/received in the same time I accept it. So,
I think there's anything to do with connection tracking.

What may I try to do about it?? Any idea??

Thank you all.

[]'s
