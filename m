From: Atilla <theatilla@gmail.com>
Subject: Weird behaviour when compiling iptables
Date: Mon, 24 Jan 2005 15:07:31 +0200
Message-ID: <b53c932d0501240507143cd370@mail.gmail.com>
Reply-To: Atilla <theatilla@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, I hope I'm posting my question in the correct place. 

Here is the issue - I'm using  the "Core Linux" distribution on an old
PC to aplly some traffic shaping on my ADSL connection. I had no
problems compiling Iptables in the begining and all works for now.

Now - where the problems start. I wanted to try to see how the Layer-7
classifier performs (http://l7-filter.sourceforge.net), so i got the
patches, applied them and tried if it compiles. The kernel worked with
no problem, i compiled it and replaced the old one. However iptables
did not - i type "make KERNEL_DIR=/correct/path/to/patched kernel" and
it just stays there. Nothing happens - no messages no nothing.

So i mailed the guyz, asking for advice and it turned out i can't
compile iptables again whatsoever. I deleted the source file, unpacked
again and tried just "make" - with the default kernel path -  wich is
to unpatched 2.4 files. Same effect - nothing happens , no mesages no
nothing. Compiling it, still without the Layer 7 patch, but with the
2.6.9 kernel dir - same effect.


So I wonder what I did mess up.. I honestly don't remember with wich
kernel I compiled iptables in the first place, but it should have been
with 2.6.9, because it all works without any problems. (Core comes
with 2.4.something by default, but i replaced it almost immediately so
i don't think i compiled anything before switching to 2.6.9).

If you have any ideas how to fix this, please let me know. Thanks. 

-- 
Atilla

