From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Broken ftp through iptables
Date: Wed, 27 Aug 2003 00:05:36 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826160536.GF1956@propaganda.localdomain>
References: <3F4B7D1A.2010408@nucdc.org> <000a01c36be8$9b990f70$6901a8c0@Station13>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000a01c36be8$9b990f70$6901a8c0@Station13>
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

On Tue, Aug 26, 2003 at 11:42:02AM -0400, Landon Chelf spoke thusly:
>Thanks but it is loaded from what I can tell.  Below is the iptables
>stuff of an lsmod
>
>Module                  Size  Used by    Not tainted
>ip_conntrack_ftp        5296   0  (unused)
>ip_conntrack           26976   1  [ip_conntrack_ftp]
>iptable_filter          2412   1  (autoclean)
>ip_tables              15096   1  [iptable_filter]

You have a corresponding --state RELATED rule ?

(snip remaining)

