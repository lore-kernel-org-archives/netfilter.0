From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: iptables dnat to loopback
Date: Fri, 6 Aug 2004 08:48:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051248@asimail2.alphanumeric.com>
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
To: netfilter@lists.netfilter.org

> I have a rather busy server box hosting several web
> sites in separate independent installation directories,
> which means several apache, mysql and tomcat installations
> running simultaneously, with each mysql instance binding
> a port in the loopback interface.
>
> So, while this iptables rule does work for port forwarding
> to another host:
>
> iptables -t nat -A PREROUTING -p tcp -i eth0 -m multiport \
>         --dports mysql -j DNAT --to some.other.host
>
> changing "some.other.host" to 127.0.0.1 doesn't work
> as expected, and packets seem to be dropped altogether.
> Using tcpdump i can see packets reaching eth0, but
> never reaching loopback.

the target used for this is REDIRECT.  from "man iptables"

   REDIRECT
       This target is only valid in the nat table, in the PREROUTING and =
 OUT-
       PUT  chains,  and  user-defined chains which are only called from =
those
       chains.  It alters the destination IP address to send the packet =
to the
       machine  itself  (locally-generated packets are mapped to the =
127.0.0.1
       address).  It takes one option:

       --to-ports port[-port]



HTH...

-j

