From: "Wylie Swanson" <wylie@datamaersk.net>
Subject: H323 patch, 2.4.18 problem - read error: Is a directory
Date: Thu, 9 May 2002 14:49:36 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001f01c1f7a3$69612a70$0400a8c0@core.datamaersk.net>
Reply-To: <wylie@datamaersk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter-devel@lists.samba.org, netfilter@lists.samba.org

I am having trouble applying the H323 patch to the 2.4.18 kernel
source.=A0 Is the H323 built into any development kernel=92s at
www.kernel.org? I used the following process:
=A0
[starting with working 2.4.18 kernel]
/usr/src
freeswan-snap2002may7d -> /usr/local/src/freeswan-snap2002may7d/
linux -> /usr/local/src/linux
netfilter -> /usr/local/src/netfilter/
=A0
cd /usr/src
cvs -d :pserver:cvs@pserver.samba.org:/cvsroot login
cvs -d :pserver:cvs@pserver.samba.org:/cvsroot co netfilter
cd netfilter/userspace/patch-o-matic
export KERNEL_DIR=3D/usr/src/linux
./runme
./runme newnat
=A0
=A0
Welcome to Rusty's Patch-o-matic!
=A0
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Testing... Need directory and patch.
=A0
The newnat/newnat newnat patch:
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] t Testing patch
newnat...
patch: **** read error : Is a directory
Failed to patch copy of /usr/src/linux
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?]
=A0
Any input would be appreciated,
=A0
If someone has a patched 2.4.18 kernel in source, that would also be
helpful (but the real solution would be better).
=A0
Best regards,
=A0
-=3D[ Wylie Swanson
.:[ DataMaersk, Inc.


