From: mortar <slacklist@op.pl>
Subject: Re[2]: Question about marking traffic.
Date: Mon, 28 Jun 2004 22:50:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1499142519.20040628225033@op.pl>
References: <1987903676.20040628181707@op.pl>
 <200406281731.40331.Antony@Soft-Solutions.co.uk>
Reply-To: mortar <slacklist@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406281731.40331.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <netfilter@lists.netfilter.org>

Witam

Monday, June 28, 2004, 6:31:40 PM, you wrote:

AS> I believe unMARKed packets are the same as packets with MARK = 0

And you are right :) Thanks.

AS> Rules without targets will still happily count packets for you.

Once again, thanks. :)

I have one more question. Maybe someone can help.

What about tracking connections on non standard ftp ports (or http), for
example 2121? How can i recognize them as a ftp (or http) connections
and proper mark them? I read about layer7-filter project, but is it
necessery?



-- 
Pozdrawiam
 Marcin                            mailto:slacklist@op.pl


