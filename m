From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: Broken ftp through iptables
Date: Tue, 26 Aug 2003 13:18:53 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <036701c36bed$bdf3ab70$49caa8c0@caris.priv>
References: <3F4B7D1A.2010408@nucdc.org> <000a01c36be8$9b990f70$6901a8c0@Station13> <20030826160536.GF1956@propaganda.localdomain>
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
To: kluivert@tm.net.my, netfilter@lists.netfilter.org

Read this page.  It will explaine why I have what I do.  ( well actually it
just explaines how the connections in ftp work ...  but from that you should
be able to determine what the problem is :)

http://slacksite.com/other/ftp.html


----- Original Message -----
From: "Julian Gomez" <kluivert@tm.net.my>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 26, 2003 1:05 PM
Subject: Re: Broken ftp through iptables


> On Tue, Aug 26, 2003 at 11:42:02AM -0400, Landon Chelf spoke thusly:
> >Thanks but it is loaded from what I can tell.  Below is the iptables
> >stuff of an lsmod
> >
> >Module                  Size  Used by    Not tainted
> >ip_conntrack_ftp        5296   0  (unused)
> >ip_conntrack           26976   1  [ip_conntrack_ftp]
> >iptable_filter          2412   1  (autoclean)
> >ip_tables              15096   1  [iptable_filter]
>
> You have a corresponding --state RELATED rule ?
>
> (snip remaining)
>


