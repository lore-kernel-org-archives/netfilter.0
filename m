From: "Hal Moroff" <halm90@gmail.com>
Subject: need help with libiptc
Date: Wed, 21 Feb 2007 12:00:27 -0800
Message-ID: <e1663d820702211200m468fb6dr6ab79fcdac756922@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I'm writing an application that needs to dynamically add & remove iptables
rules at runtime.  I'm trying to use libiptc and finding it quite hard
to fathom.  I
can create/destroy chains, but there's no real documentation on
iptc_insert_entry.

I find it hard to believe that this isn't more commonly done.  Aren't there any
other apps out there that do this?

About the only doc I can find on libiptc is Leonardo Balliache's "Querying
libiptc HOWTO".  It's good, but far from complete.  In particular he says
little/nothing on how to construct the ipt_entry struct that you must pass to
iptc_insert_entry.  He extracts the structure definition from the
header file, but
there's much more to it than that.

Looking at the iptables.c source I can see that in order to insert an entry
the ipt_entry struct must contain a list of current targets, but I can't find
how to create that list.

Can anybody offer any help at all on dynamically adding rules to iptables
by calls into libiptc?  If there's a better / simpler way to do this I'm open to
that as well.

