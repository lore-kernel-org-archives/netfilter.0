From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Patch-O-matic
Date: Mon, 8 Jul 2002 17:10:33 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001e01c226c3$e6268ec0$3864a8c0@discmail.com>
References: <Pine.LNX.4.33.0207090018030.13923-100000@zagros.ipm.ac.ir>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.33.0207090018030.13923-100000@zagros.ipm.ac.ir>
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
To: 'Red Hat Enigma' <redhat@zagros.ipm.ac.ir>, netfilter@lists.samba.org

Fellers corect me if I'm wrong, but the P-O-M features are not to be ALL
used simultaneously - it even says it during the patch process that some
patches break other patches...

SO

If you need the functionality found in a specific or a few patches - go
ahead and apply only those patches, otherwise you always seem to get
that _ out of _ failed chunks error...



> -----Original Message-----
> From: netfilter-admin@lists.samba.org 
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Red Hat Enigma
> Sent: Monday, July 08, 2002 3:52 PM
> To: netfilter@lists.samba.org
> Subject: Patch-O-matic
> 
> 
> Dear friends
> I still try to find a way to use patch-o-matic features on my 
> kernel ( 
> 2.4.18 ) ,when I run make patch-o-matic ,many patches say, 
> applying patch 
> fail and I don't know why, I do the following steps :
> 
> make pending-patches
> make most-of-pom
> make patch-o-matic
> < compiling the kernel>
> make KERNEL_DIR
> 
> but many patches didn't apply .
> 
> Regards
> Alireza
> 
> 


