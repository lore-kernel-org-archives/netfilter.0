From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: nfconntrack and asymmetric routing
Date: Fri, 25 Apr 2008 22:33:21 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804252233120.20150@fbirervta.pbzchgretzou.qr>
References: <BAY103-DAV1263F9F3556A592C04C847B2E30@phx.gbl> <alpine.LNX.1.10.0804251934090.20150@fbirervta.pbzchgretzou.qr> <BAY103-DAV111F37548D4281FB84FF29B2DD0@phx.gbl> <alpine.LNX.1.10.0804252128260.20150@fbirervta.pbzchgretzou.qr>
 <48123272.6090804@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48123272.6090804@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Friday 2008-04-25 21:35, Grant Taylor wrote:

> On 4/25/2008 2:28 PM, Jan Engelhardt wrote:
>> -j NOTRACK.
>
> I believe this needs to be done in the RAW table before connection tracking
> hooks are called.

I was implying that - manpage says so.
