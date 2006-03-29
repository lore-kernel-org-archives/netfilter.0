From: "Joshua C. Clark" <Josh@NetworkMedics.Com>
Subject: Re: PATCH-O-MATIC (installation issue)
Date: Wed, 29 Mar 2006 14:47:22 -0500
Message-ID: <01dc01c65369$9944c410$1b51200a@corporate.libgo>
References: <000301c65362$e4cd0660$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

maybe this is a dumb question maybe it isnt, but can I download the vanilla
kernel and run it on my redhat box?
----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 29, 2006 1:59 PM
Subject: RE: PATCH-O-MATIC (installation issue)


> > I can get past that it just fails whenever I try to click 'y' to
> > install the atches comlaining about missing files, really I only want
> > to be able to use time features with IPTABLES, but I dont see that in
> > the POM, what am I doing wrong, thanks in advance!!!
>
> According to the Netfilter website, the time patch is in the base part
> of POM so you can start POM with either "base" or "extra".
> http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-t
> ime
>
> If that doesn't work...
> I'm not familiar with Redhat kernels, but I do know that some distro's
> use their own patched kernels (Redhat does) which can cause troubles if
> you try to apply patches to them. Maybe POM doesn't "like" the Redhat
> kernel.
> Maybe it works when you download and patch a vanilla kernel source from
> kernel.org.
>
>
> Gr,
> Rob
>
>
>


