From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: not [!] rule is not working
Date: Thu, 16 Aug 2007 17:07:39 +0200
Message-ID: <46C4683B.3090702@plouf.fr.eu.org>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>	<46C1BE08.6070409@riverviewtech.net>	<d41814cf0708152256w2e5e146cs7306e9e40e3b6872@mail.gmail.com>
	<46C46195.9070500@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C46195.9070500@riverviewtech.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello,

Grant Taylor a =E9crit :
> On 08/16/07 00:56, pankaj jain wrote:
>=20
>>I have a machine with 3 interfaces
>>eth0: 10.19.0.102 mask (255.255.255.0)
>>eth1: 10.19.1.102 mask (255.255.255.0)
>>eth2: 10.29.51.102 mask (255.255.255.0)
> >
>>all three are connected in a same switch (no vlans configured).  I=20
>>want arp requests to be responded by the associated interface only,=20
>>and not by other interfaces.
[...]
> Hum.  I would not think that you even needed the ARPTables rules to
> prevent the wrong interface from responding to an ARP request for
> another IP.

The default behaviour is to reply on any interface for any local=20
address. It can be changed on a per-interface basis with the kernel=20
parameter /proc/sys/net/ipv4/conf/<interface>/arp_ignore. Definitions=20
and values are in Documentation/networking/ip-sysctl.txt :

arp_ignore - INTEGER
	Define different modes for sending replies in response to
	received ARP requests that resolve local target IP addresses:
	0 - (default): reply for any local target IP address, configured
	on any interface
	1 - reply only if the target IP address is local address
	configured on the incoming interface
	2 - reply only if the target IP address is local address
	configured on the incoming interface and both with the
	sender's IP address are part from same subnet on this interface
	3 - do not reply for local addresses configured with scope host,
	only resolutions for global and link addresses are replied
	4-7 - reserved
	8 - do not reply for all local addresses

	The max value from conf/{all,interface}/arp_ignore is used
	when ARP request is received on the {interface}

