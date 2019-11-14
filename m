From: Psyspy rambo <psyspy2020@gmail.com>
Subject: Netfilter hook doesn't see all packets
Date: Thu, 14 Nov 2019 13:23:46 -0700
Message-ID: <CAFqmWq_+GgO3uiu6omDxiUPiiV5OcJ9d6A--RHC3-jZCy_sV0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=wTDjomLJK5uY2zjl0g9QDNLEPciuOa25LkPIsDbxcZY=;
        b=Pe8LlmC78L91Bq98N5G4rUd7/JitP0LLIMbngTWbfha8XFB4wHRM9X2IQCSSVYKrO2
         CYgBJeKEPxRetcSxsOzbvusEHvSoAf2grcmYI+BDF669ZGk7xQhrNqFw99+1JxUeZO0W
         rrAMF4dVcsLFENtY5MD0U9iq6OPUQAyWGH2p8jHZ8aOGtygUEGsbWBLwrlQHHNCx+/SP
         MA66WS/bR/2S4R+f6g1yqZw3d20l/NmA+ZZuz/Qi7UseynBftlVkBjVkuxzUNND5E7k7
         UvkBnJVUHBG+cgDkVvUul/rptOIEVsNyIMkWV0zToXVu+BKdGg+Gn3NvyMnDVIrGek+J
         JuCQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I implemented a kernel module that hooks into netfilter PREROUTING
hook and tries to log multicast dns packet tuple. If I add a iptables
log rule for mdns (port 5353), it logs all mdns packets. Verified that
it matches tcpdump output. However, the netfilter hook sees only a few
packets. Any ideas why? Thanks in advance.
