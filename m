From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: problem with iptables with forward drop  policy.
Date: Tue, 23 Sep 2003 12:09:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E48@alderaan.smgtec.com>
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
To: iptables@isabeldeespana.org, netfilter@lists.netfilter.org

1. Are these subnets on the same network segment or different network
interfaces?

2. Are you trying to ping based on hostnames or IP's?

3. INTIF/EXTIF corresponds to what network IP subnets?

4. What gets dumped to the Logs? In all likelihood it will show you
exactly what the problem is.

The ICMP pings should work the same between Linux and Windows so I don't
see the 'visibility' the firewall allows as the issue. I can only assume
that your Windows machines are not configured the same way as your Linux
machine (192.168.3.15). Could this be a subnet masking problem?

Try tracert from 192.168.1.19 to the machines tried and see if they both
take the paths that they should be.


