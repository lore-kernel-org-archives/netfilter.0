From: Phillip.Watts@nlynx.com
Subject: Think I want to use libipq
Date: Tue, 3 Dec 2002 10:06:57 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86256C84.0058877E.00@nlynx.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



I want to write a filter in userspace.
Comparing dns lookups to a blacklist and possibly
other things.

Questions:

My strong impression is to use libipq and
target QUEUE.   Correct?

Netlink sockets is deprecated? or is libipq like a wrapper?

It seems that I need a current iptables to do this, but my 2.4.18 kernel
is fine, this is a little confusing.

My 2.4.18 kernel  .config doesn't seem to have CONFIG_IP_NF_QUEUE
and I can't seem to brute force it in.  Can't get ip_queue.o to build.  ??

Any one heard of a Python libipq module?  I've seen the Perl version
but I have Python on my very tiny router and don't want to add Perl.
If not I'll code in C.

Thanks



