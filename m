From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SYN only packets
Date: Fri, 05 Aug 2005 00:51:28 -0500
Message-ID: <42F2FE60.1070201@riverviewtech.net>
References: <42F2B892.30507@blackicehosting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42F2B892.30507@blackicehosting.com>
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
To: James Harrison <jamesharrison@blackicehosting.com>
Cc: netfilter@lists.netfilter.org

Try taking a look at SYN-Cookies in the Linux kernel.  This code was 
written explicitly for this type of situation.

You can not stop SYN packets as they are the very first packet in the 
three way handshake to start a TCP connection.  About all you can do 
(other than SYN-Cookies) is to rate limit the number of packets per 
source IP.



Grant. . . .

James Harrison wrote:

> Hi,
>
> I've been trying to calm down some DDoS attacks on my server, but i've 
> been stymied on how to block them- however, as APF's AntiDOS plugin 
> captured and reported to root, the really vigorous ones (The ones it 
> catches) have no ACK in their headers. SYN, but no ACK. I've read that 
> this is a common technique used by DDoSers, but i'm unsure if anything 
> else depends on it.
>
> The plan i'm looking at is possibly blocking all packets with SYN 
> alone, no ACK.. would this be possible with iptables, and how would 
> this affect other web services?
>
> Here's one of the captured packet messages (MAC/IPs are removed 
> obviously)
>
> Aug  4 21:02:30 ukdsl21 kernel: ** IN_TCP DROP ** IN=eth0 OUT= MAC=** 
> SRC=** DST=** LEN=48 TOS=0x04 PREC=0x00 TTL=116 ID=53191 DF PROTO=TCP 
> SPT=4122 DPT=4899 WINDOW=64240 RES=0x00 SYN URGP=0 OPT (020405B401010402)
>
>
> Any ideas?
>
> Sorry if this sounds completely barmy- if it does, do tell :-)
>
> Thanks in advance,
> James Harrison
>


