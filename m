From: "Alireza" <redhat@zagros.ipm.ac.ir>
Subject: Re: Patch-O-matic
Date: Wed, 10 Jul 2002 11:25:29 +0430
Sender: netfilter-admin@lists.samba.org
Message-ID: <001201c227de$c958d3e0$ba46e1c2@saleh>
References: <001e01c226c3$e6268ec0$3864a8c0@discmail.com> <001401c22717$c1fd76e0$f948e1c2@redhat> <200207101040.12164.fabrice@celestix.com>
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
To: fabrice@celestix.com, netfilter@lists.samba.org

Hi,
I really follow all the steps in the following howto, but patch-o-matic.
prompt
FAIL copy /usr/src/linux-2.4.18-5 and doesn't apply the patch (ip-limit) and
som other that I applied to kernel version 2.4.2.
When I checked my kernel directory I saw all the required files copied there
for example iplimit.h and netlink.c was pathced but it doesn't add a line in
/usr/src/linux-2.4/net/ipv4/netfilter/Config.in .

I don't know about the errors.

Regards
Alireza
----- Original Message -----
From: "Fabrice MARIE" <fabrice@celestix.com>
To: "Redhat Enigma" <redhat@zagros.ipm.ac.ir>; "Aldo S. Lagana"
<alagana@discmail.com>; "Denis JULIEN" <denis.julien@vupublishing.net>;
"iptables" <netfilter@lists.samba.org>
Sent: Wednesday, July 10, 2002 7:10 AM
Subject: Re: Patch-O-matic


> On Tuesday 09 July 2002 15:09, Redhat Enigma wrote:
> > Dear Sir,
> > Thanx for your help ,I just want to use iplimit and time matching, but I
> > can't apply them to my kernel.
> > Anyway I just want to apply pending-patches and most-of-pom that the
> > documents tell they don't have any confilict with each other. So I don't
> > know what kind of process i should follow.
>
> Hello,
>
> basically, all patches contained in pending/ submitted & base/ in p-o-m
should apply without
> conflict. Maybe you didn't follow the appropriate steps ?
>
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html
>
> Have a nice day,
>
> Fabrice.
> --
> Fabrice MARIE
> Senior R&D Engineer
> Celestix Networks
> http://www.celestix.com/
>
> "Silly hacker, root is for administrators"
>        -Unknown


