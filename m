From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Can't use iptables -m string with any RedHat distri
Date: Tue, 3 Jun 2003 10:46:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D90@wardrive.citadelcomputer.com.au>
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
To: olivier <netfilter.org@olivier.us>, netfilter@lists.netfilter.org

Don't use the version that comes with RedHat but download the latest =
iptables version with it's companion patch-o-matic.. then patch the =
latest kernel with the latest iptables and use patch-o-matic to add the =
string module in. it's not standard on the distros...

I have 2.4.19 and 1.2.7a and all is well in the land of Oz... ;)

I don't recommend 1.2.8 with 2.4.20 if your new to kernel compiling and =
patching...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: olivier [mailto:netfilter.org@olivier.us]
Sent: Tuesday, June 03, 2003 8:58 AM
To: netfilter@lists.netfilter.org
Subject: Can't use iptables -m string with any RedHat distri


Hello All !


I have been having this problem for quite a while and decided to make a =
post
about it.
If you run a RedHat distri, and don't want to compile anything, just =
using
RPM (especially if you plan to maintain your server with RHN), you get =
this
error trying to use the string matching option:

# iptables -A INPUT -j ACCEPT -m string --string HELLO
iptables v1.x.x: Couldn't load match
`string':/lib/iptables/libipt_string.so: cannot open shared object file: =
No
such file or directory

Where is this library ?
# find / -name libipt_string.so
#
Hmmm... Obviously not included in any of the iptables RPMs provided by
redhat.

So I downloaded the matching iptables1.x.x.tar.bz2 from netfilter.org, =
and
found the libipt_string.c in there.
With a "make", this library doesn't get compiled...

OK, then I will compile it myself, then:
cc -O2 -Wall -I etc.. etc...

ipt_strings.h not found...

and can't seem to find this file anywhere.. not even in the redhat =
kernel
source rpm ....


Anybody has an idea on how to make "iptables --m string" work with =
RedHat ?


Thanks All !!!




