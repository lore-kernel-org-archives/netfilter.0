From: "Shpend Bakalli" <shbakalli@gmx.net>
Subject: REDIRECT to multiple ports
Date: Wed, 29 Sep 2004 22:38:59 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <00f501c4a664$592083a0$f90e0e0a@msojsi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a transparent squid proxy with 3 running squid processes in it =
(to make use of mltiprocessor architecture). Each have different ports.
I'm using REDIRECT to redirect packets comming with destination port 80 =
to ports 3127 - 3129 in the proxy server.
Although the distribution of the requests should be done in a =
round-robin fashion, it seems it is not done like that.
Any idea how kernel/iptables manages this kind of redirection? Is it a =
simple round-robin or there is some other method of distribution?

Kernel: 2.6.4-52-smp
Distribution: Suse 9.1

Regards,
Shpend Bakalli
