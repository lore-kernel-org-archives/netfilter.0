From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting Outbound Port to Internal Server
Date: Wed, 09 Jun 2010 19:17:56 -0500
Message-ID: <4C102F34.5050205@riverviewtech.net>
References: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com> 	<AANLkTimU5146nsWSNdDOVRT3bdxZJC1BwHPdTeb1h3K6@mail.gmail.com> 	<4C10067C.8000302@riverviewtech.net> <AANLkTin5R43Rq2dKG8UxTOQ0gelfJg7FjVZLeW_i49Im@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin5R43Rq2dKG8UxTOQ0gelfJg7FjVZLeW_i49Im@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Curby wrote:
> His later message suggests that the target machine is a web server 
> and not a proxy.  In that case, I wonder if tweaking DNS to have the 
> relevant requests point directly to the local machine would be 
> easier.

I don't know if it would be easier or not, but it probably would be 
better in the long run.

If there is a local DNS server, there are a number of options to do this.

> OTOH, he said that all outbound traffic on port 8080 should be sent 
> to the internal machine, which is odd if it's a simple web server 
> hosting a site or two.

Think a small business that is hosting their own web site on an internal 
server.  Public DNS will likely reflect the external IP and traffic 
would be port forwarded in to said server.

What the OP is wanting to do is commonly referred to at NAT loop back / 
wrap around.



Grant. . . .
