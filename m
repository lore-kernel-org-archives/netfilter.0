From: Joel <zealous@bonbon.net>
Subject: Ip accounting Help
Date: Wed, 23 Jun 2004 09:19:32 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087962571.2041.10.camel@joel.d2visp.com>
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

Hi all,

Currently I am working on Ip accounting in linux.
My system is Redhat 9.0 with iptables v1.2.7a
This redhat is doing Squid-Caching/ Nat/ Bandwidth management with tc/
Real ip forwarding.

I want to do Ip accounting of upload and download. I want to know how
much per ip bandwidth consumption is ? 

As i m doing source nat and Real ip forwarding, FORWARD chain will have
bytes counters. So FORWARD chain will give the correct figure of how
much the ip has used the bandwidth ???

I dont want to create new chain, I want to collect the data from
INPUT/OUTPUT/FORWARD chains if that are accurate.

Awaiting for help..
Excuse me for my English.

Joel n.solanki
Systems Administrator
D2V ISP PVT LTD.
(M) 91-9825500258



