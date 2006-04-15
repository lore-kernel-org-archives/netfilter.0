From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Restrict based on time of day
Date: Sat, 15 Apr 2006 10:34:00 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829016756E@pxtbenexd01.pxt.primeexalia.com>
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

I was asked today by a client if we can configure the firewall to
restrict outgoing traffic between certain time frames from certain IP's.
Basically they have had issues with people using the system in
appropriately after hours.  We have policy restrictions in place that
prevent people from logging into the domain after hours but they have
their own laptops which causes a problem.

We have a set of servers that will need access so we don't want to block
everything.  The network is segmented into two subnets, one for servers
and the other for workstations.  We just want to block the workstations
from going out.

Is there a module for doing this?

Gary Smith

