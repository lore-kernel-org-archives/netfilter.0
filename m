From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Noob Question
Date: Fri, 31 Oct 2003 22:26:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310312226.43276.Alistair@nerdnet.ca>
References: <NGBBLGFEALDADHNDAAFFGEPJDMAA.kevin@perfht.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBLGFEALDADHNDAAFFGEPJDMAA.kevin@perfht.com>
Content-Disposition: inline
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
To: Kevin Smith <kevin@perfht.com>, Netfilter List <netfilter@lists.netfilter.org>

On October 31, 2003 12:03 pm, Kevin Smith wrote:
> Ok thanks, I think I had to but wasn't 100%. Now I can eliminate that is a
> possibility (Iptables 1.2.8).
> I finished it late last night so I wasn't in the mood for Googling
> anything. but tonight I shall. But I would turn away any tips. ;-)
> Thanks
>
>
> --__--__--
>
> Message: 5
> Subject: Re: Noob Question
> From: Ray Leach <raymondl@knowledgefactory.co.za>
> To: Netfilter Mailing List <netfilter@lists.netfilter.org>
> Organization: Knowledge Factory
> Date: Fri, 31 Oct 2003 16:25:39 +0200
>
>
> --=-p9AU5830cWaY0P2ToPWv
> Content-Type: text/plain
> Content-Transfer-Encoding: quoted-printable
>
> On Fri, 2003-10-31 at 16:13, Kevin Smith wrote:
> > Does IPtables need to be recompiled every time you roll a new kernel?
> > I just compiled 2.4.22 and when my firewall (Shorewall) started, it
> > spit some "device busy" errors with ip_tables.o.=20
> > Kev
>


	That error usually is generated when one has both iptables and ipchains in 
the tree.

	if ipchains loads ... iptables *coughs* and exits stage left.





> No. The kernel source includes (at least as far as I recall) the
> iptables kernel space drivers/programs/libraries.
>
> The userspace tools (the iptables executables used to manage rules) are
> separate, and do not get recompiled every time you recompile the kernel.
>
> The exception would be if you have iptables v0.1.0 (for example)
> userspace programs and in your kernel have iptables v1.2.8 source code,
> then there would be a mismatch, and the userspace programs may be
> incompatible with the kernel modules.
>
> Best to keep them all the same.
> --=20
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

