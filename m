From: Paul Marks <pmarks@google.com>
Subject: NFQUEUE after MASQUERADE: is it possible?
Date: Wed, 3 Apr 2013 23:25:15 -0700
Message-ID: <CAHaKRvKf=U+zkwfWLoXgJdp9RRpGfTHDejgrFrz_1t5mFQM2Gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=x-received:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=0EnhMTbhMrbwgZ8g0au23Dy8pZtxv5wtyHr5hbAjyYk=;
        b=OTEKTYJ82FEic/pmekJ1+ILBZfiFDr341l3pICfbID1o8M0ieMzMs9fRu4zPfvjgvc
         iXIpie2mJeSeDtO6YR3sXlhf2zmFyDIL8uMycmwNEGOmGkRnN3+OOi+ikbTa4uNWJD+G
         HNsF56WYiUlPi0Aj5deuLu7UKlL3uPhrc3Rg8WiBp5zy7N2Xy+b8U/BcpaIRp9vzvPaY
         kDSTVZxGUY1GpNu+zZt0UfVpD4Gnx/Ds3CrbICqoaChTV7dk2N9ryXedjC/W945I1AsT
         OzBmAaoXWf+bswh70BrcNn0Bjjl/veATnes6PNZiGKKqWsMY02lZ6MWJs5CkN7vkFyou
         85RQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm doing some brainstorming related to a 464XLAT client, which
provides virtual IPv4 connectivity to devices that are otherwise
IPv6-only.

Currently, this works by creating a TUN interface to receive the local
IPv4 packets, but to preserve compatibility, it'd be better if I could
bind to an existing IPv6-only interface and suck up any IPv4 packets
sent there.

I think the netfilter NFQUEUE target almost allows this, but the
problem is, sometimes there's a MASQUERADE target installed in the
"nat POSTROUTING" table, and I need to steal the packets *after* the
NAT occurs.

The following diagram indicates that "nat POSTROUTING" is the final step:
http://www.faqs.org/docs/iptables/traversingoftables.html

Additionally, it appears that any rule listed after MASQUERADE is
never executed.  Is there any possible way to attach an NFQUEUE such
that it receives *all* of an interface's IPv4 packets?

I considered using a PF_PACKET socket, analogous to tcpdump, but that
merely provides a copy of the packets; I haven't found a hook to
prevent those packets from reaching the physical interface.
