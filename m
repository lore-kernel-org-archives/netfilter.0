From: "Mark C. Casey" <markcc@jadepress.co.uk>
Subject: Redirecting from one ip to another problem
Date: Fri, 25 Jun 2004 09:31:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <627ED3D5182532448B61510FFAB3D37F10A940@srvdc01.jade.local>
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

I have something of a conumdrum.

I'm in the process of replacing the current firewall with an IPCop =
machine, however i'm needing to replicate one rule that is causing me =
something of a headache.
On eth0 is the router (connected to the net), on eth1 is a webserver on =
eth2 is a switch which is connected upto the lan.

The ip address of the webserver is 172.16.0.1.

On eth2 is a sql server with the ip address of 192.168.0.1.

The current firewall has it setup so that when connecting to 172.16.0.2 =
redirects the traffic to 192.168.0.1 and so the webserver is able to =
access the sql server without ever knowing its real ip address.

How can this be replicated using IPTables?  All my attempts thus far =
have failed miserably to replicate this.

Thanks

Mark

