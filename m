From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: More neqbie questions
Date: Mon, 2 Aug 2004 21:02:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408022102.19083.Antony@Soft-Solutions.co.uk>
References: <410E7DFB.9000505@mail.co.gilchrist.fl.us> <200408022003.54833.Antony@Soft-Solutions.co.uk> <410E9AFD.90500@mail.co.gilchrist.fl.us>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410E9AFD.90500@mail.co.gilchrist.fl.us>
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

On Monday 02 August 2004 8:50 pm, Eric Ellis wrote:

> Antony Stone wrote:
> >
> > My recommendation is to put a LOG rule at the end of each chain, just
> > before the default DROP policy takes effect, and you'll see what packets
> > are getting that far and then being lost.

> Now here's something interesting that I discovered when you mentioned
> it...
>
> It appears that all of my HTTP packets are making it through the chains
> without being picked up by my redirect rule.  The same appears to be
> happening with mail.  I put the LOG at the end of the 3 filter tables,
> In, Out, and FWD, so assuming that it's line by line filtering (eg, runs
> until a rule catches it), my packet is making it throught the chains
> without being caught.  Any suggesstions on what could cause that?

Yes.   You have no FORWARD rule allowing packets to TCP port 80 (well, you do, 
but it's commented out...).

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


