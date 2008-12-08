From: Patrick McHardy <kaber@trash.net>
Subject: Re: IPv4 traffic in 802.2 LLC SNAP frames queued to netfilter ...
Date: Mon, 08 Dec 2008 16:30:04 +0100
Message-ID: <493D3D7C.8010404@trash.net>
References: <217983a50812072021k6f184240l23c7c7f80a5b3220@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <217983a50812072021k6f184240l23c7c7f80a5b3220@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonothan Kane <jonothan.kane@gmail.com>
Cc: netfilter@vger.kernel.org

Jonothan Kane wrote:
> Hey all;
> 
> I've got 2 devices connected through a transparent bridge.
> One of the devices uses the old Ethernet frame format as
> datalink transport the other uses the common Ethernet II
> format.  The Ethernet II formated frames are being
> received by the netfilter connection tracking, while the
> old style frames are not.
> 
> Is this normal ?
> 
> Are old style Ethernet frames just not sent to the netfilter
> connection tracking system?
> 
> Thanks for any help or information.

Linux doesn't handle IP in SNAP and the bridge netfilter code
also doesn't.
