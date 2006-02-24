From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: updated iptables doesn't work with old rules
Date: Fri, 24 Feb 2006 13:22:10 +0100 (CET)
Message-ID: <54682.193.173.147.3.1140783730.squirrel@webmail.sterenborg.info>
References: <5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
	<000301c6390b$3ff8eee0$0101000a@sterenborg.info>
	<5f56302b0602240214g1ea15a6ah4634a5a78d5bc5dc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602240214g1ea15a6ah4634a5a78d5bc5dc@mail.gmail.com>
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

On Fri, February 24, 2006 11:14, Daniel Nogradi wrote:
> Hi Rob, thanks a lot for the enlightening remarks.

Erm, well, I hope it was and that I didn't make a mistake anywhere.. ;-)

>> > And I'm also quite confused about eth0/ppp0, perhaps a related
>> > issue is that the kernel ip table of 'machine A' is
>> >
>> > Destination    Gateway        Genmask         Iface
>> > 213.191.89.30     *           255.255.255.255 ppp0
>> > 192.168.10.0      *           255.255.255.0   eth1
>> > 192.168.10.0      *           255.255.255.0   eth0
>> > 169.254.0.0       *           255.255.0.0     eth0
>> > default        213.191.89.30  0.0.0.0         ppp0

> Okay, so it's a routing problem. I guess in order to change that and
> make it right is through the ifcfg-eth0, ifcfg-eth1, ifcfg-ppp0 files,
> isn't it? At the moment they are (on 'machine A'):

Yes.

> DEVICE=3Deth1
> BOOTPROTO=3Dnone
> BROADCAST=3D192.168.10.255
> IPADDR=3D192.168.10.101
> NETMASK=3D255.255.255.0
> NETWORK=3D192.168.10.0
> ONBOOT=3Dyes
> TYPE=3DEthernet
> GATEWAY=3D192.168.10.254

This NIC seems to be connected to your hub/switch/machine B.
I'd say, because machine A -> internet works, put this one on the
192.168.11.0/24 network and machine B also. (You don't want to change thi=
ngs
that are already working.)

Change :
BROADCAST=3D192.168.11.255
IPADDR=3D192.168.11.1
NETWORK=3D192.168.11.0
GATEWAY=3D192.168.11.1

> DEVICE=3Deth0
> BROADCAST=3D192.168.10.255
> IPADDR=3D192.168.10.105
> NETMASK=3D255.255.255.0
> NETWORK=3D192.168.10.0
> TYPE=3DEthernet
> ONBOOT=3Dyes
> GATEWAY=3D192.168.10.254

Because you can use the internet on machine A, I suppose the config for e=
th0
is correct.

> USERCTL=3Dyes
> BOOTPROTO=3Ddialup
> NAME=3DDSLppp0
> DEVICE=3Dppp0
> TYPE=3DxDSL
> ONBOOT=3Dyes
> PIDFILE=3D/var/run/pppoe-adsl.pid
> FIREWALL=3DMASQUERADE
> PING=3D.
> PPPOE_TIMEOUT=3D80
> LCP_FAILURE=3D3
> LCP_INTERVAL=3D20
> CLAMPMSS=3D1412
> CONNECT_POLL=3D6
> CONNECT_TIMEOUT=3D60
> DEFROUTE=3Dyes
> SYNCHRONOUS=3Dno
> ETH=3Deth1
> PROVIDER=3DDSLppp0
> USER=3D02024784362
> PEERDNS=3Dyes
> DEMAND=3Dno
> PERSIST=3Dno

You shouldn't have to do anything here. It works already.

> So I need to modify the NETWORK and GATEWAY parameters for eth0 and/or =
eth1?

No, only eth1 :-)
And look back at the rules that I replied with earlier. I think those sho=
uld
work for you.

If this doesn't work then I would start adding a log rule at the end of t=
he
FORWARD chain, right before packets are dropped, and see when/why packets=
 are
dropped.


Gr,
Rob



