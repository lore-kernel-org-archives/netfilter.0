From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: [PATCH 1/1] commit c6825c0976fa7893692e0e43b09740b419b23c09
 upstream.
Date: Wed, 28 Oct 2015 02:36:50 -0400
Message-ID: <20151028023650.7b76098f@playground>
References: <alpine.OSX.2.20.1510261144390.3919@athabasca.local>
	<20151026200633.GA13476@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU t9S6askN007523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1446014214; i=@wpi.edu;
	bh=eGu7jRhA+4569zI3DvlHZkTtJRS5gTMc20O55HjmhNU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uVfnBwBedthnzed3sJ1ruxd5qi15qjo+xLK8bAMageD+R+IUkbFVSSFYHI4Zuo3Af
	 kMoRm/1GvAVMIdxL7NgBQMAyX5HOe5X/z7Moq1tV/FbC0l+T/NiV7lgVFx2C65Sl5o
	 U5FeANdHo0gbhN/ffzHVBGF94YTp+/Ex+q28CLaU=
In-Reply-To: <20151026200633.GA13476@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ani Sinha <ani@arista.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, netdev@vger.kernel.org

On Mon, 26 Oct 2015 21:06:33 +0100
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> Hi,
> 
> On Mon, Oct 26, 2015 at 11:55:39AM -0700, Ani Sinha wrote:
> > netfilter: nf_conntrack: fix RCU race in nf_conntrack_find_get
> 
> Please, no need to Cc everyone here. Please, submit your Netfilter
> patches to netfilter-devel@vger.kernel.org.
> 
> Moreover, it would be great if the subject includes something
> descriptive on what you need, for this I'd suggest:
> 
> [PATCH -stable 3.4,backport] netfilter: nf_conntrack: fix RCU race in nf_conntrack_find_get
> 
> I'm including Neal P. Murphy, he said he would help testing these
> backports, getting a Tested-by: tag usually speeds up things too.

I hammered it a couple nights ago. First test was 5000 processes on 6 SMP CPUs opening and closing a port on a 'remote' host using the usual random source ports. Only got up to 32000 conntracks. The generator was a 64-bit Smoothwall KVM without the patch. The traffic passed through a 32-bit Smoothwall KVM with the patch. The target was on the VM host. No problems encountered. I suspect I didn't come close to triggering the original problem. Second test was a couple thousand processes all using the same source IP and port and dest IP and port. Still no problems. But these were perl scripts (and they used lots of RAM); perhaps a short C program would let me run more.

Any ideas on how I might test it more brutally?

N
