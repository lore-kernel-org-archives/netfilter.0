From: "Peter Bi" <mod_perl@att.net>
Subject: Use netfilter to block DoS
Date: Sun, 27 Apr 2003 09:42:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005d01c30cdb$f6883a80$6401a8c0@oc.cox.net>
References: <E199mmm-0007tf-00@kashyyyk.netfilter.org>
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

Hi,

I have two questions related to Denial of Service:

1) If I want to set up a syn-flood protection, based on 1 per second (bursts
5), should I use

iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j DROP
or
iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT

The first one seems to drop those which EXCEED 1 per second
and the seocnd one seems to accept which is WITHIN 1 per second (so the
exceptions are dropped).
confused in logic :-(

2) where can I find more information on the use of Netfilter to DoS ?

Thanks.

Peter



