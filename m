From: Dave Sparks <Dave.Sparks@Sophos.com>
Subject: final packet not natted, rfc1918 address sent to internet
Date: Wed, 24 Nov 2010 00:56:29 -0500
Message-ID: <B7A55E8C969B974FBC89274E565B8B2D02012CCA83@US-COL-EXCHMBX1.green.sophos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sophos.com; h=from:to:date:subject:message-id:content-type:content-transfer-encoding:mime-version; s=global; bh=RsYzN2Y52z21DANgn5eUsA/g10rpB64dQkbKR1+Ntds=; b=drOIGPCQkz35swHS8gmNziytcxpnYhimACAwAlCej+4MFj1RLXc4NLYI7Ad9/anp7B37Tof+Ek6Qs/3vcknqoRpKYdqXoRXFio0H49EnG9PgpRBGRqyK8/PB05r49lKBhdwsOHiX2+XUNMa/stpgA2qSfhmF6qzBl2/HRpJqRcA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hi all,

I noticed a problem that happens on all our firewalls (various 2.6 and Shorewall version) where sometimes the final packet in a conversation will not be natted.  What happens is the src IP is not rewritten, and the rfc1918 src address is sent to the internet.  

I've pasted a tcpdump from the firewall below (sorry I had to elide the IPs).  I have used "tcpdump -i any" so packets both in and out of the firewall are shown.  The important packet is the very last one.  It didn't get its src IP rewritten, and was emitted on the internet eth with a rfc1918 src IP.

Is this a known problem?  I've not had much luck finding anyone with a similar problem.

Thanks,

ds

