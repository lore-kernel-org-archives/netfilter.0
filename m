From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: Error compiling iptables-1.2.7a
Date: Wed, 11 Dec 2002 14:36:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B32154A704@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2A11A.44F5DB60"
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
To: "'Netfilter (netfilter@lists.netfilter.org)'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2A11A.44F5DB60
Content-Type: text/plain

Hi,

I tried to compile :
- kernel-2.4.20
- Patched with POM-20021208
- iptables-1.2.7a

Compiling the kernel is no problem.
When executing KERNEL_DIR=/data/download/kernel/linux-2.4.20 make, I get
this error :

ld -shared -o extensions/libipt_quota.so extensions/libipt_quota_sh.o
cc -O2 -Wall -Wunused -I/data/download/kernel/linux-2.4.20/include
-Iinclude/ -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o
extensions/libipt_ROUTE_sh.o -c extensions/libipt_ROUTE.c
extensions/libipt_ROUTE.c: In function `parse':
extensions/libipt_ROUTE.c:61: structure has no member named `if_name'
extensions/libipt_ROUTE.c:64: structure has no member named `if_name'
extensions/libipt_ROUTE.c:66: structure has no member named `if_name'
extensions/libipt_ROUTE.c:66: structure has no member named `if_name'
extensions/libipt_ROUTE.c:66: structure has no member named `if_name'
extensions/libipt_ROUTE.c:67: structure has no member named `if_index'
extensions/libipt_ROUTE.c:80: structure has no member named `if_name'
extensions/libipt_ROUTE.c:81: structure has no member named `if_index'
extensions/libipt_ROUTE.c:86: structure has no member named `if_index'
extensions/libipt_ROUTE.c: In function `print':
extensions/libipt_ROUTE.c:119: structure has no member named `if_name'
extensions/libipt_ROUTE.c:120: structure has no member named `if_name'
extensions/libipt_ROUTE.c:122: structure has no member named `if_index'
make: *** [extensions/libipt_ROUTE_sh.o] Error 1

extensions/libipt_ROUTE.c says :
[Line 61]
if (strlen(optarg) > sizeof(route_info->if_name) - 1)
        exit_error(PARAMETER_PROBLEM,
                   "Maximum interface name length %u",
                   sizeof(route_info->if_name) - 1);
[Line 47]
struct ipt_route_target_info *route_info =
        (struct ipt_route_target_info*)(*target)->data;
[Line 12]
#include <linux/netfilter_ipv4/ipt_ROUTE.h>

[root@testfw extensions]# locate ipt_ROUTE.h
/data/download/kernel/linux-2.4.20/include/linux/netfilter_ipv4/ipt_ROUTE.h

/data/download/kernel/linux-2.4.20/include/linux/netfilter_ipv4/ipt_ROUTE.h
says :
struct ipt_route_target_info {
        char ifname[IPT_ROUTE_IFNAMSIZ];
        unsigned int ipto;
};

I changed
"char ifname[IPT_ROUTE_IFNAMSIZ];" into 
"char if_name[IPT_ROUTE_IFNAMSIZ];"
and now it only complains about not having an "if_index" member :

ld -shared -o extensions/libipt_quota.so extensions/libipt_quota_sh.o
cc -O2 -Wall -Wunused -I/data/download/kernel/linux-2.4.20/include
-Iinclude/ -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o
extensions/libipt_ROUTE_sh.o -c extensions/libipt_ROUTE.c
extensions/libipt_ROUTE.c: In function `parse':
extensions/libipt_ROUTE.c:67: structure has no member named `if_index'
extensions/libipt_ROUTE.c:81: structure has no member named `if_index'
extensions/libipt_ROUTE.c:86: structure has no member named `if_index'
extensions/libipt_ROUTE.c: In function `print':
extensions/libipt_ROUTE.c:122: structure has no member named `if_index'
make: *** [extensions/libipt_ROUTE_sh.o] Error 1

Now my experimenting stops : I sure don't know anything about some if_index.
I just checked out the latest POM and ipt_route_target_info still has the
same structure.
Is this something that should be corrected or what am I doing wrong ?


Rob

------_=_NextPart_001_01C2A11A.44F5DB60
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>Error compiling iptables-1.2.7a</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Hi,</FONT>
</P>

<P><FONT SIZE=3D2>I tried to compile :</FONT>
<BR><FONT SIZE=3D2>- kernel-2.4.20</FONT>
<BR><FONT SIZE=3D2>- Patched with POM-20021208</FONT>
<BR><FONT SIZE=3D2>- iptables-1.2.7a</FONT>
</P>

