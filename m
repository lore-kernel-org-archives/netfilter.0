From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: ipsec-01-output-hooks / ipsec-02-input-hooks patches vs. 2.6.14
Date: Mon, 21 Nov 2005 13:17:52 +0100
Message-ID: <200511211317.52647@nienna>
References: <43819D19.9010506@atosorigin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43819D19.9010506@atosorigin.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


  Hi,

On Monday 21 November 2005 11.10, Markus Marquardt wrote:
> i've tried to apply the netfilter pom-ng-20051115 patches for
> ipsec-01-output-hooks and ipsec-02-input-hooks against kernel 2.6.14.2.
>
> When using patch-o-matic-ng both complained about missing nf_reset. When
> trying to apply them manually, the former applied with some offset &
> fuzz, the latter failed and complained about missing files etc.
>
> Is there any workaround or work-in-progress to make this working on
> 2.6.14?

  Patrick McHardy has been working on getting those patches ready for 
mainline inclusion lately. He has posted the latest incarnation of his 
patches to the netfilter-devel mailing list recently. (Note however, that 
those patches are for the latest Linux 2.6.15 development branch and not 
for 2.6.14.) You can take a look at the patches in the mailing list 
archive:

  http://marc.theaimsgroup.com/?l=netfilter-devel&m=113250450910387&w=2

  So yes, there's very serious work going on to get those patches in 
mainline (probably in 2.6.16).

-- 
 Regards,
  Krisztian Kovacs

