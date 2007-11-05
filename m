From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Packet gets SNAT without reaching POSTROUTING
Date: Mon, 05 Nov 2007 08:34:29 +0100
Message-ID: <472EC785.2010406@rtij.nl>
References: <200711050024.21381.netfilter_20071105.nsp@27b-6.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200711050024.21381.netfilter_20071105.nsp@27b-6.de>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Magnus Schmidt <netfilter_20071105.nsp@27b-6.de>
Cc: netfilter@vger.kernel.org

Magnus Schmidt wrote:
> I am aware that there are still hundreds of other rules active in FORWARD or 
> INPUT (for filter). However the mangle-filter and the nat-filter are exactly 
> as shown below. How can a packet traverse mangle-POSTROUTING, but not reach 
> nat-POSTROUTING ?
>
>   


Only the first packet is seen there, once a nat-mapping is established, 
the nat tables are skipped for the rest of the packets.

HTH,
M4

