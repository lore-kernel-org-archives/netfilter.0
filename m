From: MKS <rekordmeister@gmail.com>
Subject: Re: packets to local addresses
Date: Tue, 10 Apr 2007 11:52:10 +0000
Message-ID: <fad2fb270704100452p74fdde26k33f7a666ba9c1a59@mail.gmail.com>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
	<46167157.3080409@rtij.nl>
	<fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>
	<4617BC88.102@rtij.nl>
	<Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
	<46180FAD.50209@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=cRjqTOWSZEhStdFw8sxUGSxthfE3pdR+iuAeSiJRDNCiCnZk4rb6hDsqhO6eSlPhZnUmlSi9BYS37mcPFp+wbD9Z65i2BwaVX315Xw57dZqvVMOMjgLVHPHsHHXVu/DfVHNT6mMEl9PsSsopp0D3K4MJHH/DYduj3BwCUwSxeKc=
In-Reply-To: <46180FAD.50209@rtij.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

On 4/7/07, Martijn Lievaart <m@rtij.nl> wrote:
> Jan Engelhardt wrote:
> > On Apr 7 2007 17:45, Martijn Lievaart wrote:
> >
> >> MKS wrote:
> >>
> >>> What is the best way to change this behaviour, that is force "general"
> >>> packets out a specific interface. iptables route target???
> >>>
> >> Dunno. Maybe the ROUTE target can be of assistence. As I said earlier, hping2
> >> probably can do this.
> >>
> >
> > Use MARK and iproute2.
> >
>
> Are you sure? I thought you couldn't overrule the local table.

It's not possible to override the local table nor bypass or delete from it.

When I use hping -I ppp0 and ping to 10.0.1.1 (ppp1) then I don't get
any response and I can see that the packet never leaves the system
(tcpdump -i ppp0) and that it never arrives on the NAS (using debug on
the NAS)

Does someone know a trick to override the local routing table? or does
that require hacking the kernel?

Regards MKS

