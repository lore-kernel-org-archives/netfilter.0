From: "Frischknecht Peter" <peter@empoweringsolutions.com>
Subject: Kernel: NET: messages suppressed (I am sure it has been covered before)
Date: Thu, 23 Oct 2003 09:34:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F41DBB59549A54482D4FC25AEEDCBE11FB2B4@MAIL-06VS.atlarge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I need to know WHAT MESSAGE WAS SUPPRESSED.

I am getting slammed.  My server will display anywhere from a few
hundred to 50K messages suppressed.

Previous posters have suggested that if I go early enough in my logs,
that I will find the original suppressed message.
NOT TRUE.

I am desperate.  These messages are an indication of a larger problem,
but I am unable to diagnose what.
My network is fairly small (650 nodes), and I have been receiving these
messages time and again.  Sometimes every 3 hours, sometimes every 3
days. =20

Network analizers (Ntop, iptraf) have been unable to identify the source
of the traffic.  If I run these utilities on the server, they freeze
(while a flood is going on).  If I run the utilities on a different
computer on a port of the switch, they don't see the traffic intended
for the server (obviously).  If I configure the switch for a "monitor"
port (one that sees all traffic) and plug a different computer on that
port, then that computer freezes too, along with the server.

The few times that we cought a machine WHILE it was generating the
traffic, we could not find any evidence of wrongdoing.  No viruses, no
trojan horses, no smoking gun.  The ONLY mechanism that stops the
traffic is blocking ARPs at the switch.  But I feel that ARP is another
symptom, not the actual problem (like an ICMP flood).

The switches used are 12x HP J4121A (Procurve 4000M) and one HP5308XL
(fiber cross-connect).

Once the Linux router gets slammed, it is a matter of time before it
freezes and dies.

ANY help would be appreciated.

Here is a sample:
****
[root@ess-uvce root]# grep "kernel: NET" /var/log/messages;
Oct 21 15:34:00 ess-uvce kernel: NET: 205 messages suppressed.
Oct 21 15:34:05 ess-uvce kernel: NET: 33484 messages suppressed.
Oct 21 15:34:10 ess-uvce kernel: NET: 33264 messages suppressed.
Oct 21 15:34:15 ess-uvce kernel: NET: 31204 messages suppressed.
Oct 21 15:34:20 ess-uvce kernel: NET: 33229 messages suppressed.
Oct 21 15:34:25 ess-uvce kernel: NET: 30596 messages suppressed.
Oct 21 15:34:30 ess-uvce kernel: NET: 33175 messages suppressed.
Oct 21 15:34:35 ess-uvce kernel: NET: 31174 messages suppressed.
Oct 21 15:34:40 ess-uvce kernel: NET: 33076 messages suppressed.
Oct 21 15:34:45 ess-uvce kernel: NET: 30534 messages suppressed.
Oct 21 15:34:50 ess-uvce kernel: NET: 32551 messages suppressed.
Oct 21 15:34:55 ess-uvce kernel: NET: 31169 messages suppressed.
Oct 21 15:35:00 ess-uvce kernel: NET: 33317 messages suppressed.
Oct 21 15:35:05 ess-uvce kernel: NET: 31162 messages suppressed.
Oct 22 01:09:44 ess-uvce kernel: NET: 26196 messages suppressed.
Oct 22 06:35:33 ess-uvce kernel: NET: 35332 messages suppressed.
Oct 22 06:35:38 ess-uvce kernel: NET: 35040 messages suppressed.
Oct 22 06:35:43 ess-uvce kernel: NET: 27654 messages suppressed.
Oct 22 06:35:48 ess-uvce kernel: NET: 27208 messages suppressed.
Oct 22 06:35:53 ess-uvce kernel: NET: 33073 messages suppressed.
Oct 22 06:35:58 ess-uvce kernel: NET: 36642 messages suppressed.
Oct 22 06:36:03 ess-uvce kernel: NET: 28798 messages suppressed.
Oct 22 06:36:08 ess-uvce kernel: NET: 21928 messages suppressed.
Oct 22 06:36:13 ess-uvce kernel: NET: 25631 messages suppressed.
Oct 22 06:36:18 ess-uvce kernel: NET: 30442 messages suppressed.
Oct 22 06:36:23 ess-uvce kernel: NET: 30225 messages suppressed.
Oct 22 06:36:28 ess-uvce kernel: NET: 28005 messages suppressed.
Oct 22 06:36:33 ess-uvce kernel: NET: 21884 messages suppressed.
Oct 22 06:36:38 ess-uvce kernel: NET: 23300 messages suppressed.
Oct 22 06:36:43 ess-uvce kernel: NET: 30853 messages suppressed.
Oct 22 06:36:48 ess-uvce kernel: NET: 27821 messages suppressed.
Oct 22 06:36:53 ess-uvce kernel: NET: 29570 messages suppressed.
Oct 22 06:36:58 ess-uvce kernel: NET: 22651 messages suppressed.
Oct 22 06:37:03 ess-uvce kernel: NET: 28761 messages suppressed.
Oct 22 06:37:08 ess-uvce kernel: NET: 32997 messages suppressed.
Oct 22 06:37:13 ess-uvce kernel: NET: 31389 messages suppressed.
Oct 22 06:37:18 ess-uvce kernel: NET: 24475 messages suppressed.
Oct 22 06:37:23 ess-uvce kernel: NET: 30712 messages suppressed.
Oct 22 06:37:28 ess-uvce kernel: NET: 34532 messages suppressed.
Oct 22 06:37:33 ess-uvce kernel: NET: 29573 messages suppressed.
Oct 22 06:37:38 ess-uvce kernel: NET: 25571 messages suppressed.
Oct 22 06:37:43 ess-uvce kernel: NET: 26330 messages suppressed.
Oct 22 06:37:48 ess-uvce kernel: NET: 30778 messages suppressed.
********

