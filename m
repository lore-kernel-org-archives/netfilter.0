From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: iptables -L TABLE -n -v -d x.x.x.x --dport x -i ethx
Date: Mon, 1 Jul 2002 16:20:14 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1BC@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

problem is that sometimes the rule list can be a very long table and I'm
using it in conjunction with MRTG to graph the byte values. So you can
imagine how slow MRTG completes and how much CPU is used by continuous
grepping can be..

At the moment I've written scripts in PHP to do what I need and works but
netfilter should be able to redo their source and imitate the "-D INPUT"
(example) routine to the "-L INPUT" command and instead of deleting the rule
it (-L)ists it... can't be that hard.. though I'm not a C coder..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Jack Bowling 

I would just try the tried and true grep:

iptables -L TABLE -n -v | grep "-d x.x.x.x --dport x -i ethx"

jb

