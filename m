From: Bernhard Rosenkraenzer <bero@arklinux.ch>
Subject: Re: Weird NAT problem
Date: Sun, 2 Nov 2008 00:52:19 +0100
Message-ID: <200811020052.19932.bero@arklinux.ch>
References: <200811012307.18305.bero@linux.cd> <490CDCC2.3070202@riverviewtech.net> <490CDDA9.90200@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490CDDA9.90200@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Saturday 01 November 2008 23:52:25 Grant Taylor wrote:
> The first thing that comes to mind is that you may be dealing with an
> MTU / MSS issue.  Some of your connections work and some never seem to
> start, which is a classic symptom of an MTU / MSS mis-match with the
> ICMP error being filtered out along the way.

Thanks!!!! That's exactly what it turned out to be.

It's working perfectly now.

Thanks again
Bernhard
