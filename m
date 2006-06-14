From: "Kilian" <kil@gnu.ch>
Subject: iptables & grsecurity: iptables not logging to syslog anymore
Date: Wed, 14 Jun 2006 09:53:32 +0200 (CEST)
Message-ID: <49984.193.246.253.20.1150271612.squirrel@fook.gnu.ch>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I have a problem with grsecurity 2.1.8 (kernel 2.6.14) and iptables
version 1.2.11: since installing the grsecurity patch and gradm, iptables
does not log to syslog anymore. Console logging still works and the
messages are present in the kernel ring buffer (dmesg), but the kernel
facility in syslog does not receive the messages from iptables specified
with --LOG target anymore, no matter what priority I specify.

Has anyone ever experienced something similar before? Where should I go
looking? I tweaked with kernel.printk, syslog.conf and the iptables LOG
statement, but I'm quite stuck right now... Thanks for any hint!

Sorry if this is OT here, but the grsecurity Mailing lists seems dead and
I didn't know where to turn to..

Greetings,
Kilian

