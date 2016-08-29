From: Pierre-Antoine BRAMERET <pa.brameret@gmail.com>
Subject: Bigger packet after mangling queued packets
Date: Mon, 29 Aug 2016 18:12:44 +0200
Message-ID: <CAAU8gNxtr=fNapaB0wh_4AySxbzF8JxLa46D1WdwzomA9rFnHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=75wBNG4H7UgFrSi7T7HkRmuFHsoD41Gk0eov8iQN8rw=;
        b=V091awYpAocIL3uE7cKkA1PtUTOvi6A98nwwCu+33hPhRvX01Vq8yrhJ7TdleCHtfG
         sAbcRHDYqWzmiJtN6GXMO1FXqVHiDoMyRCOfrSZuNkZK7KQ5DJ6BdMcER3m7zpy97mAo
         Wpaadm/2v+p15QK1q+/Sy8qNvlrgIgvkBmo/QVLl5jYbm2ApMGQiG59dN9ptgULVGF5t
         VshT6F6i9cNG9TiPo94DCtFR9XIZGXAM4p5FYkAoHpLNqm4z5ZTMA3SXsCDE/OXv41Yg
         uM5/uq29BQEF/sM23siVRbqPLWbgfdB5xRwbkaMkUG4PApVNPyBMG1aLAn+ISxHX8tbf
         lpKQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,


I recently discovered netfilter_queue, and have a question about
changing the packet size before accepting it. What happens when the
accepted packet is now too large and would require splitting?

I have tested the following situation. Computer A filters outgoing UDP
packets toward a given port and multiple by 10 their payload before
accepting them. An app sends a packet from A to computer B, which is
reachable through a LAN. The MTU of the corresponding ethernet devices
is 1500. I sent a packet with an initial payload of 200 bytes, which
is correctly multiplied by 10 by my filter callback, and gives a
single IP packet of more than 2000 bytes. On computer B, I see through
tcpdump that a single packet arrives, with an erroneous IP header
(total length is 1500, packet is marked as fragmented), but a correct
UDP header (length is 2008 bytes). The 2000 bytes of UDP payload are
correctly received by the socket on computer B. How would that happen?

I have seen the discussion about what may happen to a packet that is
larger (http://marc.info/?l=netfilter&m=133494380818412), is this the
case here?


Many thanks,
-- 
BRAMERET Pierre-Antoine
