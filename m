From: =?iso-8859-1?Q?Lo=EFc?= Minier <lool+netfilter@via.ecp.fr>
Subject: Connections with SYN aren't NEW
Date: Sun, 14 Dec 2003 17:23:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214162315.GA897@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@lists.netfilter.org>

     Hey list,

 I am using a 2.4.22 with the ebtables + br-nf patch of
 ebtables.sourceforge.net. I am currently not DROPping packets, only
 logging for a while as a safety for my new rules on this host.

 I face a problem with some TCP connections: I want to accept new
 TCP connections only if they match both --syn and -m state --state
 NEW. This turns out to be a bad practice in some case where I see
 legitimate new TCP connections with correct flags matching --syn but
 which do not match -m state --state NEW.
   This happens a lot with HTTP clients and with DNS requests, and I
 think this is because of port reuse:
   - the HTTP client opens a connection from port xyz to port 80
   - it finishes the session and closes the connection
   - it reopens another connection with the same port xyz to the same
     host on port 80

 However, grepping the /proc/net/ip_conntrack shows two different
 entries in such cases.

 Am I wrong in thinking the connections should match -m state --state
 NEW, even if a connection happened with the same ports/ips a few
 seconds ago? What can I change to fulfill my wishes?


   Kind regards,

--=20
Lo=EFc Minier <lool@dooz.org>

