From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: Bizarre NAT behavior
Date: Thu, 23 Jun 2011 17:28:21 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106231727550.21780@frira.zrqbmnf.qr>
References: <925A849792280C4E80C5461017A4B8A2A03FEB@mail733.InfraSupportEtc.com> <925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Scott <GregScott@Infrasupport.com>
Cc: netfilter@vger.kernel.org

On Thursday 2011-06-23 17:17, Greg Scott wrote:

>Wow, more than a week later and silence from everyone - am I on my own
>with this problem?  Why would NATing in both PREROUTING and POSTROUTING
>work  **only**  when I watch it with tcpdump and not work otherwise?
>Surely I can't be the only one seeing this problem?

Potential explanation: Packets being dropped inside the routing core due 
to violation of RP filter. [tcpdump hooks in very early and thus can 
still see stuff.]
