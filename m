From: Christian Lambert <clambert@sgi.com>
Subject: local NAT of connections conflicts with ftp conntrack?
Date: Sat, 25 May 2002 11:36:02 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0205251129250.6374-100000@onyx4.dhs.org>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


I enabled "local natting of connections" in the kernel so that I can
do transparent proxy from the local host itself running squid, and
I only use these two rules in the new table called "OUTPUT" for nat.

# transparent proxy for localhost
iptables -t nat -A OUTPUT -p tcp --dport 80 -m owner --uid-owner squid -j ACCEPT
iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 3128

Now the problem that I have is that when the box itself tries to ftp
to the outside world, it just hangs as soon as it does the PORT command.

Then in syslog I see a couple of these messages:

ip_conntrack: max number of expected connections 1 of ftp reached for 
<hideen ip>-><hidden ip>, reusing

Is there any way I could configure iptables to not use ftp conntrack
for the local nat or is this a bug?

I'm using kernel 2.4.19-pre7 with the newnat patch applied and h323,
but no other patches.   Iptables userspace 1.2.6a.    My POSTROUTING
of nat contains a typical SNAT setting to let my internal machines
access the internet.   

That machine running squid/iptables has direct access to the internet
and is also my a machine that I use for working on it too.  I provide access
to my laptop from it on a 2nd interface. 

I have not tested with other plugins, so I'm wondering if it might
do the same thing for IRC conntrack.

Thanks


