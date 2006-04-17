From: BTP <smokefat@gmail.com>
Subject: iptables, eth0, snort, ARP packets problem
Date: Sun, 16 Apr 2006 23:05:16 -0300
Message-ID: <42ad30bb0604161905m2d8450c3p941f5e8c93550ada@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I have this strange problem that I can't figure out, and I'm not an
expert in this area yet so I was wondering if someone could shed some
light on this for me.

I am hooked up to a cable modem, whose activity light is always
flashing and turns out to be sending my directly hooked up laptop ARP
packets, averaging 11Kb/s (who-has xxx.xxx.xxx.xxx tell
xxx.xxx.xxx.xxx) - whether connected or not.

In Windows XP Pro when I run snort, I can log this incoming stream all
the time. On my Linux system, it is possible to also receive this
stream (and snort logs it into the database for me as "BAD-TRAFFIC" -
loopback) or not to receive this stream, depending on the _order_ in
which I invoke snort, eth0 (the only interface), and iptables.

[start snort]
[ifup eth0]
[invoke iptables firewall rules] **

** As soon as I invoke iptables, snort begins to record all this
traffic as alerts into my database.

[ifup eth0]
[start snort]
[invoke iptables firewall rules]

The preceding order of commands does NOT make snort log all this
traffic log to the database.

After my hard drive is going crazy filling up the database, it does
not matter if I play around with bringing up/down my interface eth0 or
changing the rules in iptables (I just set all Policies to accept, as
I don't know how to unload the whole program modules from memory).

However, running 'ifconfig' will display as my eth0 and lo interfaces
to be constantly receiving approximately 11Kb/s. Sometimes if eth0 is
down, lo receives all the traffic. Sometimes they both do, and
sometimes just eth0. I have been experimenting for a while, but
dealing with three variables and constantly rebooting to notice
changes is time consuming.

Why am I getting this constant flow of ARP packets? but more
importantly, what is the order in which iptables and snort see
traffic?? They're both hooked up to the same interface and I'm just
using iptables as a firewall. I believe snort does not rely on
iptables/netfilter's behaviour in order to see traffic unless snort is
running with the 'inline' option, which isn't the case here.

Although, I am confused. Is there something I should know about how
snort and iptables behave in relation to eachother and the order of
bring up the interface??


Thanks

Bart

