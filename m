From: "Stijn Derudder" <nopel@gmx.net>
Subject: Remote Desktop between two NATted computers
Date: 4 Oct 2002 09:57:56 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021004095756.10588.qmail@wunjo.lan>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've searched through the archives, but don't think this question has
been asked before.

I'm trying to connect from work to my home computer through Windows XP
Remote Desktop. Both my work computer and home computer are natted. From
my work, I can only send outgoing packets through tcp ports 80 and 443,
so I'm using both port-redirecting and port-forwarding on my home
firewall like so:

iptables -t nat -A PREROUTING -i ppp0 -p tcp --sport 1024: --dport 443 -j DNAT --to 192.168.0.101:3389 

So my setup looks like this:

 ----------------     -----------------
 | work comp    |     | work firewall |
 | 10.160.5.22  |-----| (public ip)   |
 | (private ip) |     |               |
 ----------------     -----------------
                              |
                           internet
                              |                  -----------------
                      ----------------------     | home comp     |
                      | netfilter firewall |-----| 192.168.0.101 |
                      | (public ip)        |     | (private ip)  |
                      ----------------------     -----------------

I drop (and log) by default, and accept related and established
connections. This setup works fine. When I use Remote Desktop to
connect to my firewall at port 443, I can take over my home desktop.

But whenever I do so, my firewall logs fill up. Apparently my home
comp is sending back UDP packets TO THE PRIVATE IP of my work computer,
which get logged and dropped at my firewall. This doesn't seem to affect
the connection, though.

An example log entry:
Oct  4 11:00:54 uruz kernel: IN=eth0 OUT=ppp0 SRC=192.168.0.101 DST=10.160.5.22 LEN=1052 TOS=0x00 PREC=0x00 TTL=127 ID=60438 PROTO=UDP SPT=3017 DPT=1237 LEN=1032

The source port is always udp/3017, the destination port varies.

Apparently Remote Desktop is sending it's original private IP along
in the data stream, but I don't understand why everything seems to
work fine.

Does anyone have any idea how I could handle these packets. I don't like
to code in specific exceptions in my ruleset, so simply 'not logging'
packets that go to 10.160.5.22 or that have a source port of udp/3017
isn't acceptable.

Thank you for your time.
Stijn Derudder
nopel@gmx.net

