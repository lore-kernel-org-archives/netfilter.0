From: "Paul Gibson" <paul.gibson@subspace.net.au>
Subject: Query....  redirecting traffic
Date: Fri, 13 Dec 2002 20:02:00 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008401c2a286$4cd80ca0$0501a8c0@gndn.subspace.au.com>
References: <000601c2a23f$619ffef0$0100a8c0@zultys.com>
Reply-To: <paul.gibson@subspace.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000601c2a23f$619ffef0$0100a8c0@zultys.com>
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

Hello,

	I am wondering if netfilter can do the following.....

http connection comes in on 10.10.10.10 port 80, can iptables then redirect
this to go to 192.168.1.1 port 12345 & also allow the returning data to go
back the opposite way ???

We are currently using "redir" to do it and are having some porblems with it
due to an application we run.

TIA

Paul.


