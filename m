From: Doug Johnson <doug.johnson@vifanusa.com>
Subject: RE: Packet Sniffing
Date: Tue, 15 Apr 2003 13:20:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1AEB768E2548D611869F000255478B0A3550C3@NTUSA2>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'Patrick Ahler' <patrick@vikus.com>, netfilter EMAIL <netfilter@lists.netfilter.org>

In that scenario it is best use use a proxy server (such as Squid) and find
one of many analysis tools http://www.squid-cache.org/Scripts/ to do the
reporting for you. You can even use a redirector to block porn from
precompiled db's. Such redirectors can be found at
http://www.squid-cache.org/related-software.html . And the neat thing is
that some of the analysys tools are setup with the redirectors listed such
as squidGuard and Sarg. They are fairly east to setup.

Good Luck Patrick.
Doug

-----Original Message-----
From: Patrick Ahler [mailto:patrick@vikus.com]
Sent: Tuesday, April 15, 2003 1:05 PM
To: netfilter EMAIL
Subject: RE: Packet Sniffing


Know of any good packet sniffer's? tcp dump with Ethereal is great, but is
it possible to set up reports from that? I need software that will be able
to print a report of who was looking at what web pages... and then be able
to print out weekly reports for each employee or "IP waster" as I call them
=). The boss is tired of employees lookin at porn during work =).

Thanks,
Patrick



