From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: How to prevent smurf atacks?
Date: Wed, 5 Jun 2002 16:04:06 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0206051559001.3749-100000@dns.toxicfilms.tv>
References: <20020605145530.A2090@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020605145530.A2090@funkyjesus.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Drage <nickd@funkyjesus.org>
Cc: netfilter@lists.samba.org

> A Smurf attack is effective just by the sheer weight of traffic sent to you,
> rather than because of any weakness in your host, so unfortunately there is
> nothing you can do on your host to harden it against this type of onslaught.
How about:
- blocking ICMP directed at broadcast addreses?
- setting /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts to 1
- adding anti-spoofing rules, smurf attacks may have spoofed IPs, and that
  is when the attack gets its sharp edge. It may be spoofed as if it is
  originating from your network.

The same goes for fraggle attacks, those are UDP brodcast packets to
unserved ports with spoofed IPs.

If the destination and source IPs are in the same subnet, we can have
the net attacking itself.

I guess that is what we are talking about.

Regards,
Maciej Soltysiak



