From: <wylie-netfilter@datamaersk.com>
Subject: RE: Patch-o-matic Error
Date: Mon, 13 May 2002 23:45:27 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002701c1fb12$ee8ee5d0$0400a8c0@core.datamaersk.net>
References: <IHEKLFBNKMPNAHHBAKEPCEHLFIAA.alex@linux.org.pe>
Reply-To: <wylie@datamaersk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <IHEKLFBNKMPNAHHBAKEPCEHLFIAA.alex@linux.org.pe>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "=?iso-8859-1?Q?'Ing._CIP_Alejandro_Celi_Mari=E1tegui'?=" <alex@linux.org.pe>, 'Netfilter' <netfilter@lists.samba.org>

I had this same problem, but everything is working fine now for me.

You must apply first all pending patches otherwise it will fail. (If a
pending patch cannot be applied/failed at applying, that does not
matter.)

I suggest using make patch-o-matic from userspace/.

There are pre-requisite patches neccesary for it to work properly.

Hope this helps.


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Ing. CIP Alejandro
Celi Mari=E1tegui
Sent: Monday, May 13, 2002 11:41 PM
To: Netfilter
Subject: Patch-o-matic Error



Hi:

I do all the steps about patch-o-matic in
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.
html

But i have a problem with newnat, i have this error:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

# ./runme newnat

Welcome to Rusty's Patch-o-matic!

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Testing... Need directory and patch.

The newnat/newnat newnat patch:
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y Testing patch
newnat...
patch: **** read error : Is a directory
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

[Press enter to continue]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=


thank you for your help.

Best regards,

Alex




