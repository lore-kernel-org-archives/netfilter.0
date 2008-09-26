From: Philip Craig <philipc@snapgear.com>
Subject: Re: ULOG/NFLOG on a non-forwarding machine
Date: Fri, 26 Sep 2008 10:43:34 +1000
Message-ID: <48DC3036.1010103@snapgear.com>
References: <m38wtjur74.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m38wtjur74.fsf@ursa.amorsen.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Benny Amorsen <benny+usenet@amorsen.dk>
Cc: netfilter@vger.kernel.org

Benny Amorsen wrote:
> Is there a way to catch incoming traffic which is neither INPUT nor
> FORWARD with netfilter?

Have you tried PREROUTING?

