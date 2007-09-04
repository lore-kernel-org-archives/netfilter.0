From: "Peng Yang" <pey204@gmail.com>
Subject: Re: problem on iptables
Date: Tue, 4 Sep 2007 15:45:01 -0400
Message-ID: <e3c78d830709041245t3a180fei5277f1f312cad7df@mail.gmail.com>
References: <e3c78d830709041148w526b78d5nb9b0dffe3a8a81a0@mail.gmail.com>
	<web-23979449@bk3.webmaillogin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=IvtiGiRUpIFdZkVDO8aDTEJcD9hqFL69Nn4vEFFf7QcqzzFEIcXsbpD/jOw96ufBBDn5C6eSsLFYxz7fOSbE+qSRIAVYdmnrWEv9bikzHO2WWshgRotVcoFkKI0vfjMu13ndf1qmjBv56oqTJtcM1gD6LloxCduIfUXMglgH8xg=
In-Reply-To: <web-23979449@bk3.webmaillogin.com>
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

Hi Jorge,

How to turn on this configuration?
I am using kernel 2.6.20.11.
Do I need to recompile the kernel after turning on the configuration?

thanks,
Peng

On 9/4/07, Jorge Davila <davila@nicaraguaopensource.com> wrote:
> You don't need any patch to put to work netfilter/iptables.
>
> I'm pretty sure that is disabled in the kernel configuration.
>
> Jorge.
>
> On Tue, 4 Sep 2007 14:48:30 -0400
>   "Peng Yang" <pey204@gmail.com> wrote:
> > Hi,
> > In our current kernel, iptables doesn't work due to the error "can't
> > initialize iptables table `filter'".
> > I suspect that the netfilter is not turned on in the kernel.
> > We download the v2.6.20.11 sourcecode and try to do a menuconfig but
> > the networking packet filtering framework does not provide any option
> > for us to select to turn on netfilter. Can anyone let me know what patch
> >files
> > I need to add to allow me to choose this netfilter feature?
> >
> > thanks
> > peng
> >
> >
>
> Jorge Isaac Davila Lopez
> Nicaragua Open Source
> +505 430 5462
> davila@nicaraguaopensource.com
>

