From: "Radovan Jablonov" <rjablonov@arrow.ca>
Subject: destination load balancing
Date: Thu, 21 Sep 2006 14:07:41 -0700
Message-ID: <F88399957644AA41B09BBDE2704CCEA8F4F0C9@raoxch01.arrow.ca>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

Has iptables possibility (or will have) to use other load balancing
methods/algorithms (for example: weighted round-robin, hash, load agent,
custom algorithm)?

From 'man iptables':

   DNAT
        This target is only valid in the nat table, in the PREROUTING
and OUTPUT
	chains, and user-defined chains which are only called from those
chains.
        It  specifies that the destination address of the packet should
be
	modified (and all future packets in this connection will also be
	mangled), and rules should cease being examined.  It takes one
type of
	option:

       --to-destination ipaddr[-ipaddr][:port-port]
              which can specify a single new destination IP address, an
              inclusive range of IP addresses, and optionally, a port
range
              (which  is  only valid if the rule also specifies -p tcp
or -p
              udp).  If no port range is specified, then the destination
port
              will never be modified.

              You  can  add several --to-destination options.  If you
specify
              more than one destination address, either via an address
range or
              multiple --to-destination options, a simple round-robin
(one after
              another in cycle) load balancing takes place between these
              addresses.

Sincerely,
--------------------------------------------
Radovan Jablonovsky
Database Architect/DBA
Arrow Transportation Systems Inc.=20
Tel: (250) 571-7773
Email: rjablonov@arrow.ca
WWW: www.arrowtransportation.com


