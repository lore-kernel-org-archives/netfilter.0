From: "Keith R. Weiner" <keith@valiant.com>
Subject: Active Directory
Date: Wed, 9 Oct 2002 11:00:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AF435BB1224A4C4888B58C546728EE32300F@s2.valiant.com>
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

I was wondering if anyone has either the answer or can point me in the =
right direction as to how Active Directory works through a natted =
firewall.
I am trying to do promotion and replication.

Microsoft Technet has a list of ports to open (RPC, DNS, etc...), but =
goes not much further.

Here is my scenario:

I have a domain controller on the inside with an address of 192.168.0.5 =
(255.255.255.0).
In the DMZ is a domain controller to be with an address of 192.168.100.5 =
(255.255.0.0).


192.168.0.5<----------Firewall<----------192.168.100.5

Of course the PC in the DMZ cannot see the domain controller on the =
inside in order to allow promotion to an active directory domain =
controller.
IPsec is probably not an option, but perhaps PPTP may be.

Any help would be greatly appreciated.  Thanks in advance.


