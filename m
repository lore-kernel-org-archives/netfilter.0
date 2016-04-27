From: Luigi Rizzo <rizzo@iet.unipi.it>
Subject: Re: Build firewall with millions pps support
Date: Wed, 27 Apr 2016 15:12:38 +0200
Message-ID: <20160427131238.GA65273@onelab2.iet.unipi.it>
References: <CAPgF-foyqY7_UbQVK7R4vU5MRP0XsfgXAjpQUNwNROZVq9YxDQ@mail.gmail.com>
 <20160427063952.GA55161@onelab2.iet.unipi.it>
 <B4F13F97-5E5F-4ED3-8DC7-6213641E3D4A@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B4F13F97-5E5F-4ED3-8DC7-6213641E3D4A@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Satish Patel <satish.txt@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Apr 27, 2016 at 08:57:36AM -0400, Satish Patel wrote:
> It looks good I will sure look at it. Just curious why we need dummynet I think it use for traffic shapping right? Just trying to understand how ipfw and dummynet will boost pps? 

You don't need to _use_ dummynet, they just happen to come together.

If you only need to implement a firewall then your ipfw rules
will only contain pass/drop actions.

The performance boost comes from using netmap,  thus bypassing the
native network stack and -- if available -- using optimized network
drivers.

cheers
luigi
