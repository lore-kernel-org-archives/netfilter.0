From: "Andrew Brink" <abrink@netstandard.net>
Subject: Traffic Reflecting / Redirecting
Date: Thu, 3 Apr 2003 15:36:15 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B45570C481D7904FA8C47E19444BF6CD030B1F@nsimail1.netstandard.inc>
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

All -=20

I am trying to set up a box that can reflect traffic to another box
transparently.

An Example would be:  Initiate a ssh connection to 10.1.1.1, 10.1.1.1
then sends this packet to 192.168.1.1, then the return path must also go
through 10.1.1.1.

The trick is getting this to work transparently, and over the internet,
not a local network.

Any thoughts or ideas would be helpful.

Thanks.

Andrew Brink, CCNA, WCSP=20
NetStandard, Inc.=20
913-262-3888=20

