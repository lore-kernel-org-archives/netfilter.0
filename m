From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: please help - iptables drops tcp/ip connections
Date: Thu, 16 Sep 2004 10:49:13 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e5040916004941e821d3@mail.gmail.com>
References: <50592.203.94.69.222.1095265884.squirrel@mail.roomsnet.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <50592.203.94.69.222.1095265884.squirrel@mail.roomsnet.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

server:~# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
12288

This is on a machine with 192M RAM, the default of that sysctl value
is proportionalwith the amount of RAM, but it can be changed, afaik
every ip_conntrack entry (/proc/net/ip_conntrack) needs arround
300bytes from RAM.


On Wed, 15 Sep 2004 22:31:24 +0600 (LKT), mohan@roomsnet.com
<mohan@roomsnet.com> wrote:
> Hi
> Please advice, I am running a iptables 1.2.11 on Debian Woody with 2.4.24
> kernel. I have a DMZ with 7 machines (4 linux, 3 windows) and 80 Windows
> machines on the LAN side.
> 
> The windows machines makes a lot of tcp/ip connections with internal
> client machines (oracle and java). As certain time (around 4000
> simultaneous TCP/IP connections) the machine running iptables drops
> connections and failures occur.
> 
> Are there any kernel or iptables setting required to be set for such a
> large number of connections???
> Please advice
> 
> Thanks
> Mohan
> 
> 



-- 
Bla bla

