From: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
Subject: iptables basic concepts
Date: Fri, 28 Nov 2003 11:19:50 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3b5ba$b42935d0$0200a8c0@ale>
Reply-To: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

Hi everybody !!!
I have seen a pair of iptables scripts in order to learn the technique and I
noted that there's no a unique order in the construction of the ruleset. I'm
new at this matter so I have to ask you this 2 short questions:

1) What option is the best: at first I set the default policies in the
chains and later I flush all the existing firewall rules or viceversa ???

2) Is it a good practice to start the iptables firewalling rules from the
rc.local script or is it better from the /etc/init.d/iptables script ??? (I
use RH 9 and I start iptables from rc.local)

Thanks a lot, byeeeee

Alejandro


