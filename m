From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: max number of connection
Date: Mon, 08 Jan 2007 21:02:27 -0600
Message-ID: <45A305C3.2020809@riverviewtech.net>
References: <BAY110-DAV3EC00E1ACEC181C4B8FFFBABC0@phx.gbl>
	<Pine.LNX.4.61.0701082143060.23737@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701082143060.23737@yvahk01.tjqt.qr>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 01/08/07 14:43, Jan Engelhardt wrote:
> -m connlimit


Not to be a stickler, but does connlimit have a way to control the total 
number of combined in AND out bound connections a host has?  I.e. if you 
were to run this on a gateway where you wanted to limit a computer 
behind it to a grand total of 10 connections?  Wouldn't connlimit 
usually be applied in such a way as to watch traffic in one direction 
and another rule to watch the traffic in the other direction?  I.e. 10 
outbound connections in addition to 3 inbound connections thus totaling 
13 connections?  Or does connlimit take care of this internally?

I think an answer that I have seen to this in the past has used bridging 
where you would watch for packets entering the bridge and leaving the 
bridge at the same time.  This way, one rule would catch all inbound AND 
outbound traffic.

Thoughts / comments / opinions / suggestions are welcomed.



Grant. . . .

