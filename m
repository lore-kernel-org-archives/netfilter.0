From: Straxus <straxus@gmail.com>
Subject: Restricting access to certain network interfaces for certain users
Date: Sun, 16 Jan 2005 13:12:20 -0500
Message-ID: <f8b495370501161012bc31285@mail.gmail.com>
Reply-To: Straxus <straxus@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I've been redirected to this list in the hope that someone here can
find a solution to my problem.

I'm trying to limit which network interfaces a given user can access.
I have two network cards (eth0 and eth1), and I've set up all sorts of
virtual interfaces (eth0:0, eth0:1, etc) to give the cards multiple IP
addresses.

Basically, I want a given user to be restricted to using a given
virtual interface (e.g. eth0:3) for all of their network transactions.
The behaviour that I'm seeing right now is that, when a user uses a
program that listens to e.g. local port 12345, it's grabbing all of
the traffic that comes into any of the virtual interfaces on port
12345. The netstat -tupan output for this program looks like:

Proto: udp
Recv-Q: 0
Send-Q: 0
Local Address: 0.0.0.0:12345
Foreign Address: 0.0.0.0:*
State: [none listed]
PID/Program name: [pid]/[progname]

 As a result, when the second user tries to use the same program that
binds to the same port, one of the apps gets nothing since the other
instance is grabbing them all. As a side note, the port that this
program uses is hard-coded, and I can't modify it since it's in
proprietary software land.

I've looked at things like http://sourceforge.net/projects/jail/,
which provides a jail-like toolkit for Linux, however as far as I can
tell this version of Jail lacks the IP binding that is present in
FreeBSD's version of Jail (which would be perfect for my needs). I've
also seen the Linux VServer at http://linux-vserver.com/, however it
requires a kernel patch, and I'm wary of anything that integrates that
deep into the kernel (not to mention that upgrading with security
patches and such would be come a lot more difficult if I'm using a
modified kernel).

Is there any way to only permit a user to access/bind to a given
network interface or a given IP address using netfilter and iptables,
or am I basically up the creek on this one?

Thanks,
-- 

-=Straxus=-

