From: Juan Hernandez <alucard@kanux.com>
Subject: [Fwd: [SA11980] Linux Kernel Netfilter TCP Option Matching Denial
 of Service Vulnerability]
Date: Thu, 01 Jul 2004 12:54:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E441B5.9000809@kanux.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020503010707080202090506"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------020503010707080202090506
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I thought you guys would be interested in this since I haven't read 
anything today in this mailing list

Juan

--------------020503010707080202090506
Content-Type: message/rfc822;
 name="[SA11980] Linux Kernel Netfilter TCP Option Matching Denial of Service Vulnerability"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="[SA11980] Linux Kernel Netfilter TCP Option Matching Denial of Service Vulnerability"

Return-Path: <nobody@secunia.com>
Delivered-To: hvjuan@kanux.com
Received: (qmail 10594 invoked from network); 1 Jul 2004 13:34:31 -0000
Received: from mail.secunia.com (213.150.41.240)
  by 192.168.74.2 with SMTP; 1 Jul 2004 13:34:31 -0000
Received: (qmail 4145 invoked from network); 1 Jul 2004 13:13:41 -0000
Received: from unknown (HELO secunia.com) (192.168.100.228)
  by mail.secunia.com with SMTP; 1 Jul 2004 13:13:41 -0000
Received: (from nobody@localhost)
	by secunia.com (8.12.10/8.12.10/Submit) id i61DHRf1020304;
	Thu, 1 Jul 2004 15:17:27 +0200
Date: Thu, 1 Jul 2004 15:17:27 +0200
Message-Id: <200407011317.i61DHRf1020304@secunia.com>
To: hvjuan@kanux.com
Subject: [SA11980] Linux Kernel Netfilter TCP Option Matching Denial of Service Vulnerability
From: Secunia Security Advisories <sec-adv@secunia.com>
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit


TITLE:
Linux Kernel Netfilter TCP Option Matching Denial of Service
Vulnerability

SECUNIA ADVISORY ID:
SA11980

VERIFY ADVISORY:
http://secunia.com/advisories/11980/

CRITICAL:
Moderately critical

IMPACT:
DoS

WHERE:
From remote

OPERATING SYSTEM:
Linux Kernel 2.6.x
http://secunia.com/product/2719/

DESCRIPTION:
Adam Osuchowski and Tomasz Dubinski have reported a vulnerability in
the Linux kernel, which can be exploited by malicious people to cause
a DoS (Denial of Service).

The vulnerability is caused due to the use of an incorrect variable
type within the "tcp_find_option()" function of the netfilter
subsystem. This can be exploited by sending a specially crafted TCP
packet, which causes the kernel to enter an infinite loop and consume
all available CPU resources.

Successful exploitation requires that iptables is used with rules
matching TCP options ("--tcp-option").

SOLUTION:
Don't use any rules matching TCP options.

PROVIDED AND/OR DISCOVERED BY:
Adam Osuchowski and Tomasz Dubinski

----------------------------------------------------------------------

About:
This Advisory was delivered by Secunia as a free service to help
everybody keeping their systems up to date against the latest
vulnerabilities.

Subscribe:
http://secunia.com/secunia_security_advisories/

Definitions: (Criticality, Where etc.)
http://secunia.com/about_secunia_advisories/


Please Note:
Secunia recommends that you verify all advisories you receive by
clicking the link.
Secunia NEVER sends attached files with advisories.
Secunia does not advise people to install third party patches, only
use those supplied by the vendor.

----------------------------------------------------------------------

Unsubscribe: Secunia Security Advisories
http://secunia.com/sec_adv_unsubscribe/?email=hvjuan@kanux.com

----------------------------------------------------------------------

--------------020503010707080202090506--


