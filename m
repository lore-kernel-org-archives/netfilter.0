From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: Re: unexpected problem with DNAT
Date: Wed, 10 Jul 2002 20:15:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <0207102015260C.04513@Lms>
References: <02071014505504.04513@Lms> <02071018535509.04513@Lms> <20020710174859.LNZJ23840.mta03-svc.ntlworld.com@there>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020710174859.LNZJ23840.mta03-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

On Wednesday 10 July 2002 19:42, Antony Stone wrote:
> On Wednesday 10 July 2002 5:53 pm, Jan Humme wrote:
> > On Wednesday 10 July 2002 17:55, Antony Stone wrote:
> > > If the original poster doesn't know what addresses s/he wishes to
> > > block, then I can't think of a netfilter rule which will help :-)
> >
> > Harty-har-har.........!
> >
> > But I still don't understand the reason why you would mark (or even DROP)
> > packages at the mangle stage, if the same source IP is still available at
> > the filter stage?
>
> Simple - I got confused by the Subject of the mail thread, and I thought
> the problem was with DNAT, not SNAT.
>
> Of course you are correct that SNAT is done at the *end* of all the
> filtering, therefore any blocking can be done at the FORWARDing stage.
>
> I thought the problem was to block a connection based on its original
> destination address, which had been lost by being DNATted in the PREROUTING
> chain, and therefore it was no longer possible to filter on destination
> address in the FORWARDing chain.
>
> Hope this explains at least part of my confusion, and therefore some of
> yours about my postings ?

It certainly does. Just thought that perhaps there was some clever trick that 
I missed, as I am only starting to get the hang of things.

In any case, we still don't know what the original poster is trying to 
achieve...!

Jan Humme.

