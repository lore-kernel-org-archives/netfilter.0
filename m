From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: redirecting
Date: Thu, 1 Jul 2004 16:46:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407011646.14683.Antony@Soft-Solutions.co.uk>
References: <a0f69e50407010452713ae264@mail.gmail.com> <200407011305.17055.Antony@Soft-Solutions.co.uk> <a0f69e50407010836467d308a@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e50407010836467d308a@mail.gmail.com>
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

On Thursday 01 July 2004 4:36 pm, Askar Ali Khan wrote:

> On Thu, 1 Jul 2004 13:05:17 +0100, Antony Stone
>
> > I would *really* recommend that you do this sort of thing with Squid
> > instead of netfilter, espcially since you have selected www.microsoft.com
> > as the address to be redirected.
> >
> > If you put a redirect rule into Squid, it will use www.microsoft.com
> > instead of an IP address, and you will get the result you want.
> >
> > Also, Squid will help when you want to change things after the first / in
>
> Thanks Antony for y0ou fast reply, actaully im practing on my own box
> not on company cache server "squid"

Doesn't matter - install Squid at home too - there's no reason why not.

If you put it on the same machine as netfilter, you can play with transparent 
proxying mode as well :)

Regards,

Antony.

-- 
Late in 1972 President Richard Nixon announced that the rate of increase of 
inflation was decreasing.   This was the first time a sitting president used 
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the list;
                                                           please don't CC me.


