From: Kim Jensen <kimj@dawn.dk>
Subject: Re: IP TOS based routing
Date: Thu, 27 Mar 2003 15:32:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303271532.47275.kimj@dawn.dk>
References: <3E80187B.5030209@cs.helsinki.fi> <200303261316.35019.kimj@dawn.dk> <3E82A91F.7000108@cs.helsinki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E82A91F.7000108@cs.helsinki.fi>
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
To: Simone Leggio <simone.leggio@cs.helsinki.fi>
Cc: netfilter@lists.netfilter.org

On Thursday 27 March 2003 08:32, Simone Leggio wrote:
> At the moment I have a test network where I send traffic from host A to
> host B generating it with a proper traffic generator (for example MGEN)=
,
> which allows also to set the DS (or IP TOS) field.
> Does iptables understand the value set before with the traffic generato=
r
> or I have to set the field with the mangle table?
> What I was thinking to type to discriminate the output interface was:
>
> iptables -A FORWARD -p tcp -m tos --tos TOS -o INTERFACE -j ACCEPT
>
> With TOS equal to the value set by the traffic generator. Would it work=
?
>
Hi Simone,

Ensure that you have one routing table for each interface, then use the=20
command:

$ip rule add fwmark x table y

Then add a mangle entry in your prerouting table, which looks at the tos =
you=20
wish to match:

$iptables -t mangle -A PREROUTING -p tcp -m tos --tos TOS -j MARK --set-m=
ark x

That should hopefully do it. The script for copying your routing table is=
=20
available in the link: http://linux-ip.net/html/adv-multi-internet.html.

hope this helps

/Kim


