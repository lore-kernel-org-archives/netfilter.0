From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Fairly complex multi-ISP firewall/router problem
Date: Fri, 2 Apr 2004 15:45:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F3B@alderaan.smgtec.com>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Friday 02 April 2004 10:36 pm, John A. Sullivan III wrote:
>=20
>> On Fri, 2004-04-02 at 15:57, Bill Davidsen wrote:
>>>=20
>>> All I want to do is send packets out the interface which matches the
>>> source IP, and I don't think there's any reasonable way to get there
>>> without patches or BSD.
>>=20
>> Hmmm . . . I admit to not having tried this and only giving it five
>> minute's thought but I'm not sure I see the problem.  Well, I see why
>> one can't be guaranteed to send the packet out the same interface but
>> I'm not sure why that is a problem.
>=20
> Some ISPs block packets with source addresses not matching their own
> network range, as a contribution to blocking spoofed packets.

This is a very real issue, especially when they're only consumer grade.

What I've used to fix the problem is to use the CONNMARK extension on
the PREROUTING step of mangle. Here, I can set the appropriate routes
and everything that uses CONNMARK will work fine.

Eg:
IPT_NOMARK=3D"-m mark --mark 0"
IPT_MARKED=3D"-m mark ! --mark 0"

${IPTABLES} -t mangle -A PREROUTING -j CONNMARK --restore-mark
# MARK packets that are inbound from INET3/INET4 to leave the same
interface
# You also get related traffic leaving the related session's route for
free
${IPTABLES} -t mangle -A PREROUTING ${IPT_NOMARK} -i ${IF_INET3} -j MARK
--set-mark ${RTABLE_INET3}
${IPTABLES} -t mangle -A PREROUTING ${IPT_NOMARK} -i ${IF_INET4} -j MARK
--set-mark ${RTABLE_INET4}
${IPTABLES} -t mangle -A PREROUTING -j CONNMARK --save-mark

You can setup something similar for outgoing sessions. I don't do it,
but there's nothing stopping you from it.


>> In the case of an interface or ISP failure, I assume you would
>> disable the interface which would eliminate the route.
>=20
> That's not necessarily a difficult task (bringing it back up again
> afterwards is not entirely trivial, however), but if the problem can
> be solved without sending all outbound traffic across a single
> connection, and leaving the other one largely idle, it would be a
> better solution.=20

As described above, you can use typical iptables matching to do policy
routing based on any layer supported by iptables.

This example would create equalized load balancing based on NEW sessions
${IPTABLES} -t mangle -A PREROUTING ${IPT_NOMARK} -i ${IF_INTERNAL} -m
nth --every 2 --packet 0 -j MARK --set-mark ${RTABLE_INET3}
${IPTABLES} -t mangle -A PREROUTING ${IPT_NOMARK} -i ${IF_INTERNAL} -m
nth --every 2 --packet 1 -j MARK --set-mark ${RTABLE_INET4}

My RTABLES have all the rules from my main table, with the exception of
the default route. This allows for overly broad iptables connmark rules
without breaking the routing of other interfaces.

This is my routing table builder:

function route_builder
{
   if [ "${OPT_SYS_ROUTER}" =3D "0" -o "${OPT_ROUTER_POLICYROUTING}" =3D =
"0"
]; then
      info "route_builder: Policy Routing is disabled. Skipping."
      return 1
   fi
   _table_id=3D${1}
   _table_gateway=3D${2}
   _table_source=3D${3}
   if [ "${1}" !=3D "" -a "${2}" !=3D "" ]; then
      ${IP} rule del fwmark ${_table_id} table ${_table_id}
      ${IP} rule add fwmark ${_table_id} table ${_table_id}
      ${IP} route flush table ${_table_id}
      ${IP} route show table main | grep -Ev ^default
\
      | while read ROUTE ; do
         ${IP} route add table ${_table_id} $ROUTE
      done
      ${IP} route add table ${_table_id} default via ${_table_gateway}
\
         src ${_table_source}
   else
      info "route_builder: Invalid arguments specified."
   fi
}

