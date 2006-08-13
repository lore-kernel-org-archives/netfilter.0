From: Brian Lewis <bsl04@uark.edu>
Subject: port redirection
Date: Sat, 12 Aug 2006 19:18:19 -0500
Message-ID: <20060812191819.8d677f6c.bsl04@uark.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I run a servlet container that wants to listen on TCP 8080. I want to
redirect TCP 80 on my machine to 8080 on the same machine.

If I do -t nat -I PREROUTING -i $IF -d $IP -p tcp --dport 80 -j REDIRECT
--to-port 8080, it works in that I reach the 8080 server when I connect
to 80.

But I have to allow 8080 through. Is there a way to provide access to the
8080 server via port 80 without having to allow 8080?

Stating the problem a different way, suppose that for security through
obscurity purposes you wanted sshd to appear as if it was running on 2200
via firewall rules. The above method of redirecting 2200 -> 22 would work,
but not offer much help because 22 would still have to be open.

Thank you.

