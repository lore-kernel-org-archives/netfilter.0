From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Subject: Re: netfilter/iptables problems on solaris
Date: Wed, 12 Mar 2003 17:18:02 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c2e8d4$7cc2b0c0$3201a8c0@ESTACAO>
References: <8C1856C372A7574291A56C3B7000A7AEF58254@eestqnt104>
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
To: "Joaquin Henriquez Alzola (REE)" <Joaquin.Henriquez-Alzola@ree.ericsson.se>, netfilter@lists.netfilter.org


    Seems we're having a big misunderstanding here. netfilter is a kernel
feature of linux kernel. iptables is the 'admin tool' for netfilter, which
is a linux kernel feature.

    Please correct me if I'm wrong people, but netfilter/iptables was
designed for linux kernel 2.4 and wasnt ported for other plataforms.

    We have several reports and several people running netfilter/iptables in
several linux configurations ( Intel, Macs, PPCs, RISCs ) ..... but none on
Solaris.

    I'm pretty sure you should look in Solaris packet filter system which
I'm pretty sure is very effective too.


    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Joaquin Henriquez Alzola (REE)"
<Joaquin.Henriquez-Alzola@ree.ericsson.se>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 12, 2003 4:06 PM
Subject: netfilter/iptables problems on solaris


> Hi,
>
> I have problems on the compilation of netfilter/iptables on Solaris 8.
> When I do a make it appears me the error in line 12 that is
> KERNEL_DIR=/usr/src/linux
>
> I just wanted to compile it for Solaris but I am not able to fiond the
> kernel source in the Solaris. Can you tell me wher eis it.
>
> I have search in google but I can't find it.
>
> BR,
>
> Joaquin
>


