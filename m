From: swissguy@canada.com
Subject: dhcp
Date: Tue, 17 Aug 2004 02:30:02 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040817023002.1197.h008.c009.wm@mail.canada.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

hello

i have a strange problem, not sure whats going on. i
have  a dhcp3-server on a machine. the server is serves
to eth1 and eth2 addresses. now i would like to block
the server (so that a client cant send a request
anymore).

but so far i dont even manage to block the dhcprequest
with the default policy drop.

i have all 3 tables all chains drop
i dont have any rule

but when i do tcpdump i can see the following

192.168.5.30 bootpc > 192.168.5.1 bootps ......
192.168.5.1 bootps > 192.168.5.30.bootpc ....

what is going on? does dhcp-request goes somehow over
layer2?

or am i missing the big picture?

thanks
francis

