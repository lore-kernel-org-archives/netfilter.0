From: Mario =?ISO-8859-1?Q?H=FClsegge?= <huelsegge@gmx.de>
Subject: Re: Port-based routing with OpenVPN
Date: Wed, 26 Sep 2007 00:14:39 +0200
Message-ID: <1190758479.13546.8.camel@laptop>
References: <20070915231545.224150@gmx.net>
	 <46ED0DE4.1040300@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46ED0DE4.1040300@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Am Sonntag, den 16.09.2007, 13:05 +0200 schrieb Pascal Hambourg:

> 
> > the problem is that it does not work. tcpdump gives me:
> > 
> > 00:28:00.461045 IP (tos 0x0, ttl  64, id 28447, offset 0, flags [DF], 
> > proto: UDP (17), length: 71) 192.168.0.125.1049 > vroot.domain: [udp sum 
> > ok]  62654+ PTR? 67.11.71.195.in-addr.arpa. (43)
> > 00:28:00.515190 IP (tos 0x0, ttl  56, id 0, offset 0, flags [DF], proto: 
> > UDP (17), length: 127) vroot.domain > 192.168.0.125.1049:  62654 NXDomain 
> > q: PTR? 67.11.71.195.in-addr.arpa. 0/1/0 ns: 71.195.in-addr.arpa. (99)
> > 00:28:01.459744 arp who-has 195.71.11.67 tell 192.168.0.125
> > 00:28:02.459844 arp who-has 195.71.11.67 tell 192.168.0.125
> 
> Was this trace captured on interface tun0 ?
 i am sorry, i confused the tcpdump output with another test on a normal
eth device, this is the capture on tun0:

23:47:54.378123 IP 192.168.0.125.3794 > ha-42.web.de.www: S
471744113:471744113(
0) win 5840 <mss 1460,sackOK,timestamp 7974928 0,nop,wscale 3>
23:47:57.377790 IP 192.168.0.125.3794 > ha-42.web.de.www: S
471744113:471744113(
0) win 5840 <mss 1460,sackOK,timestamp 7975678 0,nop,wscale 3>
23:48:03.378327 IP 192.168.0.125.3794 > ha-42.web.de.www: S
471744113:471744113(
0) win 5840 <mss 1460,sackOK,timestamp 7977178 0,nop,wscale 3>
23:48:15.379418 IP 192.168.0.125.3794 > ha-42.web.de.www: S
471744113:471744113(
0) win 5840 <mss 1460,sackOK,timestamp 7980178 0,nop,wscale 3>

the answer seems to be blocked in some way.. suggestions?

