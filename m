From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: PPTP conntrack with RHEL 4 (2.6.9)
Date: Wed, 23 Feb 2005 20:49:36 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1C92@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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

Little more experimenting and some different/odd results...
=20
With the all for modules loaded I successfully made an outbound =
connection from the firewall to remote POPTOP server.  At the same time =
I had a remote PPTPClient (on RH 9) establish an inbound PPTP connection =
to the same firewall.  It also worked.  I dropped that connection =
multiple times and restablished it.  At one point in time I had two =
connections inbound to the firewall.
=20
Now, with the modules loaded no incoming PPTP connections can be made =
with either a Windows XP or 2003 server.  If I unload the modules then I =
can make the same connection just fine.
=20
I have yet to test an outbound connection originating from behind the =
firewall (as I don't have any Linux/PPTPClient test boxes left).
=20
I have played with with the MTU (1450, 1400, 1200) on the XP workstation =
but it doesn't seem to do much.  Packet fragmentation shouldn't be a =
problem as it's on the same physical network.
=20
I was snooping around with ethereal and it seems that when the modules =
are loaded and I connect with XP (or 2003) that they are not responding. =
 When I turn the modules off they work fine and the packet gets answered =
by XP.  The irony is that both packets prior to XP's answer (or failure =
to answer) are identical with the exception of packet sequence. =20
=20
It's boggling the mind that these things would be the same yet XP/2003 =
decides not to answer it because the modules are loaded.
=20
Gary Smith
=20

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Gary W. Smith
Sent: Tue 2/22/2005 11:03 PM
To: netfilter@lists.netfilter.org
Subject: PPTP conntrack with RHEL 4 (2.6.9)



I've tried a few different RH kernels now with little to no success so =
here is the next example.  Here is what I did on this trail run.

Patched the kernel with pptp conntrack.  Created a diff set.  Applied =
the diff set to the RHEL 4 ES source SPEC file and built the new kernel. =
 Preliminary tests showed the same problem as with RHEL 3 ES (no =
outbound or inbound with all for modules loaded).  I also compiled =
iptables as well.

When I loaded the modules onto the test box (with almost the exact same =
config) I was able to load all for modules and make an outbound =
connections from the firewall and receive connections but I could not =
establish outbound connections from behind the firewall.

The compile box is a dell 4700 with HT enabled.  It has a just the devel =
libs installed and no X.  The test box is a dell 2400 without HT with =
just the devel libs installed and no x.  I compiled the RPM files =
(kernel and iptabled) and then deployed it on both boxes with different =
results.

I has similar results with Fedora Core 3.=20

Any help would be greatly appreciated.

Gary Smith






