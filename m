From: "Bailey Kong" <bailey@tgpsolutions.com>
Subject: how IPTables MIRROR works?
Date: Mon, 23 Dec 2002 09:15:26 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <32803.64.81.237.3.1040663726.squirrel@mail.tgpsolutions.com>
Reply-To: bailey@tgpsolutions.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi everyone,

I understand from the manual that Mirror switches the scr and des IPs and
sends off the packet without traversing any outgoing packet filter chains.

I was just curious if the packet needs to hit the mirroring machine twice?
let me explain.

so say a "bad client" trys to access the ssh server on the mirroring machine

192.168.1.20 => 192.168.1.1:22
(bad client) => (mirroring machine)

so Mirror swaps the IPs and sends it back out

192.168.1.1        => 192.168.1.20:22
(mirroing machine) => (bad client)

so the "bad clients" computer doesn't run ssh-server and responds to the
packet as connection refused

my understanding is that the connection refused packet comes back to the
mirror machine and the mirror machine swaps the src and des again for the
"bad client" to get the connection refused.

is my understanding incorrect?

Any feedback is much appreciated
Bailey

-- 
bailey@tgpsolutions.com

Administrator, tgpsolutions
http://www.tgpsolutions.com



