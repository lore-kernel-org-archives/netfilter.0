From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: forwarding
Date: Tue, 18 May 2004 13:48:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F54@alderaan.smgtec.com>
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
To: alucard@kanux.com
Cc: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>, netfilter@lists.netfilter.org

Ok, one more thing:

Is the address 10.73.219.156 the only IP address on the external
interface of the server1?

If you don't bind the 10.73.219.156 IP address to the ethernet interface
on server1, then hosts on that network won't be able to find the server
even with the prerouting rule. You could solve this by Proxy-arp or just
simply adding another IP address to the outside interface.

This may be redundant, but I don't believe the external interface's been
discussed at all as a possible issue.


