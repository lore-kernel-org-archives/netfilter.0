From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: to snat or to dnat .. that is the question
Date: Tue, 1 Jun 2004 10:12:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E31E@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Peter Marshall <peter.marshall@caris.com>, Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

#!/bin/bash

IPT=3D/sbin/iptables
HST_L_INET=3D"100.100.100.100"
HST_L_INTERNAL=3D"192.168.0.1"
IP_DST_LIST=3D"1.1.1.1 2.2.2.2 3.3.3.3 4.4.4.4"
PORT_LIS_LIST=3D"15000 15001 15002 15003"
PORT_DST_LIST=3D"2000 2001 2002 2003"

# This is just a demo. I'm sure bash arrays are cleaner...
_count=3D1
while [ ${_count} -lt 100 ];=20
do
   _dip=3D"`echo ${IP_DST_LIST} | awk "{print \$${_count}}"`"
   _lpt=3D"`echo ${PORT_LIS_LIST} | awk "{print \$${_count}}"`"
   _dpt=3D"`echo ${PORT_DST_LIST} | awk "{print \$${_count}}"`"
   if [ ! -z "${_dip}"  -a ! -z "${_lpt}" -a -z "${_dpt}" ]; then
      $IPT -t nat -A PREROUTING -d ${HST_L_INTERNAL} -p tcp --dport
${_lpt} -j DNAT --to ${_dip}:${_dpt}
      $IPT -t nat -A POSTROUTING -d ${_dip} -p tcp --dport ${_dpt} -j
SNAT --to-source ${HST_L_INET}
   else
      break
   fi
   _count=3D"$((${_count+1))"
done

Peter Marshall wrote:
> So ... for every nat I have going from my internal network on a
> specific port, destined to an external IP on a different port I need
> to have something like this ?
>=20
>   $IPT -t nat -A PREROUTING -d <firewall_ip> --dport 15000 -p tcp -i
>        eth0 \ -j DNAT --to-destination <some_internet_ip> --dport 2000
>=20
>   $IPT -t nat -A POSTROUTING -d <some_internet_ip> --dport 2000  -p
> tcp -o eth0 \
>        -j SNAT --to-source <firewall_ip>
>=20
> Is there a better way ???  I have about 20 routes to add .....
>=20
> Thank you for your help.
>=20
> Peter
>=20
>=20
> ----- Original Message -----
> From: "Alistair Tonner" <Alistair@nerdnet.ca>
> To: <netfilter@lists.netfilter.org>
> Sent: Tuesday, June 01, 2004 12:16 PM
> Subject: Re: to snat or to dnat .. that is the question
>=20
>=20
> On June 1, 2004 10:51 am, Peter Marshall wrote:
>> yes, my firewall is the default route on all internal boxes
>>=20
>> ----- Original Message -----
>> From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
>> To: "Peter Marshall" <peter.marshall@caris.com>; "netfilter"
>> <netfilter@lists.netfilter.org>
>> Sent: Tuesday, June 01, 2004 11:42 AM
>> Subject: RE: to snat or to dnat .. that is the question
>>=20
>>=20
>> If the box 192.168.0.20 does not have the firewall's IP as its
>> default route, then it will not work correctly (DNAT), I am not sure
>> about SNAT.=20
>>=20
>>=20
>> -----Original Message-----
>> From: netfilter-admin@lists.netfilter.org
>> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Peter
>> Marshall Sent: Tuesday, June 01, 2004 10:30 AM
>> To: netfilter
>> Subject: to snat or to dnat .. that is the question
>>=20
>> Hi again.
>>=20
>> I am at a bit of a quandary, and am not sure what to do.
>>=20
>> Let the external interface on my firewall be 100.100.100.100
>> I have an internal box; 192.168.0.20 that needs to connect to an
>> external box 200.200.200.200 on port 2000.
>>=20
>> I want the internal box to connect to hit my firewall on a different
>> port .. say 15000
>>=20
>> so basically
>>=20
>> start: .... -s 192.168.0.20 -d 200.200.200.200 --dport 15000
>> after firewall -s 100.100.100.100 -d 200.200.200.200 --dport 2000
>>=20
>> How can I do this ?
>>=20
>> I started out with:
>>=20
>> $IPT -t nat -A POSTROUTING -d 200.200.200.200 --dport 15000 -p tcp
>>        -i eth0 \ -j SNAT --to-source 100.100.100.100
>>=20
>> But this does not change the destination port (obviously). I thought
>> about doing the following
>>=20
>> $IPT -t nat -A PREROUTING -d 100.100.100.100 --dport 15000 -p tcp -i
>>          eth0 \ -j DNAT --to-destination 200.200.200.200 --dport 2000
>=20
>> However, I don't think that this will change my source address.=20
>> Also, will this even forwarded the packets ?  They would be coming
>> on the input chain would they not ?
>=20
> Since you've done this in PREROUTING no, they wont hit the INPUT
> chain. This is where to start.
>>=20
>>=20
>=20
> You need then to have a FORWARD rule to allow the packets, and
> ESTABLISHED,RELATED, and then in POSTROUTING add a rule to SNAT those
> packets
> destined to 200.200.200.200:2000 ( you could, if need be, add the
> source to the rule as well)
>> Thank you for the help.
>> Peter Marshall
>>=20
>>=20
>> Peter Marshall, BCS
>> Network Administrator, CARIS
>> 115 Waggoners Lane, Fredericton NB, E3B 2L4 CANADA
>=20
>=20
> Alistair Tonner
> -- from slightly west of there, on the last lake
> T.O.

