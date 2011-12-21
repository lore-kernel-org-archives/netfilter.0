From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Filtering on bridges
Date: Wed, 21 Dec 2011 19:36:40 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EF1E3B0.6080200@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Hill <steve@opendium.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-12-21 14:48, Steve Hill wrote:

> On 21/12/11 13:30, Jan Engelhardt wrote:
>
>> Mark the packets leaving on brX with iptables, then use ebtables to check
>> for the physical interface plus the mark.
>
>At mark-time I wouldn't actually know where the packet is going, so wouldn't
>know what criteria to mark based on...

Yes you do know where it is going; the route is set on FORWARD/OUTPUT 
(see nf-packet-flow.svg), therefore, you can mark, and as for the bridge 
phys interface, it too will be set at one point, at which time you can 
check the mark.
