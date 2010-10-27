From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: ipv6 tproxy / transparent proxy support?
Date: Wed, 27 Oct 2010 18:56:09 +1300
Message-ID: <4CC7BEF9.6010906@treenet.co.nz>
References: <4CC71459.5020809@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC71459.5020809@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: netfilter@vger.kernel.org

On 27/10/10 06:48, Tomasz Chmielewski wrote:
> What is the state of tproxy / transparent proxying (i.e. with Squid)
> with ipv6?

The state?

  * kernel - pending release
  * iptables - patches queued for audit.
  * squid - supported in 3.1 production releases.

I've just updated the squid wiki tproxy4 page with details and links to 
the bits you need as of today.

AYJ
