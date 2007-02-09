From: "Andrus, Mr. Brian \(Contractor\)" <brian.andrus@nrlmry.navy.mil>
Subject: Iptables proxy to a different network
Date: Thu, 8 Feb 2007 16:41:40 -0800
Message-ID: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
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

Ok, this is maybe an odd one.
I have a system with a single nic and ip address a.b.c.1 (system A)
I want to proxy incoming requests to port 80 to a different system on a
different subnet of x.y.z.1 (system B)

On system a.b.c.1, I am trying the following in my
/etc/sysconfig/iptables:
-----------
*nat
-A PREROUTING -p tcp --dport 80 -j DNAT --to x.y.z:80
COMMIT
-----------

This seems to ALMOST work. The request from a client system (System C)
go to System A, get rewritten and are received by system B. System B
seems to be responding, trying to send to System C directly, but (I
think) System C is expecting its response to be from system A, not
System B, so it ignores the responses. At least, I see that kind of
traffic with tcpdump on each system.

Any help/ideas here? Perhaps there is a different approach other than
iptables too. FWIW, I want System A to be able to proxy http, dns and
ftp to System B on a different network.


Brian Andrus

