From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: RV: optimizations for large rule sets
Date: Fri, 7 Mar 2008 08:33:53 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0803070825040.8681@mail3.jubileegroup.co.uk>
References: <384944.49147.qm@web26503.mail.ukl.yahoo.com>
 <47D066F2.4040008@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47D066F2.4040008@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi there,

On 3/6/2008 10:06 AM, Alberto D=EDez wrote:

> What is the netfilter preferred way to have a large set of rules and
> still do packet filtering?

I don't know if there's a "netfilter preferred way" and I don't know
what you mean by "a large set of rules".

Our iptables rules typically number about 200.  We use ipsets for
about 40,000 rules in about 30 sets, on fairly modest hardware.

People seem to run into performance issues with anything on the order
of a thousand iptables rules - obviously it will depend on the rules
and how they interact, and on the hardware, the processor load, etc.

--

73,
Ged.