<P><FONT SIZE=3D2>Compiling the kernel is no problem.</FONT>
<BR><FONT SIZE=3D2>When executing =
KERNEL_DIR=3D/data/download/kernel/linux-2.4.20 make, I get this error =
:</FONT>
</P>

<P><FONT SIZE=3D2>ld -shared -o extensions/libipt_quota.so =
extensions/libipt_quota_sh.o</FONT>
<BR><FONT SIZE=3D2>cc -O2 -Wall -Wunused =
-I/data/download/kernel/linux-2.4.20/include -Iinclude/ =
-DIPTABLES_VERSION=3D\&quot;1.2.7a\&quot;&nbsp; -fPIC -o =
extensions/libipt_ROUTE_sh.o -c extensions/libipt_ROUTE.c</FONT></P>

<P><FONT SIZE=3D2>extensions/libipt_ROUTE.c: In function =
`parse':</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:61: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:64: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:66: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:66: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:66: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:67: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:80: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:81: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:86: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c: In function =
`print':</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:119: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:120: structure has no =
member named `if_name'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:122: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>make: *** [extensions/libipt_ROUTE_sh.o] Error =
1</FONT>
</P>

<P><FONT SIZE=3D2>extensions/libipt_ROUTE.c says :</FONT>
<BR><FONT SIZE=3D2>[Line 61]</FONT>
<BR><FONT SIZE=3D2>if (strlen(optarg) &gt; =
sizeof(route_info-&gt;if_name) - 1)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
exit_error(PARAMETER_PROBLEM,</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Maximum interface =
name length %u&quot;,</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
sizeof(route_info-&gt;if_name) - 1);</FONT>
<BR><FONT SIZE=3D2>[Line 47]</FONT>
<BR><FONT SIZE=3D2>struct ipt_route_target_info *route_info =3D</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (struct =
ipt_route_target_info*)(*target)-&gt;data;</FONT>
<BR><FONT SIZE=3D2>[Line 12]</FONT>
<BR><FONT SIZE=3D2>#include =
&lt;linux/netfilter_ipv4/ipt_ROUTE.h&gt;</FONT>
</P>

<P><FONT SIZE=3D2>[root@testfw extensions]# locate ipt_ROUTE.h</FONT>
<BR><FONT =
SIZE=3D2>/data/download/kernel/linux-2.4.20/include/linux/netfilter_ipv4=
/ipt_ROUTE.h</FONT>
</P>

<P><FONT =
SIZE=3D2>/data/download/kernel/linux-2.4.20/include/linux/netfilter_ipv4=
/ipt_ROUTE.h says :</FONT>
<BR><FONT SIZE=3D2>struct ipt_route_target_info {</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char =
ifname[IPT_ROUTE_IFNAMSIZ];</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned =
int ipto;</FONT>
<BR><FONT SIZE=3D2>};</FONT>
</P>

<P><FONT SIZE=3D2>I changed</FONT>
<BR><FONT SIZE=3D2>&quot;char ifname[IPT_ROUTE_IFNAMSIZ];&quot; into =
</FONT>
<BR><FONT SIZE=3D2>&quot;char if_name[IPT_ROUTE_IFNAMSIZ];&quot;</FONT>
<BR><FONT SIZE=3D2>and now it only complains about not having an =
&quot;if_index&quot; member :</FONT>
</P>

<P><FONT SIZE=3D2>ld -shared -o extensions/libipt_quota.so =
extensions/libipt_quota_sh.o</FONT>
<BR><FONT SIZE=3D2>cc -O2 -Wall -Wunused =
-I/data/download/kernel/linux-2.4.20/include -Iinclude/ =
-DIPTABLES_VERSION=3D\&quot;1.2.7a\&quot;&nbsp; -fPIC -o =
extensions/libipt_ROUTE_sh.o -c extensions/libipt_ROUTE.c</FONT></P>

<P><FONT SIZE=3D2>extensions/libipt_ROUTE.c: In function =
`parse':</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:67: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:81: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:86: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c: In function =
`print':</FONT>
<BR><FONT SIZE=3D2>extensions/libipt_ROUTE.c:122: structure has no =
member named `if_index'</FONT>
<BR><FONT SIZE=3D2>make: *** [extensions/libipt_ROUTE_sh.o] Error =
1</FONT>
</P>

<P><FONT SIZE=3D2>Now my experimenting stops : I sure don't know =
anything about some if_index.</FONT>
<BR><FONT SIZE=3D2>I just checked out the latest POM and =
ipt_route_target_info still has the same structure.</FONT>
<BR><FONT SIZE=3D2>Is this something that should be corrected or what =
am I doing wrong ?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2A11A.44F5DB60--

