From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: ever block *outgoing* packets on your firewall?
Date: Sun, 16 Jan 2005 20:52:22 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0198E3@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: ASHISH <ashishis@gmail.com>, netfilter@lists.netfilter.org

And the confusion sets in...  If you are blocking UDP and TCP for things
that shouldn't leave your network then why would that have no effect?

For example, if you want to run a proxy only shop then you might right a
rule that says no port 80 out traffic is allowed except from host x
forcing clients to use the proxy.  Same holds true for socks, etc...

It's very practical and used in many places.  My full time job is
working for a major bank and that's exactly what we do.

Gary Wayne Smith

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of ASHISH
Sent: Sunday, January 16, 2005 8:26 PM
To: netfilter@lists.netfilter.org
Subject: Re: ever block *outgoing* packets on your firewall?

It will have no effect on tcp traffic, but it can be a real mess with
udp traffic.



