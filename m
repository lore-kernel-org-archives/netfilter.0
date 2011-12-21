From: Steve Hill <steve@opendium.com>
Subject: Re: Filtering on bridges
Date: Wed, 21 Dec 2011 13:48:32 +0000
Message-ID: <4EF1E3B0.6080200@opendium.com>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 21/12/11 13:30, Jan Engelhardt wrote:

> Mark the packets leaving on brX with iptables, then use ebtables to check
> for the physical interface plus the mark.

At mark-time I wouldn't actually know where the packet is going, so 
wouldn't know what criteria to mark based on...

-- 

  - Steve Hill
    Technical Director
    Opendium Limited     http://www.opendium.com

Direct contacts:
    Instant messager: xmpp:steve@opendium.com
    Email:            steve@opendium.com
    Phone:            sip:steve@opendium.com

Sales / enquiries contacts:
    Email:            sales@opendium.com
    Phone:            +44-844-9791439 / sip:sales@opendium.com

Support contacts:
    Email:            support@opendium.com
    Phone:            +44-844-4844916 / sip:support@opendium.com
