From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: How to make a computer invisible
Date: Tue, 02 Dec 2003 10:48:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070380086.2057.17.camel@grendel>
References: <000501c3b88e$65e35550$6400a8c0@deamon>
	 <20031202081427.58d57208.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031202081427.58d57208.mgale@utilitran.com>
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
To: Michael Gale <mgale@utilitran.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-12-02 at 10:14, Michael Gale wrote:
> Hello,
> 
> You can make a machine almost invisible with iptables.

<snip>

> So if I do a nmap for all TCP and UDP ports and watch the traffic through a TCP dump the only responses I see are ARP replies.

I guess this depends on what you mean by "invisible". When you ran your
scan nmap reported back "filtered". This is because nmap is smart enough
to know that no response back means there is a firewall controlling
traffic between the source and the target. 

So while an attacker can't tell if the IP is up or down, they can tell
there is a firewall in the way and if the host is up, no accessible
services are being offered.

> If you have a service on the IP -- like a web server I can not see you being able to hide it.

I've had pretty good luck using: 
-j REJECT --reject-with icmp-host-unreachable

If the open service ports are not the first ones hit, many vulnerability
scanners read this as the host being off-line and never bother to
complete the scan. So while people going directly to port 80 will access
your Web server without a problem, people doing a vertical port scan
many times get a response saying the host is off-line and never get to
see that TCP/80 is open.

HTH,
C



