From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Establish new connection.
Date: Wed, 16 Oct 2002 22:49:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021016214903.GRAC17202.mta01-svc.ntlworld.com@there>
References: <000401c037ad$a4675840$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c037ad$a4675840$6601a8c0@s3ac>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 16 October 2000 9:14 pm, Rowan Reid wrote:

> I'm writing a small script to parse through my logs and filter nodes
> trying to establish new connections to filtered ports.  Below is a
> typical entry.  What part of that log entry tells me that this person is
> trying to establish a new connection ?

> Oct 16 05:42:57 s3a-www kernel: IN=eth1 OUT=
> MAC=00:04:75:b1:3d:6c:00:60:49:01:5a:de:08:00 SRC=216.99.233.253
> DST=**.**.76.66 LEN=72 TOS=0x00 PREC=0x00 TTL=241 ID=8598 DF PROTO=UDP
> SPT=53 DPT=1592 LEN=52

Nothing does.

This is a UDP packet, and UDP is a connectionless protocol, therefore there 
is no concept of setting up a new connection, different from continuing an 
existing one.   All UDP packets are the same, whether they're the first, 
middle, or last packets of a communication between machines.

If it were a TCP packet, on the other hand, you could tell from the flags 
whether it was an initial request to set up a new connection (SYN flag set), 
or a reply to that request (SYN and ACK flags set) or part of an established 
connection (ACK flag only).

Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

