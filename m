From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Port 1900
Date: Mon, 25 Oct 2004 09:36:14 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <013101c4ba8f$38a7d7b0$49caa8c0@caris.priv>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Oct 25 08:58:43 radium kernel: REJECT: frbk-rad IN=eth2 OUT=
MAC=00:01:02:2f:78:4d:00:01:02:46:85:d6:08:00 SRC=192.168.100.101
DST=192.168.100.1 LEN=160 TOS=0x00 PREC=0x00 TTL=1 ID=1464 PROTO=UDP
SPT=29860 DPT=1900 LEN=140

I looked on the gys macine for a LONG time .. I can't see why this is
happening.  I know 1900 is the msn port ..... Any ideas ?

192.168.100.1 is the IP of the internal card on the internal firewall.  The
other IP (100.101) is an employee's computer.  Everything that came from
192.168.100.0/24 destined to the firewall goes to the frbk-rad chain.  I am
not sure why it is hitting this chain.  I have a proxy server in my dmz.  I
checked his messenger client and it is configured to use the proxy server.
It should therefore be hitting the forwared chain rules .. not the Input
chain ones.

Thanks
Peter Marshall


