From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Sat, 8 Jun 2002 10:48:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206080948.g589maA32732@Networker.rockstone.co.uk>
References: <1023528718.3d01cf0e162e2@mail.rdsbv.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023528718.3d01cf0e162e2@mail.rdsbv.ro>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Saturday 08 June 2002 1:01 pm, g38@rdsbv.ro wrote:

> echo "Cleaning ..."
> for i in filter nat mangle
> do
> $IPT -t $i -F
> $IPT -t $i -X
> done

-F is a good idea, but you can't do -X (delete chain) on the built-in chains; 
only user-defined ones.

> echo "Initial rules ..."
> $IPT -P INPUT ACCEPT
> $IPT -P OUTPUT ACCEPT
> $IPT -P FORWARD DROP

I would recommend setting default policy on your INPUT chain to DROP as well, 
and then allow in only what you want...

> $IPT -t nat -A POSTROUTING -s  192.168.20.0/24 -o eth1 -j MASQUERADE
> $IPT -t nat -A POSTROUTING -d  192.168.20.0/24 -o eth1 -j MASQUERADE

No, you only want the first one of these rules.    I'm assuming that eth1 is 
your external interface.

> echo -e "- Enabling SNAT (MASQUERADE) funtionality on eth0"
> $IPT -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Maybe I'm wrong in thinking that eth1 is your external interface ?   Please 
can you tell us what eth0and eth1 are connected to (and where networks 
192.168.20.0 and 192.168.10.0 are connected ?


The rest looks pretty good to me.


Antony.

