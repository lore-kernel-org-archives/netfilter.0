From: "Paul Albert" <palbert@rovingplanet.com>
Subject: Tcp-window-tracking
Date: Thu, 27 Feb 2003 15:14:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <661F9268BBA8CB4EB92CC12B8C42F06901F5FA@pluto.rovingplanet.com>
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

Hi all -=20

I need to examine each of the packets in the HTTP stream in my firewall.
After checking out the excellent IPTables Tutorial, I'm thinking that I
need to use the POM to put in tcp-window-tracking.  Currently, just the
initial socket opens are being checked and correctly sent to the QUEUE
target.  I would like to have all packets in the TCP stream sent to the
queue target, and I would like to make sure that this will cause the
firewall to do just this for traffic between clients and our internal
web server.  If not, I appologise for the silly post and request a
pointer in the correct direction.

Cheers,
Paul

