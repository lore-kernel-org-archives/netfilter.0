From: Rod Smart <snaketails@optushome.com.au>
Subject: Port 3 hits from internal system to outside Question.
Date: Fri, 10 Jan 2003 05:05:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1E54B0.C82B849@optushome.com.au>
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
To: NetFilter List <NetFilter@lists.netfilter.org>

    I have a problem where I have "port 3" attempts from my internal
computer trying to connect to "port 3" on a external computer.

    Would anyone be able to explain to me what is happening ?

    Here is a scan from my filter REJECT logs.

Jan  8 17:19:58 jumpgate kernel: Packet log: output REJECT eth1 PROTO=1
192.168.3.130:3 203.22.13.11:3 L=56 S=0x00 I=3940 F=0x0000 T=127 (#
5)
Jan  8 17:19:59 jumpgate kernel: Packet log: output REJECT eth1 PROTO=1
192.168.3.130:3 203.22.13.11:3 L=56 S=0x00 I=3941 F=0x0000 T=127 (#
5)
Jan  8 17:19:59 jumpgate kernel: Packet log: output REJECT eth1 PROTO=1
192.168.3.130:3 203.22.13.11:3 L=56 S=0x00 I=3941 F=0x0000 T=127 (#
5)



