From: Lars Brinkhoff <lars.spam@nocrew.org>
Subject: Translating between local and global IP address
Date: 22 Jan 2003 08:17:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <85fzrlbqmb.fsf@junk.nocrew.org>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

My home network is set up something like this:

                    internet
                       |
                      eth0
                  GATEWAY (Linux)
                      eth1
                       |
                 COMPUTER (Windows)

COMPUTER has a local IP address ($IN), but I'd like to mangle packets
going through GATEWAY so COMPUTER appears to have another IP address
($OUT) on the internet.  It seems I've had some success with this:

  iptables -t nat -A POSTROUTING -o eth0 -s $IN  -j SNAT --to-source $OUT
  iptables -t nat -A PREROUTING  -i eth0 -d $OUT -j DNAT --to-destination $IN

And to fool GATEWAY into accepting packets for $OUT, I've done this:

  ifconfig eth0:1 $OUT

However, it doesn't seem to work when trying to play a network game on
COMPUTER.  It times out trying to connect to another machine on the
internet.  It probably uses UDP packets.

Any idea what I'm doing wrong?

Thanks.

