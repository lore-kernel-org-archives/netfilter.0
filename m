From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Simple Blackberry Enterprise configuration
Date: Wed, 17 Nov 2004 11:44:27 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56795B4@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Jason Opperisano <opie@817west.com>, mclinden@informed.net, netfilter@lists.netfilter.org

> as your "open, testing" policy.  source/destination IP restrictions
> can be added later as you get more comfortable with the configuration.

Just to throw in my two cents, there are two things key in dioagnosing
firewall ruleset failures.

1. tcpdump on both the inbound and outbound interfaces You will see
exactly what the result of the firewall configuration has on the network

2. Add 'logdrop' support. It goes like this: You specify DROP by default
in INPUT/FORWARD, but the very last rule in the INPUT/FORWARD chains is
to log the failure.=20

By running tcpdump and reading the logs, you can get a good
understanding of how a protocol works. It doesn't take too much linux
experience to get the gist of what's happening as long as you have some
networking background.

