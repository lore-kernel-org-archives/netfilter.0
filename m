From: <linux@davidtrott.com>
Subject: Question about nth matching
Date: Thu, 15 May 2003 10:34:23 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053020063.3ec3cf9f493f6@www.mailshell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi,

I am using the nth patch to perform load balancing for outgoing traffic, sp=
ecifically these are packets that are generated on the firewall itself (not=
 forwarded traffic).

In order to do this I have used ip route 2 to set up two different routing =
tables, then I use netfilter to set the MARK so that alternate packets are =
sent to alternate links.

In order to do this I use the following rules:

iptables -t mangle -A OUTPUT -d 10.1.1.1 -j MARK --set-mark 1
iptables -t mangle -A OUTPUT -d 10.1.1.1 -m nth --every 2 -j MARK --set mar=
k 2

Using the above rules everything appears to be fine, however this style can=
 get messy if you have more than two links so I tried to use the following =
style:


iptables -t mangle -A OUTPUT -d 10.1.1.1 -m nth --every 2 --packet 0 -j MAR=
K --set-mark 1
iptables -t mangle -A OUTPUT -d 10.1.1.1 -m nth --every 2 --packet 1 -j MAR=
K --set-mark 2

This does not work (it appears that neither mark is set - although I am not=
 certain of this).

Can anyone point me in the right direction in order to get the second case =
working?

TIA,
David

Notes:
Kernel 2.4.20
Iptables 1.2.7a

Both the kernel and iptables have had a few patches applied although I don=
=92t think this is the cause of the problem.

I have read that sending alternate packets over different links is not alwa=
ys a good idea because it can lead to packets arriving at the destination h=
ost in the wrong order. I have been told that this is not a problem for Lin=
ux, but some other OS don=92t like it, so I have restricted the balancing r=
ules to a host that I know runs Linux.
This is the reason for the =96d 10.1.1.1 (on my firewall 10.1.1.1 is replac=
ed with the real IP).

