From: Rick Kennell <kennell@ecn.purdue.edu>
Subject: port-based filtering of IPsec packets?
Date: 23 Jul 2003 14:35:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058988918.6068.29.camel@insomnia.ecn.purdue.edu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I'm curious how I might do port-based filtering of IPsec packets with
iptables.  Presently, filtering IPsec-encrypted packets is an
all-or-nothing proposition because iptables can't look inside an ESP
section to get the port info.  It can only filter ESP packets based on
the SPI.  Actually, I'm not even sure how I'd get iptables to do
address-based filtering of IPsec packets.

Why would I want this?  Well, I might want to do opportunistic IPsec and
allow arbitrary parties to interact with my host, but I still want to
make sure that only selected services are made available.

I noticed that a similar thing was asked over on the FreeBSD side of the
world:

   http://www.bsdforums.org/forums/showthread.php?threadid=11725

Somehow, I don't expect the iptables solution to be quite so easy.

-- 
Rick Kennell <kennell@ecn.purdue.edu>
Purdue University Department of Electrical and Computer Engineering


