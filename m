From: "olivier" <netfilter.org@olivier.us>
Subject: Can't use iptables -m string with any RedHat distri
Date: Mon, 2 Jun 2003 15:58:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01ca01c3295a$742086b0$16199340@xpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello All !


I have been having this problem for quite a while and decided to make a post
about it.
If you run a RedHat distri, and don't want to compile anything, just using
RPM (especially if you plan to maintain your server with RHN), you get this
error trying to use the string matching option:

# iptables -A INPUT -j ACCEPT -m string --string HELLO
iptables v1.x.x: Couldn't load match
`string':/lib/iptables/libipt_string.so: cannot open shared object file: No
such file or directory

Where is this library ?
# find / -name libipt_string.so
#
Hmmm... Obviously not included in any of the iptables RPMs provided by
redhat.

So I downloaded the matching iptables1.x.x.tar.bz2 from netfilter.org, and
found the libipt_string.c in there.
With a "make", this library doesn't get compiled...

OK, then I will compile it myself, then:
cc -O2 -Wall -I etc.. etc...

ipt_strings.h not found...

and can't seem to find this file anywhere.. not even in the redhat kernel
source rpm ....


Anybody has an idea on how to make "iptables --m string" work with RedHat ?


Thanks All !!!



