From: Krishna Prasanth <krishnap@teneoris.com>
Subject: Re: Copying nf_info
Date: Fri, 14 May 2004 14:07:25 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opr7zd8nhzu1jv19@192.168.1.10>
References: <BAY2-F983CAaY6OqdBP0000671a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY2-F983CAaY6OqdBP0000671a@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="windows-1252"
To: Carl Morgan <killgoretrout59@hotmail.com>, netfilter@lists.netfilter.org

temp2->info =3D temp1->info, we will only copy the ADDRESS(NOT THE CONTEN=
TS)=20
of struct nf_info in the temp1.
Instead you can use memcpy function to do that.

regards
-prasanth
On Thu, 13 May 2004 13:05:38 -0500, Carl Morgan=20
<killgoretrout59@hotmail.com> wrote:

> Hello all,
>   I am writing a program that requires I copy nf_info from an entry to=20
> another one.  The general idea of the program is this:
>
> struct some_struct {
>                                 struct nf_info* info;
>                             };
>
> struct some_struct temp1;
> struct some_struct temp2;
>
> and in effect I want temp2->info=3Dtemp1->info.  Can someone please hel=
p.
>
> Tex Morgan
>
> _________________________________________________________________
> MSN Toolbar provides one-click access to Hotmail from any Web page =E2=80=
=93=20
> FREE download! http://toolbar.msn.com/go/onm00200413ave/direct/01/
>



--=20
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/

