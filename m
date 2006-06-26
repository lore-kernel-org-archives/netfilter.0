From: "Kevin Withnall" <kevin@ilb.com.au>
Subject: Equalize routing
Date: Tue, 27 Jun 2006 09:59:04 +1000
Message-ID: <4FBA8FED77BE3B49ADF7BF67FC190CA905AD2A@webmail.ilb.com.au>
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

Until the weekend, our main router was running kernel 2.4 we have now
changed to 2.6 and have lost the ability to round robin route.

The main box has 2 interfaces (inside, outside) and the outside network
has 5 adsl routers on it.

My default routes for the table in question are ... (ip's changed)

default equalize
        nexthop via 111.222.333.249  dev eth1
        nexthop via 111.222.333.250  dev eth1
        nexthop via 111.222.333.247  dev eth1
        nexthop via 111.222.333.248  dev eth1
        nexthop via 111.222.333.254  dev eth1

All traffic seems to go to .254 in the kernel, under multipath routing,
every option is selected but I don't know how to select a policy in the
"ip route add" command.

Any ideas would be appreciated.

Regards
Kevin



--
Kevin Withnall
ILB Computing
PH: 02 4227 0001 Mobile: 0412 453 846
FAX: 02 4227 0081
http://kevin.withnall.com/
=20

