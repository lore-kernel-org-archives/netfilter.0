From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Checksumming Issues
Date: Fri, 21 Nov 2003 15:31:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3021BD945@houxchsvr.ucscorp.ucs.pvt>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

I didn't mean for that to sound as bad as it did. As I had said in the =
first e-mail I made the same mistake you did originally. I sent Leonid =
an e-mail directly (nasty habit of hitting the reply instead of reply =
all button) and was wrong when I said it. But then I remembered I had =
some issues calculating the checksum and went to look at my source to =
jog my memory and saw that my memory was wrong as well. I was going to =
let it stand at that, but I didn't want incorrect information left on =
the list after your initial reply. No hard feelings either way I hope. =
Who are we to question the wisdom of the designers of TCP? :)=20

On topic to Leonid, you can calculate the TCP checksum using the =
algorithm on that website I posted a minute ago. I'm surprised you =
actually calculated the IP checksum, normally the stack does that =
automatically before it goes out (if it wasn't in your case I would like =
to hear specifics of what you are doing for my own interest).=20

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, November 21, 2003 15:14
To: netfilter@lists.netfilter.org
Subject: Re: Checksumming Issues

On Friday 21 November 2003 9:00 pm, Hildebrand, Brian wrote:

> www.netfor2.com/tcpsum.htm
>
> That is the first website I found. I'm sure if you look some more you =
could
> probably find about 500 more. If you do not follow those instructions, =
you
> will get bad checksum returns. Just because it is an OSI layer higher =
does
> not mean it can't include data from lower down the chain.

You are right.   The TCP checksum contains a "notional IP header" which =
is
included in the calculation.

Today is not a good day for me :(   It must be somebody else's birthday.

Antony.

--

I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams
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

