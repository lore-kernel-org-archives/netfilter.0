From: David Vogt <beunlovable@gmail.com>
Subject: [libipq] Packet Fragmentation?
Date: Wed, 15 Feb 2006 12:37:25 +0100
Message-ID: <859616420602150337i530a8c39s@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Dear All,

I modify packets with libipq, spcifically some additional data is
added. Yet, I haven't found any documentation what happens when an ip
packet gets too big and needs to be fragmented. Does libipq take care
of this? Or do I have to split the packet manually?


David

