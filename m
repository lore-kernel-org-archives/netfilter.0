From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Checksumming Issues
Date: Fri, 21 Nov 2003 15:00:07 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3021BD935@houxchsvr.ucscorp.ucs.pvt>
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
To: netfilter@lists.netfilter.org

www.netfor2.com/tcpsum.htm

That is the first website I found. I'm sure if you look some more you =
could probably find about 500 more. If you do not follow those =
instructions, you will get bad checksum returns. Just because it is an =
OSI layer higher does not mean it can't include data from lower down the =
chain.=20

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, November 21, 2003 14:48
To: netfilter@lists.netfilter.org
Subject: Re: Checksumming Issues

On Friday 21 November 2003 8:42 pm, Hildebrand, Brian wrote:

> I had to check my packet generator source code, because I thought the =
TCP
> header was calculated the same way you do. But when I checked the =
source
> you have to feed both the TCP and IP headers into the calculation to =
get a
> correct checksum. It uses some information from the IP header in the
> calculation (source and destination IP for example). So you don't =
actually
> use the entire IP header, just a part of it.

It is not possible that the TCP checksum depends on IP information.

TCP is layer 4 of the OSI model; IP is layer 3.   The IP checksum =
includes
the TCP contents, but not the other way around.

Antony.

--

There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly
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

