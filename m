From: Gaston Martres <gmartres@tech-it.com.ar>
Subject: dstlimit or hashlimit?
Date: Fri, 04 Nov 2005 13:52:27 -0300
Message-ID: <436B91CB.6010602@tech-it.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all.

    I was wondering if the dstlimit has been renamed as hashlimit (as I 
have read in a forum, if I don't remember bad)??
Since every time I want to -m dstlimit a problem loading the module 
occurs. But if I try to load a -m hashlimit, the load of module 
completes, but another error appears, but I can't post it right now.
on the hash limit, just for testing I typed:
iptables -A INPUT -m hashlimit --hashlimit 50 --hashlimit-mode dstip 
--hashlimit-name somename -j LOG
wich then, returns an error.

Any idea if I have to use it by dstlimit or as hashlimit?
I tryed compiling iptables with with no shared libs, etc, with no luck 
on the dstlimit module.
Every other module, or at least the most common, of course, works 
without a problem.

I hope someone could help.

Thanks.

-- 



