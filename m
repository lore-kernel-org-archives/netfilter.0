From: "Kabango Malewezi" <kmalewezi@deloitte.co.mw>
Subject: Problem with -i
Date: Thu, 20 Nov 2003 08:58:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003401c3af33$bd6e6f30$2400a8c0@deloitte.co.mw>
Reply-To: <kmalewezi@deloitte.co.mw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

	Folks, can you help me with the following problem?

I'd like to set a policy to accept all packets from etho on network
192.168.0.0/24 but when I do this:

iptables -A INPUT -j  ACCEPT -i eth0 -s 192.168.0.0/24

the command is accepted. But when I do

iptables -L     I get

Chain Input (policy ACCEPT)
target		prot	opt	source			destination
ACCEPT	all	---	192.168.0.0/24		anywhere

My question is WHY don't I see the eth0 anywhere?


Kabango



