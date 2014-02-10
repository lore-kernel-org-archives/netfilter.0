From: Phil Oester <kernel@linuxace.com>
Subject: Re: PREROUTING in nat table isn't working as aspected
Date: Mon, 10 Feb 2014 07:48:34 -0800
Message-ID: <20140210154834.GA6570@home>
References: <F57C6B5920056B48955ABFCF0A95493603BDAA42@mail-01.trends.nl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <F57C6B5920056B48955ABFCF0A95493603BDAA42@mail-01.trends.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theo Belder <T.Belder@trends.nl>
Cc: netfilter@vger.kernel.org

On Mon, Feb 10, 2014 at 01:52:42PM +0100, Theo Belder wrote:
> ... So the redirect table
> works for new connections. But for continuous existing traffic the
> PREROUTING rule isn't working...

Exactly as expected.

> Do you have tips for redirecting traffic for an active traffic flood??

Clear the traffic from conntrack table by using the conntrack tool?  Then
the next packet which arrives WILL go through your PREROUTING rules.

Phil