firewall # tcpdump -ni any host DESTIP
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 68 bytes
05:36:02.129183 IP RFC1918SRC.47467 > DESTIP.80: S 101178816:101178816(0) win 5840 <mss 1460,[|tcp]>
05:36:02.129211 IP FIREWALLIP.47467 > DESTIP.80: S 101178816:101178816(0) win 5840 <mss 1460,[|tcp]>
05:36:02.301942 IP DESTIP.80 > FIREWALLIP.47467: S 1413837871:1413837871(0) ack 101178817 win 5792 <mss 1460,[|tcp]>
05:36:02.301963 IP DESTIP.80 > RFC1918SRC.47467: S 1413837871:1413837871(0) ack 101178817 win 5792 <mss 1460,[|tcp]>
05:36:02.302275 IP RFC1918SRC.47467 > DESTIP.80: . ack 1 win 92 <nop,nop,timestamp[|tcp]>
05:36:02.302291 IP FIREWALLIP.47467 > DESTIP.80: . ack 1 win 92 <nop,nop,timestamp[|tcp]>
05:36:02.302518 IP RFC1918SRC.47467 > DESTIP.80: P 1:118(117) ack 1 win 92 <nop,nop,timestamp[|tcp]>
05:36:02.302533 IP FIREWALLIP.47467 > DESTIP.80: P 1:118(117) ack 1 win 92 <nop,nop,timestamp[|tcp]>
05:36:02.476946 IP DESTIP.80 > FIREWALLIP.47467: . ack 118 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.476962 IP DESTIP.80 > RFC1918SRC.47467: . ack 118 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.477267 IP DESTIP.80 > FIREWALLIP.47467: P 1:549(548) ack 118 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.477282 IP DESTIP.80 > RFC1918SRC.47467: P 1:549(548) ack 118 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.477547 IP RFC1918SRC.47467 > DESTIP.80: . ack 549 win 109 <nop,nop,timestamp[|tcp]>
05:36:02.477563 IP FIREWALLIP.47467 > DESTIP.80: . ack 549 win 109 <nop,nop,timestamp[|tcp]>
05:36:02.714063 IP RFC1918SRC.47467 > DESTIP.80: P 118:236(118) ack 549 win 109 <nop,nop,timestamp[|tcp]>
05:36:02.714078 IP FIREWALLIP.47467 > DESTIP.80: P 118:236(118) ack 549 win 109 <nop,nop,timestamp[|tcp]>
05:36:02.892157 IP DESTIP.80 > FIREWALLIP.47467: P 549:1462(913) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.892173 IP DESTIP.80 > RFC1918SRC.47467: P 549:1462(913) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.892541 IP RFC1918SRC.47467 > DESTIP.80: . ack 1462 win 137 <nop,nop,timestamp[|tcp]>
05:36:02.892557 IP FIREWALLIP.47467 > DESTIP.80: . ack 1462 win 137 <nop,nop,timestamp[|tcp]>
05:36:02.893580 IP DESTIP.80 > FIREWALLIP.47467: . 1462:2910(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.893595 IP DESTIP.80 > RFC1918SRC.47467: . 1462:2910(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:02.894022 IP RFC1918SRC.47467 > DESTIP.80: . ack 2910 win 183 <nop,nop,timestamp[|tcp]>
05:36:02.894037 IP FIREWALLIP.47467 > DESTIP.80: . ack 2910 win 183 <nop,nop,timestamp[|tcp]>
05:36:03.067531 IP DESTIP.80 > FIREWALLIP.47467: . 2910:4358(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.067546 IP DESTIP.80 > RFC1918SRC.47467: . 2910:4358(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.067930 IP RFC1918SRC.47467 > DESTIP.80: . ack 4358 win 228 <nop,nop,timestamp[|tcp]>
05:36:03.067945 IP FIREWALLIP.47467 > DESTIP.80: . ack 4358 win 228 <nop,nop,timestamp[|tcp]>
05:36:03.069436 IP DESTIP.80 > FIREWALLIP.47467: . 4358:5806(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.069451 IP DESTIP.80 > RFC1918SRC.47467: . 4358:5806(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.069803 IP RFC1918SRC.47467 > DESTIP.80: . ack 5806 win 273 <nop,nop,timestamp[|tcp]>
05:36:03.069818 IP FIREWALLIP.47467 > DESTIP.80: . ack 5806 win 273 <nop,nop,timestamp[|tcp]>
05:36:03.071351 IP DESTIP.80 > FIREWALLIP.47467: . 5806:7254(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.071367 IP DESTIP.80 > RFC1918SRC.47467: . 5806:7254(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.071717 IP RFC1918SRC.47467 > DESTIP.80: . ack 7254 win 318 <nop,nop,timestamp[|tcp]>
05:36:03.071732 IP FIREWALLIP.47467 > DESTIP.80: . ack 7254 win 318 <nop,nop,timestamp[|tcp]>
05:36:03.073267 IP DESTIP.80 > FIREWALLIP.47467: . 7254:8702(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.073282 IP DESTIP.80 > RFC1918SRC.47467: . 7254:8702(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.073754 IP RFC1918SRC.47467 > DESTIP.80: . ack 8702 win 364 <nop,nop,timestamp[|tcp]>
05:36:03.073769 IP FIREWALLIP.47467 > DESTIP.80: . ack 8702 win 364 <nop,nop,timestamp[|tcp]>
05:36:03.242968 IP DESTIP.80 > FIREWALLIP.47467: . 8702:10150(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.242983 IP DESTIP.80 > RFC1918SRC.47467: . 8702:10150(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.243279 IP RFC1918SRC.47467 > DESTIP.80: . ack 10150 win 409 <nop,nop,timestamp[|tcp]>
05:36:03.243293 IP FIREWALLIP.47467 > DESTIP.80: . ack 10150 win 409 <nop,nop,timestamp[|tcp]>
05:36:03.244963 IP DESTIP.80 > FIREWALLIP.47467: P 10150:11598(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.244978 IP DESTIP.80 > RFC1918SRC.47467: P 10150:11598(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.245264 IP RFC1918SRC.47467 > DESTIP.80: . ack 11598 win 454 <nop,nop,timestamp[|tcp]>
05:36:03.245279 IP FIREWALLIP.47467 > DESTIP.80: . ack 11598 win 454 <nop,nop,timestamp[|tcp]>
05:36:03.246831 IP DESTIP.80 > FIREWALLIP.47467: . 11598:13046(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.246847 IP DESTIP.80 > RFC1918SRC.47467: . 11598:13046(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.247306 IP RFC1918SRC.47467 > DESTIP.80: . ack 13046 win 499 <nop,nop,timestamp[|tcp]>
05:36:03.247322 IP FIREWALLIP.47467 > DESTIP.80: . ack 13046 win 499 <nop,nop,timestamp[|tcp]>
05:36:03.248749 IP DESTIP.80 > FIREWALLIP.47467: P 13046:14494(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.248765 IP DESTIP.80 > RFC1918SRC.47467: P 13046:14494(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.249013 IP RFC1918SRC.47467 > DESTIP.80: . ack 14494 win 545 <nop,nop,timestamp[|tcp]>
05:36:03.249028 IP FIREWALLIP.47467 > DESTIP.80: . ack 14494 win 545 <nop,nop,timestamp[|tcp]>
05:36:03.250664 IP DESTIP.80 > FIREWALLIP.47467: . 14494:15942(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.250679 IP DESTIP.80 > RFC1918SRC.47467: . 14494:15942(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.251045 IP RFC1918SRC.47467 > DESTIP.80: . ack 15942 win 590 <nop,nop,timestamp[|tcp]>
05:36:03.251060 IP FIREWALLIP.47467 > DESTIP.80: . ack 15942 win 590 <nop,nop,timestamp[|tcp]>
05:36:03.252527 IP DESTIP.80 > FIREWALLIP.47467: . 15942:17390(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.252541 IP DESTIP.80 > RFC1918SRC.47467: . 15942:17390(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.252964 IP RFC1918SRC.47467 > DESTIP.80: . ack 17390 win 635 <nop,nop,timestamp[|tcp]>
05:36:03.252979 IP FIREWALLIP.47467 > DESTIP.80: . ack 17390 win 635 <nop,nop,timestamp[|tcp]>
05:36:03.254510 IP DESTIP.80 > FIREWALLIP.47467: . 17390:18838(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.254526 IP DESTIP.80 > RFC1918SRC.47467: . 17390:18838(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.254820 IP RFC1918SRC.47467 > DESTIP.80: . ack 18838 win 680 <nop,nop,timestamp[|tcp]>
05:36:03.254835 IP FIREWALLIP.47467 > DESTIP.80: . ack 18838 win 680 <nop,nop,timestamp[|tcp]>
05:36:03.256407 IP DESTIP.80 > FIREWALLIP.47467: . 18838:20286(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.256422 IP DESTIP.80 > RFC1918SRC.47467: . 18838:20286(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.256689 IP RFC1918SRC.47467 > DESTIP.80: . ack 20286 win 726 <nop,nop,timestamp[|tcp]>
05:36:03.256704 IP FIREWALLIP.47467 > DESTIP.80: . ack 20286 win 726 <nop,nop,timestamp[|tcp]>
05:36:03.258321 IP DESTIP.80 > FIREWALLIP.47467: . 20286:21734(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.258337 IP DESTIP.80 > RFC1918SRC.47467: . 20286:21734(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.258689 IP RFC1918SRC.47467 > DESTIP.80: . ack 21734 win 771 <nop,nop,timestamp[|tcp]>
05:36:03.258705 IP FIREWALLIP.47467 > DESTIP.80: . ack 21734 win 771 <nop,nop,timestamp[|tcp]>
05:36:03.260278 IP DESTIP.80 > FIREWALLIP.47467: . 21734:23182(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.260293 IP DESTIP.80 > RFC1918SRC.47467: . 21734:23182(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.260574 IP RFC1918SRC.47467 > DESTIP.80: . ack 23182 win 816 <nop,nop,timestamp[|tcp]>
05:36:03.260589 IP FIREWALLIP.47467 > DESTIP.80: . ack 23182 win 816 <nop,nop,timestamp[|tcp]>
05:36:03.262189 IP DESTIP.80 > FIREWALLIP.47467: . 23182:24630(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.262204 IP DESTIP.80 > RFC1918SRC.47467: . 23182:24630(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.262475 IP RFC1918SRC.47467 > DESTIP.80: . ack 24630 win 861 <nop,nop,timestamp[|tcp]>
05:36:03.262490 IP FIREWALLIP.47467 > DESTIP.80: . ack 24630 win 861 <nop,nop,timestamp[|tcp]>
05:36:03.263479 IP DESTIP.80 > FIREWALLIP.47467: FP 26078:26195(117) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.263495 IP DESTIP.80 > RFC1918SRC.47467: FP 26078:26195(117) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.263733 IP RFC1918SRC.47467 > DESTIP.80: . ack 24630 win 861 <nop,nop,timestamp[|tcp]>
05:36:03.263749 IP FIREWALLIP.47467 > DESTIP.80: . ack 24630 win 861 <nop,nop,timestamp[|tcp]>
05:36:03.264328 IP DESTIP.80 > FIREWALLIP.47467: . 24630:26078(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.264343 IP DESTIP.80 > RFC1918SRC.47467: . 24630:26078(1448) ack 236 win 46 <nop,nop,timestamp[|tcp]>
05:36:03.264626 IP RFC1918SRC.47467 > DESTIP.80: . ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:03.264641 IP FIREWALLIP.47467 > DESTIP.80: . ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:03.264855 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:03.264871 IP FIREWALLIP.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:03.754107 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:03.754122 IP FIREWALLIP.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:04.738164 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:04.738183 IP FIREWALLIP.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:06.706349 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:06.706365 IP FIREWALLIP.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:10.642586 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:10.642602 IP FIREWALLIP.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:18.515195 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:18.515210 IP FIREWALLIP.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:34.260169 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:36:34.260185 IP FIREWALLIP.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:37:05.750287 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
05:37:05.750311 IP RFC1918SRC.47467 > DESTIP.80: F 236:236(0) ack 26196 win 907 <nop,nop,timestamp[|tcp]>
Shoud be FIREWALLIP^^^^^^^^^^
