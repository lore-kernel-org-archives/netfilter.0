From: Jason Opperisano <opie@817west.com>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 2 May 2005 14:51:47 -0400
Message-ID: <20050502185147.GA12120@bender.817west.com>
References: <df31c4040505021142197fdcdc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <df31c4040505021142197fdcdc@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, May 02, 2005 at 02:42:55PM -0400, John G. Norman wrote:
> Hi. I've been reading through the FAQ and some of the recent list
> history, and haven't found much guidance on the problem below.
> 
> I am trying to do a transparent proxy from port 80 to port 8080. I've
> had no problem doing this on a recent release of SuSE (iptables
> 1.2.9), but something's not working on Fedora 3.
> 
> The version of iptables on this release of Fedora is 1.2.11
> 
> /proc/sys/net/ipv4/ip_forward shows: 1
> 
> (any other settings in /proc/sys/net/ipv4 that could affect this?)
> 
> I've tried it two ways, which I think should be equivalent (the
> system's IP is 192.168.10.101):
> 
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 8080
> 
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.16
> 8.10.101:8080
> 
> Port 8080 is definitely open, and I can browse to that port with no
> problems. For 80, I get connection refused.
> 
> My filter table is wide open; nothing in mangle, and I show below
> what's in nat to show that the setting is at least there. Also below I
> show the nat table when I use -j REDIRECT.
> 
> Any ideas? I'm completely stumped. 
> 
> John

what's the output of:  netstat -lnt

-j

--
"Brian: You got anything on that remote lower than Mute?"
        --Family Guy

