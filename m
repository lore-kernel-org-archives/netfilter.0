From: "Diego Sarasua" <debian@sarasuasys.com.ar>
Subject: Re: PPTP/GRE NAT patch for 2.4.20 kernel
Date: Thu, 13 Feb 2003 11:12:56 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00dc01c2d36a$03414b00$6400a8c0@diego>
References: <Pine.LNX.4.44.0302130334350.17214-100000@lucy.troja.mff.cuni.cz> <20030213092522.GE28593@sunbeam.de.gnumonks.org>
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
To: Petr Vagera <pvg@lucy.troja.mff.cuni.cz>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>

try http://roeder.goe.net/~koepi/newnat.html
it works for me
the modules to load and work :
modprobe ip_nat_pptp
modprobe ip_nat_proto_gre




