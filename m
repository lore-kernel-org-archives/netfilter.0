From: "Peter Hurley" <phurley@charter.net>
Subject: Newbie: need help with table rules
Date: Fri, 14 Feb 2003 08:33:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2d42d$9a9184c0$3201a8c0@BEOWULF>
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

Jean-Christian Imbeault wrote:

> Doh! So true. Ok, now I have fixed that but I still cannot get to SSH.

Based on your earlier post, I'm assuming that "JC" is the machine that
you're installing this on, and you want to be able to originate
connections (HTTP, SSH, etc) from that machine, but not allowing
connections originating from other machines.  If that's the case, then
your script should be like:

$IPT --policy INPUT   DROP
$IPT --policy OUTPUT  ACCEPT
$IPT --policy FORWARD DROP

$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -p icmp -j ACCEPT
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

The situation for you're SSH connection is this:

JC      |                  | LINUX
        |                  |
 (1068) |<---------------->| SSH (22)

Your SSH connection is *to* port 22 on "LINUX" and *from* port whatever
on "JC" (because the SSH client on "JC" will just get an available
socket).
This means that on the OUTPUT chain the packet will look like:
	out=eth0  src= "JC":1068  dest= "LINUX":22
The reply packet from LINUX will come in on the INPUT chain and look
like:
      in=eth0  src="LINUX":22  dest="JC":1068
That's why your INPUT chain rules (HTTP/HTTPS/SSH/whatever) wouldn't
match.

The state match rules on the INPUT chain will match packets that "JC"
has *seen* before: basically meaning packets that have left the OUTPUT
chain (there are some exceptions).

Unless you're hosting HTTP server, HTTPS server, SSH server or DNS
server your other INPUT chain rules aren't doing anything.

Also, I took the liberty of removing your other OUTPUT rules since
you're policy is ACCEPT.

Sincerely,

Peter Hurley
phurley@imaginexd.com

PS - Sorry, that this isn't a thread reply.  I don't have delivery setup
yet.


