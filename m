From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: tcp-reset not working for some ports?
Date: 31 Oct 2003 05:47:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067597253.1137.24.camel@valhalla>
References: <1067482221.4835.32.camel@ettan.ping.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067482221.4835.32.camel@ettan.ping.ee>
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
To: Tarmo Lehtpuu <tarmo@ping.ee>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-10-29 at 21:50, Tarmo Lehtpuu wrote:
> 
> I'm having problems properly closing all ports (I don't want a
> "stealthy" firewall).

"Stealthy" is a myth, but we will not start that flame war. ;-)

> When doing a portscan with nmap the following ports show up
> as being filtered:
> 1:13, 135:139, 445, 1080, 444 (tcp)

I've run into this myself. Make sure you have:
CONFIG_IP_NF_TARGET_REJECT

enabled within the kernel. You might also wish to sniff outside the
firewall (right on the nmap system is OK) to ensure that you are
actually sending back TCP resets.

> -A INPUT -i eth0 -p icmp -m icmp --icmp-type 3 -j ACCEPT
> -A INPUT -i eth0 -p icmp -m icmp --icmp-type 11 -j ACCEPT
> -A INPUT -i eth0 -p icmp -m icmp --icmp-type 0 -j ACCEPT

As a side note, the above lines are not needed as you are accepting back
"RELATED" traffic. The above lines will let in _all_ type 0's, 3's &
11's, even bogus ones. The RELATED specification will only let in
legitimate ICMP errors so you are better off removing these lines.

HTH,
C



