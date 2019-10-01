From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: iptables TEE target and system slowdown
Date: Tue, 1 Oct 2019 10:44:18 +0200
Message-ID: <CABLYT9jOb0n0vH8M7JLM-cK7MRHpTcckhhdwDM9n5oUUA7MAyw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=aGap4ZYtqYFQ8kZdPc9HmfMb3dlboavAFvLhKv0Jbak=;
        b=V6cINlCmPVZDm81EWSYyNYWw338WjzNCvflhCjuWIbeh0gNehAqI/bVFnRgzteSulp
         Zv5JvCbOf6fzPGzZZzl4dnMsHvQhEFrjYiq0agr9sH6DWOlh4i6kROxWtySpvvnOvO/z
         PEsl4pXx2T7epsgVaVk6fXr9dv5+O0TtvNQuJTKQZcMH7/Zvm4+GL8w3eoR5x82CAPgu
         EM/Ux0vjkcufF+3NMIkjswQfLddBSZ/pzgEMSuynooqay6bgbhUJMAf3mhN9Xv3CgMHI
         lWg2BbPoJewBfBUIheGcJBibUsX9nRyTgJuyFKkXJjo7rzBcWLN3K5Z5IQpP8QrEpCgr
         tIow==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to send a copy of part of my traffic (on a router) to an IDS host.

I use this command:

# iptables -t mangle -I POSTROUTING -o enp5s0.11 -j TEE --gateway 10.215.246.15

I'm connected to the IDS host at 10.215.246.15 both via ssh and direct console.
This host's NIC is working at 1000Mb/s according to ethtool.

If I run tcpdump or iptraf-ng on the IDS's NIC then I see lots of
packets (duplicates), so at first it seems to be working fine.
However, it soon comes to a crawl and freezes for a while. It then
works again, but freezes several times again too. And so on...

CPU and RAM are apparently fine according to top.

iptraf-ng reports peaks around 75Mb/s right before the screen freezes
(when I say "freezes" I mean that the ssh session is totally frozen
and can even expire if it lasts too long, but the direct console works
fine, except iptraf-ng stops showing packet counters, etc..).
So I'm still far away from the 1000Mb/s link speed.

How can I further debug this?
Is the system/NIC truly overwhelmed with packets? How can I be sure about this?

Thanks,

Vieri
