From: "Michael A. Nunes" <p@pcmike.net>
Subject: Problems with IRC code
Date: Thu, 12 Dec 2002 10:10:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c2a1f0$ac9c1b90$02100e0a@jupiter>
Reply-To: "Michael A. Nunes" <p@pcmike.net>
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

Background: I currently do NOT build my kernel with any modules, as my linux
box is only used as a firewall/router.  I have no need to be able to
dynamically load/unload parts of the kernel.  Therefore, I build all
netfilter code directly into my kernel.

Problem: Up until 2.4.20 it has always been possible for me to hard-code
ports into ip_conntrack_irc.c and ip_nat_irc.c by simply adding the
following:

if (ports[0] == 0) {
                ports[0] = 4646;
                ports[1] = 5190;
                ports[2] = 5554;
                ports[3] = 6667;
                ports[4] = 6868;
                ports[5] = 7000;

in the respect parts of either file.  Like I said, this has ALWAYS worked up
until 2.4.20.  DCCs in/out on any ports in the above list would always work.
With 2.4.20 after adding the above the only thing that works is DCCs IN!
DCCs going out from a NAT'd box no longer make it through!

Question: What in the IRC code has changed so drastically that
I can no longer use the above method for "hard-coding" ports?

--
Michael A. Nunes
/p at pcmike dot net
http://pcmike.net/


