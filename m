From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: CONNMARK, OUTPUT, sid-owner and marking closed connections
Date: Thu, 17 Feb 2005 22:44:29 -0500
Message-ID: <20050218034429.GA14099@elm.home.idallen.ca>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

If I mark local packets based on a session ID:

  iptables -t mangle -A OUTPUT -m owner --sid-owner $PID \
         -j MARK --set-mark $MARK

the marking works correctly until the connection closes.  Then, the
final FIN packets no longer seem to originate with that session, they
don't get marked, and (being unmarked) they go out the wrong interface
(and the connection doesn't close properly).  Here is part of what the
log shows when that happens:

Feb 17 14:01:41 elm kernel: IDAMK IN= OUT=eth1 SRC=192.168.9.250
   DST=129.143.116.10 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=20288 DF
   PROTO=TCP SPT=56428 DPT=80 WINDOW=10416 RES=0x00 ACK URGP=0

Feb 17 14:01:41 elm kernel: IDANO IN= OUT=eth0 SRC=192.168.9.250
   DST=129.143.116.10 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=20290 DF
   PROTO=TCP SPT=56428 DPT=80 WINDOW=10416 RES=0x00 ACK FIN URGP=0

The first log entry is the last of the correctly marked packets going
out eth1.  The second log entry shows what happens when the connection
is closed (it was a "wget" of an http page), and the "ACK FIN" packets
are not being marked, so they go out the default interface (eth0).  Bad.

I would have hoped that the session ID marking would last even while
the connection was being closed and "FIN" was being sent.  It doesn't.

How do I arrange that *all* the packets get marked, even the "FIN" ones?

I've read a year of back-list messages dealing with CONNMARK but was
unable to make it work in my OUTPUT tables.

Linux elm 2.6.10-1mdk #2 Sat Jan 29 13:10:11 EST 2005 i686 AMD Athlon(tm)
XP 3200+ unknown GNU/Linux

--
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada EMail: idallen@idallen.ca
       WWW: http://www.idallen.com/ College professor (Linux) via:
       http://teaching.idallen.com/ Support free and open public digital
       rights:  http://eff.org/

