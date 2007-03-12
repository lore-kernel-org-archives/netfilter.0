From: OTR Comm <otrcomm@isp-systems.com>
Subject: Remote Access Via Mac Address and Unknown IPs
Date: Sun, 11 Mar 2007 19:19:56 -0700
Message-ID: <45F4B8CC.390FD831@isp-systems.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I have seached Google and the archives but I can not find anything that
tells me how to use iptables and mac addresses to allow a user at a
remote location to access a server when the remote IP address is
unknown.

What I am trying to do is setup a rule where a client with a laptop can
roam and still have access to certain ports (primarily 427 amd 548 for
atalk access).  I want to restrict access by mac address, but I can not
figure out how to do it given that I will never know an IP address where
the client might be coming from.

Is there a way to do this with iptables?

I figure I have to have some kind of established tcp communication
before I can identify the mac address, but it is like I have to open the
ports up to the world and then drop sessions not coming from a
particular mac address.

Can someone help me with this one please?


Thanks,

Murrah Boswell

