From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 21:18:46 +0000 (UTC)
Message-ID: <Pine.NEB.4.62.0506222110120.10040@ukato.freeshell.org>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
	<42B9C979.9080701@riverviewtech.net>
	<Pine.NEB.4.62.0506222034050.9177@ukato.freeshell.org>
	<Pine.LNX.4.60.0506221645490.22256@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0506221645490.22256@darkstar.sysinfo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org, "Taylor, Grant" <gtaylor@riverviewtech.net>

On Wed, 22 Jun 2005, R. DuFresne wrote:

>> TCP packets without flags are possible during a normal TCP connection, you 
>> don't want to drop them. --state ESTABLISHED,RELATED would never let in 
>> NULL scans anyway, because a NULL scan won't establish a valid TCP 
>> connection before it sends flagless packets.
>
> I was under the impression and perhaps again I'm wrong in my understanding, 
> tht once  a connection was established all packets had at least the ack flags 
> set<?>.

I think all modern implementations will always send ACK on an established 
connection, but I don't think RFC793 requires it. Therefore, it may be 
safe to drop unflagged packets, but it seems like a bad idea to me.

As far as stopping NULL or XMAS scans, explicitly dropping packets is 
unnecessary if you have a DROP policy and explicitly ACCEPT --state 
ESTABLISHED,RELATED.

 			Alexey

