From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: Email Alerts in/with iptables??
Date: Thu, 7 Oct 2004 17:03:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410072058.i97KwtnP007572@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: 'Imran Bashir' <ibashir@broadbandmaritime.com>, 'Veena Rao' <vrao@broadbandmaritime.com>, 'Syed Ali' <sali@broadbandmaritime.com>, 'Zia Ullah' <szia@broadbandmaritime.com>

Hello everybody,

 

Last week some of our client's PC's got infected by a virus and they started
random IP scanning on a particular TCP port on the network. The PC's were
generating more than 50 new TCP connections in a second. This took a heavy
toll on the NAT'ing and very soon we ran out of ports for NAT. I had to
block the port and inform the client to disconnect the machines out of the
network & clean it before putting it back. But this was after the damage was
done. It would have been great if there was some sort of alerting facility
available in iptables. The disaster could have been prevented.

 

Is there anyway to set alerts on iptables? Is there a P-o-M, some script or
tool that would do this job? I am sure this must have happened to some of
us. How does everyone else respond to such situations and prevent it from
happening in the future?

 

Specs:

Fedora Core 2

Kernel 2.6.8.1

Iptables 1.2.11

 

Thank you,

Deepak Seshadri

 

