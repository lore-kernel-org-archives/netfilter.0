From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Change of ip addresses continues.... :(
Date: Thu, 26 Aug 2004 14:36:14 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E360@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: dravya <dravya@magma.ca>, Netfilter mailing list <netfilter@lists.netfilter.org>

First, you must understand that PREROUTING will only handle policy
routing FORWARDED traffic, and will not properly deal with traffic from
the firewall itself. Please make sure to duplicate the rules with:
"iptables -t mangle -A OUTPUT". That means, if the firewall gets an
invalid TCP connection attempt, it will send the ICMP reply out the
correct interface.=20

Ok, to make your routes, here's a pre-canned function:

You'll have to fix up the following function to create the default route
the way that ppp assigns them. What I'd do is add this to ppp's ip-up
script so that as soon as you know your new ppp address, you change the
table to reflect the new value.=20


Here 'might' be a way to do it. I don't have ppp lines so I couldn't say
if its right or not.

_mark=3D"$((`echo "${1}" | sed s/ppp//`+1))"
_ext_gw=3D"${5}";
_local_ip=3D"${4}";

route_builder "${_mark}" "${_ext_gw}" "${_local_ip}"


The following IS what I use to build routes. I'm pretty sure it'll work
as advertised.
#
# Notes:
#    This function generates a new routing table based on the currect
main
#    routing table. The difference is that the default route is user
specified.
#=20
# Arguments:
#    1 - Table ID to create
#    2 - IP Address, Gateway Address=20
#    3 - IP Address, Local Source
#
IP=3Dip
function route_builder
{
   _table_id=3D${1}
   _table_gateway=3D${2}
   _table_source=3D${3}
   if [ "${1}" !=3D "" -a "${2}" !=3D "" ]; then
      ${IP} rule del fwmark ${_table_id} table ${_table_id}
      ${IP} rule add fwmark ${_table_id} table ${_table_id}
      ${IP} route flush table ${_table_id}
      ${IP} route show table main | grep -Ev ^default
\
      | while read ROUTE ; do  =20
         ${IP} route add table ${_table_id} $ROUTE
      done
      ${IP} route add table ${_table_id} default via ${_table_gateway}
\
         src ${_table_source}
   else
      echo "route_builder: Invalid arguments specified."
   fi
}

