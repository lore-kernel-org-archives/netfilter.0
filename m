From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: H/A
Date: Mon, 26 May 2003 17:59:09 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030526095909.GC1568@floyd>
References: <27597.200.48.226.214.1053917112.squirrel@www.netfids.com>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <27597.200.48.226.214.1053917112.squirrel@www.netfids.com>
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

On Sun, May 25, 2003 at 09:45:12PM -0500, g_netfilter@netfids.com spoke thusly:

>Hi friends, I have some boxes running iptables and i works well. But now I
>need to configure a failover solution, please could you give me some links
>to start reading? I need to consider Netfilter/Iptables and FreeSwan in
>the same box and with a failover configuration.

A few things you need to clarify :

	a) What are the failover criteria ? Does the other box need to
	   maintain full state, or can you accept that all connections will
	   die for the moment, and can be re-established with the new
	   master server ?

           If state is required, iptables2 should contain failover
	   capability according to some previous posts by Harald. There was
	   some experimental work being done by someone, in regards to
	   exporting the entries out (you'll have to check the archives for
	   details). I'm not sure how you'll get freeswan to play nice
	   though.

	b) If you merely want dumb failover, then google around for VRRP.
	   But understand the drawbacks in each circumstance.

