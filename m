From: "Erick Sanz" <ESanz@minorplanetusa.com>
Subject: Strange behavior on IPtables
Date: Wed, 01 Oct 2003 17:24:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sf7b0de8.020@at-nw-gwweb.at-track.com>
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


All,

I have RedHat Linux AS with IPtables 1.2.4-2, and I am trying to rsh
to two different systems:

128.2.2.1 and 128.1.2.1

With the same permissions (see end of E-mail), the rsh to 128.1.2.1
succeeds, when the rsh to 128.2.2.1 fails (from Ethereal sniffing,
it seems as if the ACK tag to the second three way handshake when
IPTABLES is running has a wrong sequence number).

Once this ACK with wrong sequence number arrives, the system 
waits until the client sends a FIN ACK and then finally sends the RST;
but no data is ever sent.

If I turn IPTABLES off, the rsh succeeds without any problems.

Since the same ports are used for the authentication, it seems to
me that they are not blocked.

If you need the saved ethereal files, please let me know.

Please help!

iptables -A INPUT -s 128.1.2.1 -j ACCEPT
iptables -A OUTPUT -d 128.1.2.1 -j ACCEPT
iptables -A INPUT -s 128.2.2.1 -j ACCEPT
iptables -A OUTPUT -d 128.2.2.1 -j ACCEPT

Best regards,
Erick Sanz

