From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RPC Patch Issues
Date: Tue, 21 Oct 2003 08:44:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F301E8022C@houxchsvr.ucscorp.ucs.pvt>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

I wanted to ask about RPC again. I even went through and did a third =
kernel and it still does not work. I'm using a Debian distribution with =
a 2.4.22 kernel with the Netfilter patch and RPC and String patched and =
added as modules. As I stated in the previous e-mail string is working =
great, but for some reason RPC is not working. Is there something more I =
need to be doing to get RPC working? I couldn't find any special =
instructions on the Internet for it, so my assumption is it was supposed =
to load just like the string module did. Please reference my previous =
e-mail (below).=20

Thank you,

B. Hildebrand

--- Original Message ---

I'm trying to add the RPC connection tracking module (the one from =
patch-o-matic). It is compiled in to the kernel (I also did string at =
the same time) and string is working but RPC is not. I have tried =
manually loading the modules (string loads the module automatically) and =
a couple of other things but regardless I get the return:
=20
No chain/target/match by that name.
=20
I'm using the example command I always see of "iptables -A INPUT -m =
record_rpc -j ACCEPT". Is there a walkthrough for this somewhere or =
would somebody please tell me what else I need to do to get this =
working.
=20
Thank you,
=20
B. Hildebrand
=20


----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

