From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: HEEEEEEEEEELP!!!! with ip_conntrack: table full,
 dropping packet.
Date: Thu, 27 Jan 2005 08:34:44 -0500 (EST)
Message-ID: <23838.142.169.215.10.1106832884.squirrel@142.169.215.10>
References: <000301c503f1$9dbe6730$0b00a8c0@leeloo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000301c503f1$9dbe6730$0b00a8c0@leeloo>
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
To: Pablo Vila <pvila@adinet.com.uy>
Cc: netfilter@lists.netfilter.org

On Wed, January 26, 2005 4:54 pm, Pablo Vila said:
> I have the this problem, i have compiled and installed ok a new kernel
> (2.6.10)
>
>  kernel: printk: 55 messages suppressed.
>  kernel: ip_conntrack: table full, dropping packet.

This is a bug introduced in 2.6.10 and fixed in current tree.
Please see this thread:
https://lists.netfilter.org/pipermail/netfilter-devel/2004-December/01790=
8.html

>[...]
>
> PS: Sorry my English
>                                            Pablo <=3D=3D=3D
>
> -------------------------------------------
>   Pablo Francisco Vila Silveira     CX5CM
>      email: pvila@montevideo.com.uy
>             pvila@adinet.com.uy
>        sms: 94338237@sms.bellsouth.com.uy
>    Montevideo, Uruguay, America del Sur
> -------------------------------------------
>
>

Regards,

Samuel


