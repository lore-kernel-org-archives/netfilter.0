From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: MASQUERADING problem under iptables 1.2.8 - kernel 2.4.20
Date: Tue, 27 May 2003 21:04:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D08@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: duvault@efrei.fr, netfilter@lists.netfilter.org

Did the MASQUERADE module compile for 1.2.8?

did you go to /usr/src/linux and do a make menuconfig (or whatever) and =
check that ALL of the modules required are ticked and ready for =
compiling???

is there any of these files on your system (mine's been over upgraded ;)

/lib/modules/2.4.2-2/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o
/lib/modules/2.4.16/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o
/lib/modules/2.4.19/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o

if not then that's why....

-----Original Message-----
From: Julien Duvault [mailto:duvault@efrei.fr]
Sent: Monday, May 26, 2003 8:18 AM
To: netfilter@lists.netfilter.org
Subject: MASQUERADING problem under iptables 1.2.8 - kernel 2.4.20


Hi,

I'm contacting you, as I've a problem with netfilter. Let's sum up the
situation :
The system I'am reunning is a linux/debian woody, this host is acting as =
a
router, and gateway, for my home network over an ADSL link. I used to =
have
the default stable iptables package 1.2.6 (if I am not wrong) with =
kernel
2.4.18. Every thing were find, I was happy. I decided to upgrade to =
kernel
2.4.20 and iptables 1.2.8 and all patches. Since that time, I can't use
anymore the MASQUERADE target with kernel 2.4.20 (the modules are =
corectly
loaded ...). The amazing thing is that it perfectly working on kernel
2.4.18 with the same version of iptables.
So is there a bug somewhere in the combination of iptables
1.2.8/kernel-2.4.20 ? I don t think so because i didn t find any
informations about such a problem ... Maybe something happen during my
compilation of 2.4.20 which make MASQUERADE not working ?
So if someone here have information, I would be very happy to solve this
problem.
Thanks,

Julien.

--=20
BOFH excuse #149 : Insert coin for new game





