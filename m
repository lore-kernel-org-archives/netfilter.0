From: "James B. Hiller" <jhiller@visi.net>
Subject: How effective is firewall script in IP-Masquerade-HOWTO?
Date: Fri, 26 Nov 2004 03:32:52 -0500 (EST)
Message-ID: <200411260832.iAQ8WqS7002287@bassett.home.org>
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

Hi.

Been watching the list for months now, and reading various resources, but
I still have in no way mastered the general topic of iptables.

Wonder if anyone would comment on the effectiveness of the
"stronger" firewall script given in the linux IP-Masquerade-HOWTO,
especially since it's written around 2.4.X kernels, and I'm running
2.6.0 on my firewall box.  In all the traffic I've seen, I've never
encountered anyone asking questions related to that script, which seems
a little odd since I would think that many iptables users would use it,
at least as a starting point.  I have not repeated the script here in order
to keep noise off the list, but I certainly can if it would be wanted.

My environment is fairly simple.  I have a machine dedicated to being
the wireless access point, router, and firewall for three other machines
networked to it (wirelessly).  The dedicated WAP also is the interface
point for my cable modem.

My setup is straightforward.  Upon booting the WAP box, my rc.local script
brings up the various network interfaces, and then runs the script from
the IP-Masquerade-HOWTO.  All seems to work well.  Run I use the
Shield's Up utility on www.grc.com, it reports that I am in complete
stealth mode, and my basic testing has shown that I can't (apparently) do
anything to get from the outside in to my private LAN.

Since I just recently went to cable from dial-up, I wanted to ask the
experts on this list if I'm as secure from outside abuse as these results
lead me to think I am.  I also wonder if there is any significant weakness
that I should counter that would stem from the fact that I'm using the
script with 2.6.0 - and whether there would be any further negative
impact from going up to a more recent 2.6.X kernel, though the script
isn't changing.  In my present 2.6.0 kernel, I have just about every
netfilter option available turned on (save one or two).

For now, I have no requirements to make any of the machines on the
LAN visible to the outside world.  I realize that if I ever want to
open up telnet or a web server, for instance, that I'll have to learn
a lot more and start fiddling with the firewall script.

Thx for any comments or insights!

jbh

