From: Curby <curby@cur.by>
Subject: Re: Redirecting Outbound Port to Internal Server
Date: Wed, 9 Jun 2010 16:43:55 -0600
Message-ID: <AANLkTin5R43Rq2dKG8UxTOQ0gelfJg7FjVZLeW_i49Im@mail.gmail.com>
References: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com> 
	<AANLkTimU5146nsWSNdDOVRT3bdxZJC1BwHPdTeb1h3K6@mail.gmail.com> 
	<4C10067C.8000302@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C10067C.8000302@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Wed, Jun 9, 2010 at 3:24 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> Now, I do ask the question, is it not possible to have your clients
> communicate directly with the proxy?

His later message suggests that the target machine is a web server and
not a proxy.  In that case, I wonder if tweaking DNS to have the
relevant requests point directly to the local machine would be easier.

OTOH, he said that all outbound traffic on port 8080 should be sent to
the internal machine, which is odd if it's a simple web server hosting
a site or two.

--Mike
