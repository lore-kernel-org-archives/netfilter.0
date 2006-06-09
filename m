From: Andi Kleen <ak@suse.de>
Subject: Re: Firewall question
Date: Fri, 9 Jun 2006 05:43:24 +0200
Message-ID: <200606090543.24401.ak@suse.de>
References: <20060608185712.79340.qmail@web50207.mail.yahoo.com> <20060608192628.GA561@csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20060608192628.GA561@csclub.uwaterloo.ca>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Cc: Alex Davis <alex14641@yahoo.com>, netfilter@lists.netfilter.org, netdev@vger.kernel.org


> Well the DSL modem only transfers whatever data the ISP end sends to it,
> which in your case is just PPP packets (LCC or LCP I think).  No one out
> on the internet 

No one out on the internet, but it would be trivial for someone outside
his house. All his traffic will be on a long unsecured cable. 

That is why I would never bridge home ethernet traffic onto a DSL line.

-Andi

