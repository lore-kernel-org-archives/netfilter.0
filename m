From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: -p protocol question
Date: Thu, 06 May 2004 09:15:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083849335.2068.599.camel@grendel>
References: <39017.4.19.111.130.1083848313.squirrel@home.schroedernet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39017.4.19.111.130.1083848313.squirrel@home.schroedernet.net>
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
To: wschroed@schroedernet.net
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-05-06 at 08:58, wschroed@schroedernet.net wrote:
>
> I am currently writing a mini how-to for a SANS paper

Always a good cause. ;-)

> Try `iptables -h' or 'iptables --help' for more information.
> but iptables -A INPUT -i eth0 -p tcp -s 192.168.0.1 --sport 5000 -d
> 192.168.0.22 --dport 56 -j ACCEPT works.

As it should.

> Now, according to the man page, the argument to -p can be tcp,udp,icmp,all
> or a number representing a protocol in /etc/protocols or a name from
> /etc/protocols. I have found that in reality iptables yields the same
> error above for anything expcept tcp.udp,icmp or their associated numbers.
> What have I missed -or- is the man page wrong?

Just to make sure I'm reading this correctly, you are trying to define
port numbers for other protocols besides TCP and UDP? If so, I think
your problem is that only TCP and UDP use port numbers. There is no
comparable application with other transports (at least none that I'm
aware of).

HTH,
Chris
 




