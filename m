From: Sujith Chennupati <sujith.chennupati@gmail.com>
Subject: problem in finding and patching iptables
Date: Wed, 20 Oct 2004 11:03:41 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <62916e504102003035441a009@mail.gmail.com>
Reply-To: Sujith Chennupati <sujith.chennupati@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Hey can any one help me

I am using fedora core 2 installation
Now I want to work on traffic control using layer7 filter
So for that I need to patch iptables
I am new to linux

But in my installation I cant find source code for iptables.. I am
confused where to patch it=E2=80=A6 bcoz I cant find that directory =E2=80=
=A6 I can
see the iptables as an executable file in /sbin directory=E2=80=A6 is it th=
e
location to patch??????? I did so but it didn't work out

Then when I downloaded a new iptables files from netfilter.org and
placed in /usr/src/linux and when I executed the commands as given in
a documentation page


Next up we will compile the IPtables package. To do so, enter in the
following commands from the IPtables directory.
make pending-patches KERNEL_DIR=3D/usr/src/linux
make KERNEL_DIR=3D/usr/src/linux
make install KERNEL_DIR=3D/usr/src/linux

it shows the following error

/usr/src/linux/include/linux/config.h:6:2: #error including kernel
header in userspace; use the glibc headers instead.

What does it mean? How exactly to patch iptables and where I can find
iptables directory in my installation

Help greatly appreciated ;

Looking for rescue

sujith


--=20
sujith chandra chowdhary CHENNUPATI

