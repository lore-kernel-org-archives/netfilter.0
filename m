From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: nfconntrack and asymmetric routing
Date: Fri, 25 Apr 2008 14:35:14 -0500
Message-ID: <48123272.6090804@riverviewtech.net>
References: <BAY103-DAV1263F9F3556A592C04C847B2E30@phx.gbl> <alpine.LNX.1.10.0804251934090.20150@fbirervta.pbzchgretzou.qr> <BAY103-DAV111F37548D4281FB84FF29B2DD0@phx.gbl> <alpine.LNX.1.10.0804252128260.20150@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804252128260.20150@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/25/2008 2:28 PM, Jan Engelhardt wrote:
> -j NOTRACK.

I believe this needs to be done in the RAW table before connection 
tracking hooks are called.



Grant. . . .
