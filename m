From: cc <cc@kdtc.net>
Subject: protocol specification
Date: Tue, 16 Sep 2003 12:07:00 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F668C64.6060500@kdtc.net>
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi,

Can someone clarify whether I've made a mistake or
mis understood the tutorial?  I'm using the latest
iptables (1.2.8 I believe) on a Linux 2.4.22 machine.

In the tutorial, it says -p tcp,udp is permitted;
but the manpage states nothing of the sort(but
implies that it can't be done that way).

In the past, I've been using two lines for both
tcp and udp settings.  I just decided to re-read
on the tutorial and noticed that I could use
the tcp,udp (or udp,tcp) way.  Saves space.

But it doesn't work.  I googled and came up with
an archived message stating that there is indeed
an error, but that was two years ago.

If it is indeed true that I can't specify protocols
like that, is there a patch that can allow me to
do this?

Thanks for the clarification.




