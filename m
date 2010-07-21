From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IPTables physdev and bond0
Date: Wed, 21 Jul 2010 16:35:46 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007211634450.10280@obet.zrqbmnf.qr>
References: <AANLkTikwcBaQpSsedZBLFWfsGK6Gsj-KJ7u46dAZ2G8_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikwcBaQpSsedZBLFWfsGK6Gsj-KJ7u46dAZ2G8_@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Kingston <list@nexusnebula.net>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-07-21 16:32, Benjamin Kingston wrote:

>I have a bond0 interface with eth0 and eth1, which is then bridged under br0.
>
>Packets will not forward to a br0 connected VM with

As usual you will have to provide full output from `ip addr`, `ip route 
show table all` and `brctl showstp br0`.
