From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: iptables UDP problem
Date: Mon, 3 Feb 2003 13:16:56 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0302031301220.7256@dns.toxicfilms.tv>
References: <20030202001150.26421.qmail@web41303.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030202001150.26421.qmail@web41303.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: k n <kn57@yahoo.com>
Cc: netfilter@lists.netfilter.org

> I'm using iptables on RedHat 8 with the rules listed
> below. When scanned from outside the TCP port appear
> as filtered; however, the UDP port is still open.
>
> $ip0  is my external IP address.
>
> Am I doing something wrong?
>
> -------------
> /sbin/iptables -A INPUT -i lo -p all -j ACCEPT
> /sbin/iptables -A INPUT  -p tcp -d $ip0 --dport 53  -j
> DROP
Scanners see this:
- the machine pings back
- some ports (eg. 80) are open and respond properly
- some other ports (eg. 53) do respond at all (DROP), normally the should
  responds TCP RESET (normal operation, or -j REJECT --reject-with tcp-reset)
= so, the port is filtered.


> /sbin/iptables -A INPUT  -p udp -d $ip0 --dport 53  -j DROP
Scanners see this:
- the machine pings back,
- i do net get a "icmp dest. unreach / port unreachable), so the port is
  open.

Solution #1
- forget about what the scanner says: and leave it so it dropps the
  packets.
  For: The scans take much more time and may iritate the scanner;
       The scanner gets much less information that can be used with OS
       fingerprinting.

Solution #2
If you want the scanners to get (closed) for everything.
- reject with tcp-resets to tcp
- reject with icmp-unreach to udp

Against: The scans are quicker, you actually send packets thus disclose
information interesting to os fingerprinting.

Regards,
Maciej Soltysiak


