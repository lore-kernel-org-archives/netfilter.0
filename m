From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: problem with ./runme in --batch mode. -- current p-o-m
Date: Thu, 9 Jan 2003 22:24:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301092224.00419.Alistair@nerdnet.ca>
References: <IMEDICLPAGAOCBLCCKLPGENAEKAA.netfilter@darrelldieringer.com> <200301092118.21946.netfilter@newkirk.us>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301092118.21946.netfilter@newkirk.us>
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
To: netfilter@lists.samba.org


=09Hi folks:
=09Looking to minimize my time and general frustration levels, I set abou=
t=20
automating my kernel rebuild process ... including doing the *go get kern=
el*,=20
go patch kernel, make dep, make modules, make bzimage.... its somewhat mo=
re=20
complex than that but what I found is that there is a little hook in ./ru=
nme=20
if one invokes ./runme with --batch one invokes a loop at line 749 as=20
follows...=20

# Check to see if there is excluded patches
EXCLUDED=3D
while [ "$1" =3D "--exclude" ]; do
    EXCLUDED=3D"$EXCLUDED $2"
    shift
    shift
done


 --- Correct me if I'm utterly off base, but does that second shift not c=
lose=20
the loop by making $1 !=3D --exclude for a long list of excluded suite/pa=
tches?

I'm trying to run this with patches I know that work (and install well) w=
ith a=20
particular kernel .... and my little scripty b0rks at this and misapplies=
=20
patches that I most definately do not want on my system ... and several t=
hat=20
don't apply ...=20

    Alistair Tonner
=09Alistair@nerdnet.ca

