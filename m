From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: ppooe state RELATED,ESTABLISHED issue
Date: Thu, 04 Aug 2005 20:30:15 -0400
Message-ID: <1123201815.23762.17.camel@inyoureyes.linsolutions.com>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Today I was testing a Centos 4.1(RH ES4 clone) with  2.6.9-11.EL and a
Verizon dsl connection. I couldn't get any connection tracking related
rules working on the pppoe interface.

-A INPUT -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT

The only way I could get it to forward traffic 
was to allow all INPUT and FORWARD traffic for ppp0.

The pppoe is using eth0 and the inside interface is eth1.

Googling uncovered a thread with respect to connection tracking being
broken 
with bridging.

http://www.uwsg.iu.edu/hypermail/linux/kernel/0506.2/0422.html

Is this really the same issue? If packets are coming in eth1 and leaving
ppp0(using eth0)
are they not just being routed? If eth0 is up the I can see packets
being bridged from ppp0e to eth0, but with eth0 down I am at a loss as
to why this is happening.

Also is this issue specific to 2.6? A 2.4 based machine would likely
suffice in this application.


Regards,
Ted





