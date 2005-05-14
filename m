From: Askar <askarali@gmail.com>
Subject: Re: tableview.sh
Date: Sat, 14 May 2005 14:42:21 +0500
Message-ID: <a0f69e505051402425a6ef8@mail.gmail.com>
References: <fad9d484050513094833eb1148@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fad9d484050513094833eb1148@mail.gmail.com>
Content-Disposition: inline
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
To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Cc: lartc <lartc@mailman.ds9a.nl>, netfilter@lists.netfilter.org

Aha so nice, i'm kinda excited to deploy the script to all of my servers ;)
well done mate

thanks and regards

Askar

On 5/13/05, Kenneth Kalmer <kenneth.kalmer@gmail.com> wrote:
> netfilter and lartc members
>=20
> I just thought it's time I contribute. I created this little script to
> help me while setting up iptables rules for firewalling, shaping or
> both. I hope this helps someone.
>=20
> Called tableview.sh, inspired by Table Mountain, Cape Town, ZA :)
>=20
> --- SOF ----
>=20
> #!/bin/sh
> #     ____
> #  /\/    \/\
> # /__________\
> #
> # Simple loop for keeping track of what is happening in a
> # iptables setup
> #
>=20
> table_filter(){
>         echo
>         echo "FILTER TABLE"
>         echo "------------"
>         echo
>         iptables -nvL
> }
> table_mangle(){
>         echo
>         echo "MANGLE TABLE"
>         echo "------------"
>         echo
>         iptables -nvL -t mangle
> }
> table_nat(){
>         echo
>         echo "NAT TABLE"
>         echo "---------"
>         echo
>         iptables -nvL -t nat
> }
> footer(){
>         echo
>         echo "-----------------------------------------------------------=
--"
>         echo "Show table: [F]ilter, [M]angle, [N]AT or hit return to relo=
ad"
> }
>=20
> last=3D"filter"
>=20
> while [ 1 ]; do
>         clear
>         case "$REPLY" in
>                 "F" | "f" )
>                         table_filter
>                         last=3D"filter"
>                         ;;
>                 "M" | "m" )
>                         table_mangle
>                         last=3D"mangle"
>                         ;;
>                 "N" | "n" )
>                         table_nat
>                         last=3D"nat"
>                         ;;
>                 "Q" | "q" )
>                         exit 0
>                         ;;
>                 *)
>                         table_$last
>                         ;;
>         esac
>         footer
>         read
> done
>=20
> --- EOF ---
>=20
> Regards
>=20
> --
>=20
> Kenneth Kalmer
> kenneth.kalmer@gmail.com
> http://opensourcery.blogspot.com
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

