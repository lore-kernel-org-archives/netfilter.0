From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: transparent proxy
Date: Sat, 13 Mar 2010 04:05:05 -0600
Message-ID: <20100313100504.GA10986@minipax>
References: <21B7BA85E0A248919216BC6546842EFB@sence>
 <857a760cf2ade9bdadec40329e2e010b@mail.treenet.co.nz>
 <4B9B4B03.7000708@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B9B4B03.7000708@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Mar 13, 2010 at 09:21:23AM +0100, Mart Frauenlob wrote:
> Amos Jeffries:
> > Please read the Squid FAQ examples of how to configure policy 
> > routing ...
> > 
> > Router:
> >  http://wiki.squid-cache.org/ConfigExamples/Intercept/IptablesPolicyRoute
> > 
> > Squid box:
> >  http://wiki.squid-cache.org/ConfigExamples/Intercept/LinuxDnat
>
> I'd like to ask, if in the above examples, the ACCEPT rules need
> to be placed in the mangle table?
> Is there a specific reason, couldn't it be done in the filter
> table?
> As that would be the intended/preferred use for filtering?
> If so, don't the examples teach people 'bad manners'?

I think Mart is misunderstanding the effect of ACCEPT in mangle. It
does not override nor bypass the filter table. It merely means, "we
are done mangling this packet."

The MARK target is one of those sneaky non-terminating targets. A
mark is applied, and the packet continues in that particular chain.
Further -j MARK rules could be applied. The ACCEPT rule prevents
this.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
