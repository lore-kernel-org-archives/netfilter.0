From: "Miguel Carvalho" <miguel@ipatimup.pt>
Subject: [Fwd: (no subject)]
Date: Wed, 11 Sep 2002 10:33:20 +0100 (WEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3321.213.13.176.13.1031736800.squirrel@www.ipatimup.up.pt>
Reply-To: miguel@ipatimup.pt
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

Hi,

We are having some trouble with dropped packets.

Our forward chain( internal net->public net ) doesnt have any out
constraints.
Our internal network, uses a web proxy at xx.xx.xx.01 port 8080
Our proxy connections are running almost fine.

The firewall public interface IP is xx.xx.xx.138.

This is what i get at the logs:

Firewall:Drop packet IN=eth0 OUT=
MAC=00:06:5b:3c:1a:27:00:50:04:52:1a:04:08:00 SRC=xx.xx.xx.01
DST=xx.xx.xx.138 LEN=40 TOS=0x00 PREC=0x00 TTL=255 ID=7816 PROTO=TCP
SPT=8080 DPT=42921 WINDOW=0 RES=0x00 RST URGP=0

Why is the firewall just dropping packets that have RST flag activated?
We are running  iptables-1.2.3-1 on a RedHat 7.2.

Thanks for the help.

Miguel Carvalho




