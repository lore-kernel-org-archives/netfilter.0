From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Is it possible to Jam windows network neighbour?
Date: Tue, 24 Aug 2004 08:18:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512BD@asimail2.alphanumeric.com>
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

> I am running Redhat Linux 9.0 machine for routing as
> well as iptables firewall for my network serving
> win 98 clients. For security reasons I do not want win
> 98 clinets to use pier to pier for transfering
> files/data among them. In this case win 98 clients do
> not need to talk to server.
> Is it possible to Jam pier to pier network ? so that
> copying of files from one win 98 client to other can
> be restricted.
> Thanks for support.

a firewall can only filter traffic that passes through it.  if your =
clients are all sitting on a LAN together, there is no way for an =
upstream firewall to keep them from communicating with each other.

-j

