From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Checksumming Issues
Date: Fri, 21 Nov 2003 14:42:32 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3021BD92B@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

I had to check my packet generator source code, because I thought the =
TCP header was calculated the same way you do. But when I checked the =
source you have to feed both the TCP and IP headers into the calculation =
to get a correct checksum. It uses some information from the IP header =
in the calculation (source and destination IP for example). So you don't =
actually use the entire IP header, just a part of it.=20

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, November 21, 2003 14:27
To: netfilter@lists.netfilter.org
Subject: Re: Checksumming Issues

On Friday 21 November 2003 8:15 pm, Leonid Veytser wrote:

> A general question about checksumming. If I change the destination =
address
> in the IP header, then of course I need to recalculate the IP header
> checksum.

"You" the user (or system administrator) do not need to recalculate any
checksums - the SNAT or DNAT code does this for you.

> But do I have to recalculate the checksum of the next protocol
> header (ie TCP, UDP, etc)?

No.   Everything is handled for you in the background.   Anyway, if you =
only
change the IP address (source and/or destination), the TCP or UDP =
checksum
remains valid.

Antony.

--

Feeling bad at breakfast because you don't have a hangover is evidence =
of a
complex emotional life it can take many years to perfect.

 - Pete McCarthy, The Road to McCarthy
                                                     Please reply to the =
list;
                                                           please don't =
CC me.

----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

