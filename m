From: Michael Gale <mgale@utilitran.com>
Subject: Re: How to make a computer invisible
Date: Tue, 2 Dec 2003 08:14:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202081427.58d57208.mgale@utilitran.com>
References: <000501c3b88e$65e35550$6400a8c0@deamon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c3b88e$65e35550$6400a8c0@deamon>
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


Hello,

	You can make a machine almost invisible with iptables. I have a firewall box with multiple IP's on one interface. The one IP address does not have any servers listening on it. So if I do a nmap for all TCP and UDP ports and watch the traffic through a TCP dump the only responses I see are ARP replies.

So besides the response to ARP traffic no packets were sent out .. so if I could disable the ARP reply a nothing would be known.

The nmap scanned could only tell me that all ports a filtered :)

If you have a service on the IP -- like a web server I can not see you being able to hide it.

Also iptables by default is a IP based filter you a rule like:
iptables -A INPUT -j DROP 
will not drop layer two stuff.

You could try:
iptables -I INPUT -m mac -j DROP
but I am not sure what this would cause and what else it will break :0

Michael.


On Tue, 2 Dec 2003 09:40:09 +0500
"Babar Kazmi" <BabarKazmi@Hotmail.Com> wrote:

> Hello ..
> 
> As far as I know  iptables use MAC Address information for filtering.
> It cant be used for filtering packets, and I assume iptables cannot edit /
> modify ARP / RARP stuff.
> 
> If you find an alternate way, Do Share :)
> 
> Regards
> 
> Babar Kazmi.
> 
> ----- Original Message ----- 
> From: "Thomas Preissler" <tomjohn@gmx.de>
> To: "netfilter-user Mailinglist" <netfilter@lists.netfilter.org>
> Sent: Sunday, November 30, 2003 3:12 PM
> Subject: How to make a computer invisible
> 
> 
> > Hello folks,
> >
> > how do I really make a computer totally invisibly as it would be
> > when it does not exist?
> >
> > It is clear, that the simplest solution is to DROP all incoming
> > packets, but what's about (R)ARP packets? Can they be blocked anyway?
> >
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

