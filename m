From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Question about marking traffic.
Date: Wed, 30 Jun 2004 21:09:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406302109.52503.Antony@Soft-Solutions.co.uk>
References: <1987903676.20040628181707@op.pl> <200406282204.57874.Antony@Soft-Solutions.co.uk> <40E1368E.4040207@esi.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E1368E.4040207@esi.it>
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

On Tuesday 29 June 2004 10:29 am, Marco Colombo wrote:

> Antony Stone wrote:
> >
> > Netfilter works at OSI layers 3 & 4, therefore it can't identify what is
> > HTTP / FTP / DNS etc - it can only guess.
>
> Not completely true, IMHO. conntrack modules look well above the TCP level
> (OSI levels make little sense for the TCP/IP protocol suite, they simply
> don't fit perfectly) otherwise they won't work. ip_conntrack_ftp does look
> at the FTP protocol, and is able to recognise incoming (data) connections
> as RELATED to the control one.

I agree with what you say, however the connection tracking helper modules such 
as ip_conntrack_ftp look at such specific and restricted parts of the 
application layer data that I wouldn't say they "work at that layer" in the 
same sense that a proper proxy system does, for example.

> But I don't know how to use such knowledge
> to detect FTP running on non-stardard ports, particularly in matching a
> rule.

Indeed, because that's not what netfilter's knowledge of the application layer 
is for.   There is also a "string" match within netfilter, which does look 
(completely generically) inside the payload of the packet, however it has 
sufficient restrictions and caveats regarding its effective use that again I 
would no consider this to mean that netfilter effectively "works" at the 
application layer.

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


