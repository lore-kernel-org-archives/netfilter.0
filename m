From: Nick Taylor <nickt@lightlink.com>
Subject: Trying to use NETMAP for 1-1 NAT
Date: Sun, 14 Mar 2004 22:57:18 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am posting a newbie question here, so I hope for your patience with me.
We have had an unsolved problem which is driving us crazy for quite a
while, and I stumbled upon the NETMAP patch, which seems to do exactly
what we require.  Unfortunately, I haven't been able to use the module,
and I'm hoping someone on the list can point me in the right direction.
Thanks in advance for your help.

We have a remote office with a T1 line, which is quite expensive for us to
maintain, and saturates frequently.  We wish to increase the bandwidth
available to us, and our remote office is close enough to use DSL over
bare copper which our telco will provision for us, so the problem is
multiplexing over the various DSL modems.  If someone has a clever scheme
for this already, I would love to hear about it, I could obviate the need
for the NETMAP module.  However, the following details what I want to do,
and where in the process I stopped...

Many, many netblocks are routed from our main office to the remote
office.  The DSL modems we use, however, are only capable of storing 8
routes, so we figured we could 1:1 NAT each of the subnets of interest into
a large private space, send it across the DSL modems, and 1:1 NAT it back
to the real IP addresses at the other end.  The other option we thought of
was to use the modems as bridges, but it seems this would require a
seperate (physical) interface in the linux box at each end for each modem.
While this solution would work right now, it doesn't scale well.

So, enter NETMAP...

I downloaded linux-2.4.25.tar.gz from ftp.kernel.org, and after a few
attempts got a kernel that worked for everything else I needed.  I got the
patch-o-matic as per the instructions in
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.html
.

I patched my kernel with NETMAP, turned it on in make menuconfig, did:
make dep && make bzImage && make modules && make modules_install
cp arch/i386/boot/bzImage /boot/vmlinux-2.4.25-patched
lilo
reboot


Then I played with:
iptables -t nat -A POSTROUTING -s 192.168.33.0/24 -j NETMAP --to \
   192.168.44.0/24

which gives the error:
iptables v1.2.7a: Unknown arg `--to'

so, I try:
iptables -t nat -A POSTROUTING -s 192.168.33.0/24 -j NETMAP
iptables v1.2.7a: Couldn't load target
`NETMAP':/usr/lib/iptables/libipt_NETMAP.so: cannot open shared object file: No such file or directory

Right...
find / -regex '.*NETMAP.*' -print
...
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ipt_NETMAP.o
...

Okay, so it's a kernel module, not a shared object, and that's what I
expected...  so, maybe I need to modprobe it?  That has exactly the
same results.  Maybe the userspace tool needs an update?  Following
instructions again found in
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.html,
I do:
cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic co netfilter/userspace
cvs server: warning: new-born netfilter/userspace has disappeared

Uh, oh!  Now I am stuck.  Is there a new location I should be looking for
the userspace?  Is updating the userspace the right thing to be doing?  Is
this patch "not right" on 2.4.25?  Anyone have any other suggestions what
I should do?

Thanks for your help!

