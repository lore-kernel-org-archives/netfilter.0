From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: General denial question (tarpitting)
Date: Mon, 29 Mar 2004 08:59:50 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406758E6.8090106@lintelsys.com.au>
References: <Pine.LNX.4.44.0403251546510.29753-100000@e-smith.charlieb.ott.istop.com> <40634D80.9050609@pay2send.com> <4063B458.4030501@smgtec.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4063B458.4030501@smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Daniel Chemko wrote:
> Check out the Patch-o-matic enhancements to netfilter.
> TARPIT? Check.

>> Charlie Braddy wrote, on the qpsmtpd list, which is about
>> a perl drop-in replacement for qmail-smtpd:
>>
>>> If you are going to undertake the noble task of sucking up their 
>>> bandwidth, then I'd suggest that you do the job thoroughly, and make 
>>> sure that their TCP stack decides to retransmit as many packets as 
>>> possible. Use iptables (for instance) to selectively/randomly drop 
>>> packets.

Note that any kind of packet loss as high as 5% will cause the TCP stream to wither and die. I'm not sure of the exact numbers, but if 1 in 20 packets goes missing, you'll find the TCP flow-control ends up backing off more than it regains through the slow-start mechanism. Remember, TCP treats packet loss as a symptom of congestion. The protocol cannot handle sustained packet loss for any other reason.

TARPIT simply causes the transmission to cease by setting the window size to 0. TARPIT achieves DoS only if enough "targetted" sites use the TARPIT option, thus depriving the originator or system resources (required for tracking the connection). TARPIT keeps the connection alive (ACK packets flow freely), but prevents the resources being released, since the data isn't flowing.

Neither packet loss nor TARPIT will result in a demand-side bandwidth DoS.

If you want to achieve DoS by continual retransmission, you'll have to keep sending back ACKs for one particular sequence number, claiming a very large window.

