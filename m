From: cc <cc@belfordhk.com>
Subject: filtering by packet contents?
Date: Wed, 16 Jul 2003 12:47:21 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F14D8D9.2080500@belfordhk.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

I don't know if I'm getting confused, so if
someone can clarify whether I'm using the
wrong tool for the problem; but basically,
I have a webserver behind a firewall
(iptables 1.2.8) and the web access
packets are filtering in properly.

Is it possible to set iptables to
drop any packets depending on
the content?  The thing that
comes to mind is this CodeRed/
Nimda crap that comes in.  While
it doesn't affect my webserver
at all, I just don't like it
clogging up the dang log.

At this point of writing, I'm tending
towards the answer of "No, iptables
is not the right tool, nor can it
do that."  Is this correct?

Thanks for any clarification in
this matter.

Edmund


