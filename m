From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: iptables -L TABLE -n -v -d x.x.x.x --dport x -i ethx
Date: Sun, 30 Jun 2002 23:29:56 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GYK003EO4Q09O@l-daemon>
References: <200FAA488DE0D41194F10010B597610D2BA1BC@JUPITER>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA1BC@JUPITER>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from George Vieira <GeorgeV@citadelcomputer.com.au> on Mon, 01 Jul 2002 16:20:14 +1000


> problem is that sometimes the rule list can be a very long table and I'm
> using it in conjunction with MRTG to graph the byte values. So you can
> imagine how slow MRTG completes and how much CPU is used by continuous
> grepping can be..
> 
> At the moment I've written scripts in PHP to do what I need and works but
> netfilter should be able to redo their source and imitate the "-D INPUT"
> (example) routine to the "-L INPUT" command and instead of deleting the rule
> it (-L)ists it... can't be that hard.. though I'm not a C coder..

I like that idea, George. But then IANAC (I am not a coder), too.

jb

