From: "Joshua C. Clark" <Josh@NetworkMedics.Com>
Subject: Re: PATCH-O-MATIC (installation issue)
Date: Wed, 29 Mar 2006 13:48:09 -0500
Message-ID: <01c001c65361$535ced90$1b51200a@corporate.libgo>
References: <000101c65360$b200cac0$0101000a@sterenborg.info>
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

I can get past that it just fails whenever I try to click 'y' to install the
atches comlaining about missing files, really I only want to be able to use
time features with IPTABLES, but I dont see that in the POM, what am I doing
wrong, thanks in advance!!!


----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 29, 2006 1:43 PM
Subject: RE: PATCH-O-MATIC (installation issue)


> > I am so stupid, I didnt realize that by simply downloading the
> > package that was the IPTABLES source directory, however when I run
> > the runme it asks if i want to patch but when I say yes to any of
> > them it tells me it is missing files.. Any ideas?
>
> Yes, well, where did you untar the iptables source ? You have to tell
> POM where it is, just like it has to know where the kernel-source is.
> Try running POM like this :
>
> KERNEL_DIR=/path/to/kernel-src IPTABLES_DIR=/path/to/iptables-src \
>   ./runme [base|extra]
>
> You have to fill in the real paths, I can't do that for you.
>
>
> Gr,
> Rob
>
>
> > ----- Original Message -----
> > From: "Rob Sterenborg" <rob@sterenborg.info>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Wednesday, March 29, 2006 1:25 PM
> > Subject: RE: PATCH-O-MATIC (installation issue)
> >
> >
> >>> I can find the kernerl source but I cannot seem to find the iptables
> >>> source, and when I point it to the same location as my linux kernel
> >>> it fails saying it doesnt know the IPTABLES source, does this make
> >>> sense, and thank you for following up!
> >>
> >> Ah, yes you did write that.. Sorry about that.
> >> All sources are separate packages. I don't know if you have
> >> installed the iptables source. However, I'd recommend to download
> >> the source of both iptables and POM snapshots from the ftp site of
> >> the Netfilter project as you can download more up-to-date sources.
>
>
>


