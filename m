From: "Stephen Jones" <sljones8@hotmail.com>
Subject: RE: tcp-MSS target extensions Patch
Date: Sun, 23 May 2004 06:59:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-F157qFsWISA05L000158e6@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello all,  I thought I would post the resolution to my particular problem =

with this:  Windows...doh!

I am attempting to modify a SmoothWall Express 2.0 firewall such that it ca=
n=20
function as a pptp gateway for clients behind it.  The SmoothWall does not =

have any of the "make" tools or libraries, and rightly so.  It also does no=
t=20
have a floppy, or support for mounting a CDROM after it is installed.  Thus=
=20
I have to transfer files to it from another machine...via scp.  This is=20
where I hurt myself, lol.

As you all know, the *nix file systems are very concrete, and precise in=20
their file naming conventions with regard to CaSe, among other things...=20
Windows, on the other hand, is not.  I am guessing this decision was made t=
o=20
make the Windows file system more "friendly" at the expense of accuracy?...=
=20
Sounds like Shiner Bock logic to me, but that is another tirade for another=
=20
time...

It so happens that the "go between" between my Fedora workstation where I=20
compile everything and the SmoothWall is a windows machine on the Smoothie'=
s=20
internal network.  I use the outstanding WinSCP utility to transfer files=20
from the windows machine to the Smoothie.  This is where the trouble begins=
,=20
and ends.

It seems that according to Windows:  ipt_TCPMSS.so  and ipt_tcpmss.o are th=
e=20
same file...  thus, I was never getting both proper files onto the=20
SmoothWall machine...  Windows would simply overwrite the first file with=20
the second one to hit the directory.  I even tried mapping a Samba share to=
=20
transfer the files from.. still a no-go...

Ultimately I tar zipped the modules and transferred the tar archive to the =

Smoothie, and untar'd it there.

Problem solved...

I feel like a moron... It certainly isn't the first time, and it certainly =

won't be the last...

It was the post by Alistair that put me on the right track...  thanks again=
=20
for your patience and helpful replies!

Onward through the fog!

_________________________________________________________________
Is your PC infected? Get a FREE online computer virus scan from McAfee=AE=20
Security. http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3D3963


