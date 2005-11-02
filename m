From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Re: iptables problem
Date: Wed, 2 Nov 2005 09:01:27 +0100 (CET)
Message-ID: <56523.193.173.147.3.1130918487.squirrel@webmail.sterenborg.info>
References: <4367AEA5.7080501@pcraft.com>	<43a0cdcb0511011631k1bd1cfci@mail.gmail.com>
	<43681694.1040406@pcraft.com> <436868D1.4080508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436868D1.4080508@gmail.com>
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
To: Nikolai Georgiev <voyager123bg@gmail.com>
Cc: "Ashley M. Kirchner" <ashley@pcraft.com>, netfilter@lists.netfilter.org

On Wed, November 2, 2005 08:20, Nikolai Georgiev wrote:
>>    Problem is that while they can connect OUT, nothing from the
>> outside can connect to them.
>>
> Hello there, i think this should do
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -A INPUT --dst $YOUR_IP -m state --state ESTABLISHED,RELATED
> -j ACCEPT
> iptables -A OUTPUT --src $YOUR_IP -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT

The INPUT and OUTPUT chains are for local traffic.
These kiosk hosts are probably *behind* iptables, so traffic will
travel through the FORWARD chain.

If you need external connections forwarded to hosts behind the
firewall, you need DNAT rules to make it happen.

In this case, the OP has 3 hosts to wich he wants to connect ("nothing
from the outside can connect to them", outgoing connections are
already working).
FTP only uses port 21/tcp (and 20). It's to my knowledge not possible
to forward 1 port to 3 hosts simultaneously (if that would do any
good), so he'll need to assign different ports for the second and
third host.
Something like :
21/tcp -> host 1
41/tcp -> host 2
61/tcp -> host 3
(if these ports are free).


Gr,
Rob



