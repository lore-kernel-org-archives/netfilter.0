From: Steve Benson <steve@infinity.rhythm.cx>
Subject: port redirection *without* NAT
Date: Mon, 6 Jan 2003 14:12:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030106141242.C12830@infinity.rhythm.cx>
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


I'm trying to figure out how (if possible) to do port redirection with
iptables on my linux router. This router is is not doing NAT, all connected
networks have real, public IP addresses. There is tons of information out
there about doing port redirection with NAT, but I can't find anything for
without NAT. I just want to make the router take traffic destined for
address A port x and change the destination address to send it off to
address B port x instead. A and B are on the same (directly attached
ethernet) network. I looked into the DNAT and REDIRECT targets, but those
only seem to work in the nat table.

Thanks

