From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Redirect Question
Date: Fri, 4 Mar 2005 14:59:29 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1CC2@pxtvjoexd01.pxt.primeexalia.com>
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

We have a client moving offices and will need to migrate their DNS (and =
some of their DNS entries) over at some point in time.  But for a =
variety of reasons we cannot do that.  They have 16 IP's at their =
current location and will get another 16 at their new location.
=20
What we would like to do is to have the firewall rewrite or redirect all =
traffic coming in on two IP's and redirect them to two destination IP's =
on the new firewall.
=20
i.e. they have 205.34.43.1/28 and 206.32.43.1/28.  We want all traffic =
that is currently destined for 205.34.43.2 to go to 206.32.43.2.  These =
are not at the same location.
=20
What is the easiest way to accomplish this?  both locations are running =
RHEL3 and a fairly basic configuration with iptables.
=20
Gary Wayne Smith
