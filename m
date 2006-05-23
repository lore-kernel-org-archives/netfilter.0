From: "Paul Fleischer" <paul.fleischer@gmail.com>
Subject: Matching IPv6 packets by the flowlabel
Date: Tue, 23 May 2006 17:18:03 +0200
Message-ID: <ab2fc2a60605230818ya53d9fbm56f76a077eeb089e@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I am currently writing my master thesis about a particular IPv6 QoS
signalling protocol. One of my goals is to present a prototype
implementation of the protocol on Linux. For this I need to be able to
match IPv6 packets based on their flowlabel. This is currently mainly
to maintain statistics on how many bytes have been transferred per
flow, but might be used for  other things as well.
Is it possible with ip6tables to match packets based on their flowlabel?

Also, if anyone has a better idea how to collect statistics on a per
flow basis, please let me know :-)

Hope someone can help me.

Cheers,
Paul Fleischer

