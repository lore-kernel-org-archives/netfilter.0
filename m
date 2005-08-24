From: "Gary W. Smith" <gary@primeexalia.com>
Subject: NOTRACK action question
Date: Wed, 24 Aug 2005 11:23:02 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829074E1@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello,=20

We are NAT'ing an IP range to a set of internal Apache servers.  Looking
into the conntrack table we are seeing a bunch of entries on port 80,
which make sense.  One of the web server clusters is getting about 1m
hits a day which is starting to cause a significant jump in conntrack
entries.  My question is do we really need to track those?

I would assume no.  But when I add a NOTRACK rule to the raw table
Apache suddenly fails to serve the pages to external clients.

Here are the rules in question=20

(on the raw table)
-A PREROUTING -i eth0 -p tcp -m multiport --dports 80 -j NOTRACK

(on the filter table)
-A FORWARD -d IP's -j  filter_web
-A filter_web -p tcp -m multiport -j ACCEPT --dports http,https

Am I doing something wrong?

Gary Wayne Smith
