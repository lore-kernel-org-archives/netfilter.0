From: "Remus" <rmocius@auste.elnet.lt>
Subject: Re: Latest POM and kernel 2.6
Date: Tue, 7 Oct 2003 08:00:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <032e01c38ca0$ce962bf0$6e69690a@rimas>
References: <02aa01c38c22$0cc66090$6e69690a@rimas> <Pine.LNX.4.51.0310061805490.6963@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Thanks Maciej for the idea.

Remus

> Hi,
>
> > Is any chance to apply the latest POM to kernel 2.6?
> Not all of it. Generally some pom patches will:
> - not apply, if they are not for this kernel, or they are already in 2.6
>   just get the latest 2.6 for most up2date netfilter code.
> - apply cleanly, if they are just as clean for 2.6 as for 2.4
> - apply with minor rejects about configure.help files:
>   Mainly the patches that introduce new targets/matches add their code
>   and add help messages to Configure. 2.6 does not have Configure, instead
>   it has Kconfig. So applying things like ipv4optsstrip will apply cleanly
>   but you won't get the help message.
>
> > Thanks in advance
> > Remus
> Regards,
> Maciej
>


