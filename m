From: MKS <rekordmeister@gmail.com>
Subject: Re: packets to local addresses
Date: Tue, 10 Apr 2007 15:53:23 +0000
Message-ID: <fad2fb270704100853o52810bf9k56c1cef4c93f4c8c@mail.gmail.com>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
	<46167157.3080409@rtij.nl>
	<fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>
	<4617BC88.102@rtij.nl>
	<Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
	<46180FAD.50209@rtij.nl>
	<fad2fb270704100452p74fdde26k33f7a666ba9c1a59@mail.gmail.com>
	<Pine.LNX.4.61.0704101721060.21664@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=PTwOqBuJZCUiSVryIZedtQxM1KYqa8N6dfTaE37CXo4jFI/jbKiaeUhUOp/vHFB7SX7D0ADpcGEgyZk6ciRlTeaWLNts3xBd39Gi2nZ1vzifRuZQzf+uRbB/8XPChigI4Hw92E4I6Zet86Xy4uoHuCbemyaPmAoFiUdyFza5Z/w=
In-Reply-To: <Pine.LNX.4.61.0704101721060.21664@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On 4/10/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>
> On Apr 10 2007 11:52, MKS wrote:
> >
> > It's not possible to override the local table nor bypass or delete from it.
> >
> > When I use hping -I ppp0 and ping to 10.0.1.1 (ppp1) then I don't get
> > any response and I can see that the packet never leaves the system
> > (tcpdump -i ppp0) and that it never arrives on the NAS (using debug on
> > the NAS)
> >
> > Does someone know a trick to override the local routing table? or does
> > that require hacking the kernel?
>
> What exactly are you trying to achieve?
> To simply test transmission, `ping -I interface -bf 255.255.255.255`
> does the job.

I want to generate load on the NAS by making a traffic matrix over n
ppp connections.
e.g. ppp0 will send traffic to ppp1-pppN, etc.

Regards
MKS

