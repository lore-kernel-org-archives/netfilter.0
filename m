From: Olivier Sessink <lists@olivier.pk.wau.nl>
Subject: Re: question about connection tracking tcp timeout values
Date: Thu, 08 Nov 2007 08:51:18 +0100
Message-ID: <4732BFF6.4080903@olivier.pk.wau.nl>
References: <1C795E2FCD154E46979DDDD5374B5ABE01B99B7B@TTMAIL2.teltone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1C795E2FCD154E46979DDDD5374B5ABE01B99B7B@TTMAIL2.teltone.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hal Moroff <hmoroff@teltone.com>, netfilter@vger.kernel.org

Hal Moroff wrote:

>   2. is there going to be a downside to me setting these to 1?

if packets arrive *after* that 1 second they are considered INVALID.

Olivier
