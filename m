From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: Getting Closer But Still Having Problems
Date: Fri, 29 Nov 2002 10:15:39 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211291013500.21610-100000@ts1.alberni.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Alright, I managed to get the patched 2.4.19 kernel *and* iptables 1.2.7a
binaries and libraries to compile cleanly.  Now I've got one last problem (I
hope).  When I run "make install all", everything compiles fine, but it
won't overwrite the old iptables binaries and libraries.  I suppose I have
to remove these manually, so can somebody tell me where to look?

-- 
Aaron Clausen


