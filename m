From: =?iso-8859-1?Q?Herv=E9?= <herve@lucidia.net>
Subject: Two NICS with same IP and same client IP
Date: Wed, 2 Feb 2005 09:35:31 -0000 (GMT)
Message-ID: <61246.57.66.65.39.1107336931.squirrel@57.66.65.39>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

I have a weird setup I would like to make work: I have two identical
subnets connected to one machine via two different NICs, like this:

Server             |         | Client 1
eth0:192.168.100.1 |---------| 192.168.100.2
                   |                              | Client 2
eth1:192.168.100.1 |------------------------------| 192.168.100.2

These two machines only access an NFS share on the server, but I assume
this is irrelevant: the problem is to route the packets back through the
interface the request came from (I am not trying to access the boxes
_from_ the server).

My first idea was to modify the source address as the request come in, an=
d
then route and put the original address back in the outgoing packet, but =
I
haven't found a way to do that.

Anybody got any idea?

Thanks in advance,
Herv=E9.

