From: Martin Robb <MartinRobb@ieee.org>
Subject: no chain/target/match for LOG module even though the shared library
 exists
Date: Mon, 23 Sep 2002 10:22:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8F23C3.6050009@ieee.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Greetings,

I'm running iptables on a 2.4.14 lsm kernel on what was, originally at 
least, a RHL 7.1 system.  When I try using the LOG feature, e.g.:
    iptables -A INPUT -j LOG
I get the error:
   No chain/target/match by that name.

I apologize if this problem has already been dealt with on the list, but 
I couldn't find it in the FAQ and the list archives don't appear to be 
searchable.

I've tried the same syntax on a Debian system (2.4.18 kernel) and it 
accepts it fine, so it doesn't look like a syntax problem.  I have 
upgraded iptables to 1.2.6a on the 2.4.14 kernel, which is the same 
iptables version running on the Debian system (BTW, there appear to be 
some header file discrepencies when I tried to compile 1.2.7a against 
the 2.4.14 kernel).  I have even tried applying all cleanly patching 
patch-o-matic patches and still get the problem.

The /lib/iptables/libipt_LOG.so library exists (root root 755) and 
besides, if I give it a bogus module name like:
    iptables -A INPUT -j foobar
I get a totally different error:
    ... /lib/iptables/libipt_foobar.so: cannot open shared object file ...

I'm stumped.  Can anyone tell me what I need to do to get logging 
working on this system?

Thanks,
Martin Robb
MartinRobb@ieee.org



