From: "Spidal, Glen" <spidalg@hsd.k12.or.us>
Subject: Setting up 1:1 NAT for DMZ (Repost w/o HTML)
Date: Wed, 5 Jan 2005 10:28:12 -0800
Message-ID: <FC8AF9F27A8C6E4DAB2072FC162C421CFC2E58@HILLEX.HILLNET.ad.hsd.k12.or.us>
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
To: netfilter@lists.netfilter.org

Hello all,

I would like some advice on setting up 1:1 incoming and outgoing NAT for
a block of 13 public IP addresses.  I looked at the Patch-O-Matic NETMAP
command, but it appears it is for an entire subnet.  Currently the
addresses are the same for web and email traffic but that may change in
the future.

I looked at a sample script and have NATing working for my LAN but not
my DMZ.  Two of the public IPs would be for DNS servers.  I added eth0:1
but am unsure how to process that public IP from there on.

Glen Spidal
=20

