From: "Gary W. Smith" <gary@primeexalia.com>
Subject: PPTP conntrack with RHEL 4 (2.6.9)
Date: Tue, 22 Feb 2005 23:03:12 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1C88@pxtvjoexd01.pxt.primeexalia.com>
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

I've tried a few different RH kernels now with little to no success so =
here is the next example.  Here is what I did on this trail run.
=20
Patched the kernel with pptp conntrack.  Created a diff set.  Applied =
the diff set to the RHEL 4 ES source SPEC file and built the new kernel. =
 Preliminary tests showed the same problem as with RHEL 3 ES (no =
outbound or inbound with all for modules loaded).  I also compiled =
iptables as well.
=20
When I loaded the modules onto the test box (with almost the exact same =
config) I was able to load all for modules and make an outbound =
connections from the firewall and receive connections but I could not =
establish outbound connections from behind the firewall.
=20
The compile box is a dell 4700 with HT enabled.  It has a just the devel =
libs installed and no X.  The test box is a dell 2400 without HT with =
just the devel libs installed and no x.  I compiled the RPM files =
(kernel and iptabled) and then deployed it on both boxes with different =
results.
=20
I has similar results with Fedora Core 3. =20
=20
Any help would be greatly appreciated.
=20
Gary Smith
=20
=20
=20
=20
