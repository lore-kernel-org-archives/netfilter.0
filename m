From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: HUP
Date: Wed, 16 Mar 2005 10:47:32 -0500
Message-ID: <42385514.70600@SCampbell.net>
References: <42383F7C.2040300@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42383F7C.2040300@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: iptables <netfilter@lists.netfilter.org>

netstat --inet -p  will show you the attached process and you can kill 
that process.

scampbell@linux:~> netstat --inet -p -n
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         
State       PID/Program name
tcp        0      0 10.8.178.10:33819       22.33.44.123:22         
ESTABLISHED 8083/ssh
tcp        0      0 10.8.178.10:32795       64.12.165.101:5190      
ESTABLISHED 6984/gaim
tcp        0      0 10.8.178.10:33083       207.46.107.52:1863      
ESTABLISHED 6984/gaim

If I want to terminate that ssh connection I just  kill 8083

Brent Clark wrote:

> Hi
>
> I performed a netstat-nat on my fw.
>
> And there is a entry that I dont like.
>
> This is my employer working from home, probally left the remote 
> desktop session open.
>
> tcp   host81-153-16-165.range81-153.btcen:3191 
> resmanager.eccotours.local:3389          ESTABLISHED
>
> anyone know how I can just this kill this NATTED connection.
>
> Any advice would be most appreciated.
>
> Kind Regards
> Brent Clark
>
   

