From: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Subject: Re: help: ip_nat_pptp (solved!)
Date: Fri, 30 May 2003 17:57:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c32691$fbb98a20$6400a8c0@homes>
References: <003f01c32676$496ca840$fe00a8c0@expi> <1054287180.811.1.camel@xbox>
Reply-To: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
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
To: Filip Sneppe <filip.sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

Thanks Filip. you're right... ip_conntrack_pptp was not loaded :) after
loading them, i can insmod ip_nat_pptp w/o any problem.

Cheers!


----- Original Message -----
From: "Filip Sneppe" <filip.sneppe@cronos.be>
To: "V. Pascual" <voltaire@voltaire.servebeer.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Friday, May 30, 2003 5:33 PM
Subject: Re: help: ip_nat_pptp


> Hi Pascal,
>
> On Fri, 2003-05-30 at 08:39, V. Pascual wrote:
> > Hi There,
> >
> > I have patched my kernel (2.4.20) with ip_nat_pptp (using
patch-o-matic-20030107). Patch went fine and the kernel was recompiled
successfuly. I have tried to install the module but I have the error which
says;
> >
> > [root@ netfilter]# insmod ip_nat_pptp.o
> > ip_nat_pptp.o: unresolved symbol ip_pptp_lock_Rsmp_66d9b5ea
> >
> > [root@ netfilter]# insmod ip_nat_mms.o
> > ip_nat_mms.o: unresolved symbol ip_mms_lock_Rsmp_8d71dea1
> >
>
> I guess ip_conntrack_pptp and ip_conntrack_mms are not loaded then ?
> You can check this with "lsmod".
>
> If you use "modprobe" instead of "insmod", the necessary ip_conntrack_*
> modules will be loaded automatically, as the ip_nat_* modules
> depend on them.
>
> Regards,
> Filip
>


