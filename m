From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting Outbound Port to Internal Server
Date: Wed, 09 Jun 2010 16:24:12 -0500
Message-ID: <4C10067C.8000302@riverviewtech.net>
References: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com> <AANLkTimU5146nsWSNdDOVRT3bdxZJC1BwHPdTeb1h3K6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimU5146nsWSNdDOVRT3bdxZJC1BwHPdTeb1h3K6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/09/10 16:16, Curby wrote:
> I think the problem is that a single DNAT rule would cause the 
> request to go through to the internal proxy, but the proxy would send 
> a reply back to the client, which rejects it because it's expecting a 
> reply from the router box.

I agree.

If you want to do the redirection this way, you have to SNAT the traffic 
from the router to the proxy so that the proxy will reply to the router. 
  Then when the router receives the reply from the proxy, it will pass 
the reply on to the original client.

I have done this before and it works quite well.

Now, I do ask the question, is it not possible to have your clients 
communicate directly with the proxy?

I ask because what you want to do can be done and does work, but it 
causes all the traffic between clients and the proxy to pass through the 
router, thus making your router's NIC & CPU be a potential bottle neck 
that can (fairly easily) be avoided.



Grant. . . .
