From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: redirecting everything to another machine
Date: Fri, 21 Mar 2003 16:40:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303211640.45458.netfilter@newkirk.us>
References: <1048207207.6972.1360.camel@xavier>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048207207.6972.1360.camel@xavier>
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
To: Dan Cox <dancox@speakeasy.net>, netfilter@lists.netfilter.org

On Thursday 20 March 2003 07:40 pm, Dan Cox wrote:
> With iptables how would I redirect all connection attempts coming from
> the Internet interface to a machine inside my DMZ? I also have a LAN
> that I have "masqueraded" though I don't know if thats related. My set
> up is below:
>
> Internet IP/iface =3D eth0 1.2.3.4
> LAN IP/iface =3D eth1 192.168.0.1
> DMZ IP/iface =3D eth2 192.168.1.1

iptables -t nat -A PREROUTING -m state --state NEW -d 1.2.3.4 -p DNAT=20
--to 192.168.1.x

The NEW match will send new connection attempts to the DNAT IP.  Anything=
=20
already ESTABLISHED or RELATED will go where it is supposed to, IE=20
replies to connections from the LAN will go back the the machine they=20
were SNATted from, continued inbound traffic that is part of a DNATted=20
connection to the DMZ will continue to go to the DNATted IP in the DMZ.

Make sure your SNAT or MASQUERADE for traffic from the LAN is applied=20
ONLY to traffic from the LAN by matching "-i eth1" in that rule.

j


> Any help is very much appreciated. Thanks
>
> Dan Cox


