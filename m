From: Jason Dixon <jasondixon@myrealbox.com>
Subject: State of Stateful Inspection
Date: 24 Oct 2002 16:06:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035489978.1558.27.camel@lappy.fuzzypenguin.net>
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

Hi all-

I'm about to become a migrated iptables user, but I had a couple of
questions about the stateful abilities of netfilter.  First, it appears
that true sequence number analysis is available via this "patch-o-matic"
thingy.  At what point does this feature become part of the default
release?

Also, does netfilter support any sort of sequence modulation to
strengthen the randomness of weak tcp implementations?

Thanks,
Jason




