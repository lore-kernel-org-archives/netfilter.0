From: "Redhat Enigma" <redhat@zagros.ipm.ac.ir>
Subject: Re: Patch-O-matic
Date: Tue, 9 Jul 2002 11:39:59 +0430
Sender: netfilter-admin@lists.samba.org
Message-ID: <001401c22717$c1fd76e0$f948e1c2@redhat>
References: <001e01c226c3$e6268ec0$3864a8c0@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Aldo S. Lagana" <alagana@discmail.com>, netfilter@lists.samba.org

Dear Sir,
Thanx for your help ,I just want to use iplimit and time matching, but I
can't apply them to my kernel.
Anyway I just want to apply pending-patches and most-of-pom that the
documents tell they don't have any confilict with each other. So I don't
know what kind of process i should follow.

Regards
Alireza
----- Original Message -----
From: "Aldo S. Lagana" <alagana@discmail.com>
To: "'Red Hat Enigma'" <redhat@zagros.ipm.ac.ir>;
<netfilter@lists.samba.org>
Sent: Tuesday, July 09, 2002 1:40 AM
Subject: RE: Patch-O-matic


> Fellers corect me if I'm wrong, but the P-O-M features are not to be ALL
> used simultaneously - it even says it during the patch process that some
> patches break other patches...
>
> SO
>
> If you need the functionality found in a specific or a few patches - go
> ahead and apply only those patches, otherwise you always seem to get
> that _ out of _ failed chunks error...
>
>
>
> > -----Original Message-----
> > From: netfilter-admin@lists.samba.org
> > [mailto:netfilter-admin@lists.samba.org] On Behalf Of Red Hat Enigma
> > Sent: Monday, July 08, 2002 3:52 PM
> > To: netfilter@lists.samba.org
> > Subject: Patch-O-matic
> >
> >
> > Dear friends
> > I still try to find a way to use patch-o-matic features on my
> > kernel (
> > 2.4.18 ) ,when I run make patch-o-matic ,many patches say,
> > applying patch
> > fail and I don't know why, I do the following steps :
> >
> > make pending-patches
> > make most-of-pom
> > make patch-o-matic
> > < compiling the kernel>
> > make KERNEL_DIR
> >
> > but many patches didn't apply .
> >
> > Regards
> > Alireza
> >
> >
>


