From: Curby <curby@cur.by>
Subject: Re: Redirecting Outbound Port to Internal Server
Date: Wed, 9 Jun 2010 15:16:07 -0600
Message-ID: <AANLkTimU5146nsWSNdDOVRT3bdxZJC1BwHPdTeb1h3K6@mail.gmail.com>
References: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Aaron Clausen <mightymartianca@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Jun 9, 2010 at 2:48 PM, Aaron Clausen <mightymartianca@gmail.co=
m> wrote:
> I'm trying to sort out a way to redirect all outgoing traffic destine=
d
> for port 8080 to an internal server. =A0I must be having some nasty
> brain fart because I just can't get it working.

Just to clarify, you have a router or gateway machine between the
Internet and an internal network, and all TCP connections from any
internal machine to port 8080 should be DNATed to a proxy-like
machine, also on the internal network?  If so, I think the problem is
that a single DNAT rule would cause the request to go through to the
internal proxy, but the proxy would send a reply back to the client,
which rejects it because it's expecting a reply from the router box.
Have you handled that issue?  Perhaps seeing your existing rules would
help too.  (I know this post isn't too helpful.  I'm just trying to
understand your setup and throw out a possible gotcha.)

--Mike
