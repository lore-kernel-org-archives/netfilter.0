From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: netfilter before routing for local outgoing packets ?
Date: Thu, 25 Sep 2003 15:46:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E52@alderaan.smgtec.com>
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
To: jt@hpl.hp.com, netfilter@lists.netfilter.org

If you mark a packet in the OUTPUT table, the routing algorithm should
re-run and decide the path that was defined in the routing policy, so
here is the order of relevant events:

Program Send Packet
Routing Decision - Go out normal Interface
MANGLE: OUTPUT - Mark packet as fwmark 1
Routing Decision - Choose route as usual, but include fwmark 1 in
equation.


Warning: That is supposedly the behavior, but I have yet to get it
working properly.


