From: "David Luyer" <david@luyer.net>
Subject: RE: Routing SMTP problem
Date: Fri, 14 Jun 2002 18:13:21 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000d01c2137b$5920c460$638317d2@pacific.net.au>
References: <200206140753.g5E7rEA26724@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206140753.g5E7rEA26724@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

> There is nothing you can do which would achieve this, because 
> packets to the ISDN address are going to get routed on the
> Internet to the small ISP, not to Telstra.   You cannot change
> that from your position on the end of either of the links.

Futhermore, you can't "own" any amount smaller than a /24 (256 IPs).

Anything smaller than that is part of the IP space "owned" by a
larger provider.  And even then a /24 may still be part of a
non-portable provider address block, and owned by the larger
provider.

(and to be even more pedantic, you can't ever "own" IPs - they're
not something which can be sold, owned, etc, due to the terms
under which they are offered.  APNIC "provides" IP addresses to
the Asia-Pacific Internet community.)

If you're dhcp'ing from Telstra, you're on a home service.  SMTP
(which requires a static IP) is something supported on a business
service.

Solution 1: buy a business service, for example a Pacific Internet
DSL service [shameless plug - can you guess where I work?] :-)

Solution 2: don't use SMTP.  use UUCP, POP, IMAP, some form of
e-mail outsourcing, etc.

David.


