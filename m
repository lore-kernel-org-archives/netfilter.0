From: Claudio Scordino <claudio@evidence.eu.com>
Subject: In-kernel packet forwarding from one port to multiple ports
Date: Mon, 14 Mar 2016 10:23:12 +0100
Message-ID: <CAGWmfYoZ-0VEAMbnPokwuBqWuWVFZrDPo-8o+a1DW03WR3nSMQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evidence-eu-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:date:message-id:subject:from:to;
        bh=6JnDNhs70P/9wMQTcmGVMm27KVutLu3uNRsG4iQTLJA=;
        b=ZP/0rnVg2YVbI+8A3Oa+72RAHBrh5bpRUN5F6GdCSnWUN8I9I9+7/LDzTgL6juCfgW
         dtvRhfWWxVbeUnBGUZ5gIvIpasCL9WNdx0XJqE75RhWpc2ZmVTGrTQIBmY2guEMnTGMB
         lKtWtmAyAv/H7qEJ2NfqEyMWH7+tdQIvpDVJENFEgewGKGMpH2qsekvlx9P8MrOXe/FG
         jWn41T6jdvAEPFxPJocSDIanZ8enV+WON9lc11vTWdA9UwwvJhU3Z5o7CHqTZjIToEO0
         K8mUIiQbOGu6AntModDwbmf9bG3+crRfPxHrRWs+v4n3zecB9O4nthuVlj02dHSx/2Mr
         efcw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

on a Linux-based system I need data incoming on a TCP port to be
automatically redirected to other 50 local ports without going through
user-space's send/recv. Each port needs to receive a copy of all
incoming traffic. All ports are local to the same machine.

I've discarded the splice syscall due to the limit of one endpoint
being a file. I guess that iptables is the right tool for this
purpose, but I can't figure out the right syntax for this purpose.

Can you please me an advice about to set-up tjhe iptables rules ?

Many thanks and best regards,

             Claudio
