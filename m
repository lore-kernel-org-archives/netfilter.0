From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: String
Date: Wed, 30 Jun 2004 22:57:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406302257.48060.Antony@Soft-Solutions.co.uk>
References: <1088624701.19430.17.camel@localhost>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088624701.19430.17.camel@localhost>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 30 June 2004 8:45 pm, David Cary Hart wrote:

> The string module seems like a great idea to filter some of the httpd
> attacks.

It may seem like a great idea, but it has limitations which (IMHO) mean it's 
just not worth using (for this sort of task).

The two major limitations are:

1. It will only match on a string which is completely contained within one 
packet - therefore a string "GET /index.html" which has the "GET " at the end 
of one packet, and the "/index.html" at the start of the next will not be 
matched.

2. The string match works on literal text characters, and therefore will not 
match anything at all for a gzip-compressed HTTP stream (quite commonly 
encountered with modern servers).

> In the alternative is there something else that might do similar filtering?

Yes, Squid, Dan's Guardian - something which truly understands HTTP, rather 
than just TCP/IP.

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


