From: Curby <curby@cur.by>
Subject: Re: match many protocol in a rule
Date: Thu, 17 Jun 2010 20:06:01 -0600
Message-ID: <AANLkTinQfTvUhhbwcutlXNql0gzpi1jDJjjkRVLCU0f_@mail.gmail.com>
References: <AANLkTinVb4YBnyfJJN6JFA4U9TDDonG2Drmtz-yjMIOV@mail.gmail.com> 
	<AANLkTilErsiq8IUBxUUUq-EhS6KUQUEs6KNHKVD4UPCH@mail.gmail.com> 
	<4C1AD332.90603@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C1AD332.90603@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, Jun 17, 2010 at 8:00 PM, Grant Taylor <gtaylor@riverviewtech.ne=
t> wrote:
> I also thought about matching the protocols and jumping to a sub-chai=
n.
> =A0However that won't work the way you want it to b/c (last I checked=
) you
> have to specify a protocol to be able to specify a port. =A0So, you m=
ight as
> well match both the protocol and the port on the same rule.

Yeah I wasn't clear on that.  You would definitely need to match ports
before jumping, but the idea is that the custom chain could apply a
complex series of actions, e.g. updating a recent match, logging, etc.
 It really depends on what the overarching goal is.  The basic goal of
specifying "allow tcp+udp port 53" in a single rule doesn't seem
possible though.

--Mike
