From: Michael Gale <michael.gale@pason.com>
Subject: Re: Send SYN ACK from server ?
Date: Fri, 20 Jan 2006 10:59:12 -0700
Message-ID: <43D124F0.1080804@pason.com>
References: <43CFFD80.3050203@pason.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43CFFD80.3050203@pason.com>
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
To: Michael Gale <michael.gale@pason.com>, netfilter <netfilter@lists.netfilter.org>

Hello,

    Why does disabling TCP window tracking resolve this issue ?

The firewall is CentOS 4 - kernel Linux fw1-calgary.int.pason.com 
2.6.9-22.0.1.EL #1 Thu Oct 27 12:26:11
iptables 1.2.11

# echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal


Michael

Michael Gale wrote:

> Hello,
>
>    I am seeing a problem where when a linux box from behind a linux 
> firewall connects to an external server, the external server is 
> sending a second SYN,ACK message:
>
> -> SYN sent
> <- SYN,ACK received -- WINDOWS SIZE SET TO 0 ??
> -> ACK sent
>
> Then the external server sends:
> <-SYN, ACK with same seq numbers ?? and WINDOW SIZE SET TO 16560 ??
>
> Now if the client is windows :( it replies to the second SYN,ACK and 
> everything seems to work, however when the client is linux, the second 
> SYN,ACK is ignored by the client which I believe causes the connection 
> state to be destroyed on the firewall.
>
> Am I corrent is assuming that the window size update packet should NOT 
> have the SYN bit set and that this is a problem on the remote server ?
>
> Michael
>

-- 
Michael Gale

Linux Administrator
Network Administrator
Pason Systems Corp.


