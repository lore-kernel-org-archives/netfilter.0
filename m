From: Thomas Wallrafen <mails@ranulf.de>
Subject: [DNAT] Disappearing Packets
Date: Fri, 10 Oct 2003 10:52:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031010085214.GA8722@jesus.fsmpi.rwth-aachen.de>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all!

Sorry for asking this stupid question again, but searching the archives
couldn't help me solve my problem :(

I'm currently setting up an IPtables firewall using DNAT to access our
Webserver (192.168.0.42) and Masquerading to allow Internet access to
the clients.

Packets to the firewall (137.226.171.XXX) on port 80 can pass the FORWARD-chain:
(already DNATed...)
Oct 10 11:47:24 wormhole kernel: IN=eth0 OUT=eth1 SRC=170.252.80.XXX
DST=192.168.0.42 LEN=64 TOS=0x00 PREC=0x00 TTL=47 ID=39702 DF PROTO=TCP
SPT=48785 DPT=80 WINDOW=16384 RES=0x00 SYN URGP=0

The packets then get lost somehow. I can't trace back to where it is,
but the packets never reach the webserver on 192.168.0.42:80
With the webserver-logs I can confirm this.

My IPtables setup currently is very minimal due to the current
testing-status (only one Masquerading and one DNAT rule).

All chains are set up to ACCEPT all packets, as long as I haven't found
a solution to this problem.

We're using IPtables 1.2.6a with an unpatched Kernel 2.4.22.

Has anyone a suggestion how to solve this?

Kind regards,

    Thomas Wallrafen


-- 
    __  _     Debian GNU/      _
   / / (_)_ __  _  ____  ___  | |
  / /  | | '_ \| | | \ \ / /  | |
 / /___| | | | | |_| |>   <   |_|
 \_______|_| |_|\__,_/_/\__\  (_)


