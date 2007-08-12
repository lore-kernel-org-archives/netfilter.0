From: fd4 <fd4@itsec4u.de>
Subject: Re: ip_conntrack growing indefinitely
Date: Sun, 12 Aug 2007 08:23:15 +0200
Message-ID: <20070812082315.7f7bad51@alice.thum.ath.cx>
References: <200708110801.l7B81Oj2025252@mail3.jubileegroup.co.uk>
	<Pine.LNX.4.58.0708111115530.25740@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0708111115530.25740@mail3.jubileegroup.co.uk>
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

Am Sat, 11 Aug 2007 11:19:08 +0100 (BST)
schrieb "G.W. Haywood" <ged@jubileegroup.co.uk>:

> I don't think it grows indefinitely.  The timeout is five days.

about 11 hrs in that case :-)
(of course I've reduced the standard value)

and I've said a similar case - just wondering, cleaned it with conntrack -F

the growing to more than 3300 entries has started by an unknown local event triggering conntrack on local connections; I could not find any reason in the logs or somehow else. happened within a minute or 2 from 2 local ports

