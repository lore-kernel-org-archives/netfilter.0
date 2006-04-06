From: =?iso-8859-1?q?S=E9rgio_Gomes?= <sergiomdgomes@gmail.com>
Subject: Adding a routing header to IPv6 TCP packets
Date: Thu, 6 Apr 2006 14:28:10 +0100
Message-ID: <200604061428.10350.sergiomdgomes@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello everyone,

I have a machine running kernel 2.6, with an Apache webserver. It's connect=
ed=20
to a small test network that only uses IPv6. Now, what I'd like to do is ad=
d=20
the optional IPv6 Routing Header to all TCP packets being sent from Apache,=
=20
because I need to set up one compulsory hop the route must have.

Is this at all possible with netfilter/iptables, and if so, how do I do it?=
=20
The alternative, hacking the Apache source, is a bit intimidating...


Thanks,

S=E9rgio Gomes

