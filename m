From: Matthias Kattanek <mattes@mykmk.com>
Subject: 2 ISPs on firewall
Date: Tue, 2 Jul 2002 18:53:56 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0207021852410.20445-100000@e33.eng.roonetworks.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


There seems to be lots of question about multihomed firewall/routers.
I am in similiar situation. Having 2 ISP, where to provide services too.

I managed to forward traffic to e.g. a web server in the DMZ zone.
Main problem I encounter is that the response is always going out
via the DEFAULT gateway on the router.
(In my case one ISP doesn't like it and drops the response.)

I was under the impression that connection tracking of Netfilter keeps 
"track" which interface the traffic came in and anticipated it would go 
out the same route it came from.

What am I missing here?
What does it take to make it happen?
Do I just need additional rules for Netfilter?
Would something like "ip_conntrack_isp" work out? Understood such module
needs to be developed. Q just arises is that a way to go?

mattes


