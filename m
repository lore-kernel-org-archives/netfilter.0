From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: TTL target
Date: Fri, 23 Jul 2004 14:34:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511EA@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: "Gonzalez, Federico" <fgonzalez@goyaike.com.ar>, netfilter@lists.netfilter.org

hmmm...  can you provide the output of "lsmod | grep ip"

are you running the stock kernel/iptables?  what distro/version are you =
running?  sounds like you're missing something module-wise.

-j

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gonzalez,
Federico
Sent: Friday, July 23, 2004 2:29 PM
To: Jason Opperisano; netfilter@lists.netfilter.org
Subject: Re: TTL target


I get the following error:

iptables: No chain/target/match by that name

Thanks
----- Original Message -----=20
From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
To: "Gonzalez, Federico" <fgonzalez@goyaike.com.ar>;
<netfilter@lists.netfilter.org>
Sent: Friday, July 23, 2004 3:21 PM
Subject: RE: TTL target


um--on fedora core 1--which seems to match the versions you provide, the =
TTL
match target is there.

$ uname -r
2.4.22-1.2197.nptl

$ iptables -V
iptables v1.2.9

# iptables -A INPUT -m ttl --ttl-eq 1 -j DROP
#

# iptables -vnL INPUT
Chain INPUT (policy DROP 184 packets, 19161 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0           TTL match TTL =3D=3D 1

-j

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gonzalez,
Federico
Sent: Friday, July 23, 2004 1:52 PM
To: netfilter@lists.netfilter.org
Subject: TTL target


Hi,

I have iptables 1.2.9, red hat kernel 2.4.22 and i need to use the TTL
target to change the packets TTL.

How do i enable this functionality ?

Thank you.


