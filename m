From: Emanoil Kotsev <emanuel@abc.at>
Subject: Re: iptables 1.2.8 libc6 question
Date: Wed, 16 Jul 2003 01:00:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307160100.41284.emanuel@abc.at>
References: <7C9884991ADAE0479C14F10C858BCDF52E359F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF52E359F@alderaan.smgtec.com>
Content-Description: clearsigned data
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
Content-Type: Text/Plain; charset="us-ascii"
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ThanX Daniel,
unfortunately you are not telling me anything new.
My question is how could I point iptables to the other libc.

=46ew things are going trough my mind:

1) exporting and mounting trough nfs on the compile-machine and then pointi=
ng=20
the compiler to the directory mounted.
Question: after I install iptables where is it going to look for the=20
libraries?? I don't think it will find the proper path

2) copying the libraries for ex. in /usr/local/lib
Question: On target machine the libs are in /lib ??? would iptables find th=
em=20
under /usr/local/lib (it is in ld.so.conf)

3) What about compiling iptables with no shared libraries as it will be=20
permanently used - are the libc6 -> libc-2.3.1 included in iptables?

4) perhaps the easiest way if possible at all would be to upgrade the targe=
t=20
machine

Which should I choose and are there any better ideas???

Thanks in advance for taking your time

unfortunately I tried to replace libc-2.2.5 on the target machine but it=20
wasn't good idea :-)) I ran into "hella trouble".

I was lucky to have a backup of the system and I can just recommend=20
BACKUP EVERYTHING POSSIBLE as often as you can - it safes time .

Unfortunately I don't want to restore everything from backup - so I wait fo=
r=20
your advises.

regards

=2D --

On Tuesday 15 July 2003 23:03, Daniel Chemko wrote:
> Cross compiling is not a trivial matter when cross compiling different
> systems. Basically unless you are running vanilla x86 with compatible
> versions of libc, you will run into hella troubles getting into it.  As
> a solution, you will need either the libc from the destination
> architecture on the build machine, and point the compiler to build the
> program against the other libraries. I have never done this with
> iptables, but that is how you would go about it.
>
> -----Original Message-----
> From: Emanoil Kotsev [mailto:emanuel@abc.at]
> Sent: Tuesday, July 15, 2003 1:41 PM
> To: netfilter@lists.netfilter.org
> Subject: iptables 1.2.8 libc6 question
>
> Please help me to find information how to build iptables (1.2.8) for
> kernel
> 2.4.20 on my PC with libc-2.3.1 for another PC where libc-2.2.5 is
> installed.
>
> I have no problem to compile and install but iptables dies miserably
> trying to
> load libc6 which is actually a link to libc-2.2.5 on the target machine.
>
> What should I do?
>
> P.S above this I found quite a lot of documentation telling me how I can
>
> compile and install a linux kernel and iptables and aplications based on
>
> libiptc but nothing to tell me how I can link iptables to different libc
> and
> I don't want to make a mistake ...
>
> Thanks

=2D --=20
//----------------------
||
|| Emanoil Kotsev      =20
||
|| tel. 0043 1 9253175
||
\\--- penguin friendly--
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/FIeWMdng4VCsE9oRAnYtAJ9QgFAJpQtzHvkmvAh4Ofl9PnCbLwCeNzRX
9QqFzzrknKfRJvXkcCvk2XY=3D
=3D0yWp
=2D----END PGP SIGNATURE-----


