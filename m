From: "Thomas Sandquist" <tomslists@sandquisttech.net>
Subject: Ipt_random module questions
Date: Wed, 18 Oct 2006 18:42:27 -0700 (PDT)
Message-ID: <2025.209.160.56.254.1161222147.squirrel@www.toms-games.com>
Reply-To: tomslists@sandquisttech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello,

I'm trying to find out if the ipt_random module can be compiled in to the
2.6 kernels? A few years ago (back in the day of kernel 2.4) I patched and
compiled this module in to the kernel and used it in a load balancing
script (shotgunning cable modems). I'm interested in doing this with a new
box running FC5 (currently kernel 2.6.18) but have found very little
information on it. I finally figured out how to get POM again (I think I
got the right version anyways... it's now POM-NG however the release date
was in 2004) and found the random source there but the info note says it
only works on kernels below 2.6.0. Do I just have too old of a version of
the POM package or is the random module really only available in the 2.4
kernel? If it's not available in the 2.6 kernel are their any alternative
modules that I should be looking in to (perhaps the nth module although I
haven't really read up on it yet)? Any help would be appreciated. It was
great shotgunning cable modems with this setup a few years ago and it
would be even cooler if I could get this working on a more modern distro
(I am open to other distro's other than Fedora if someone knows of one
that might be better for my routing purposes).

Thanks,
Thomas Sandquist




