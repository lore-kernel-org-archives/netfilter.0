From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Checksumming Issues
Date: Fri, 21 Nov 2003 21:13:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311212113.hALLDlj29642@agate.rockstone.co.uk>
References: <D8FBABA1EF6F2E4DBCC88903F60691F3021BD935@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D8FBABA1EF6F2E4DBCC88903F60691F3021BD935@houxchsvr.ucscorp.ucs.pvt>
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
To: netfilter@lists.netfilter.org

On Friday 21 November 2003 9:00 pm, Hildebrand, Brian wrote:

> www.netfor2.com/tcpsum.htm
>
> That is the first website I found. I'm sure if you look some more you could
> probably find about 500 more. If you do not follow those instructions, you
> will get bad checksum returns. Just because it is an OSI layer higher does
> not mean it can't include data from lower down the chain.

You are right.   The TCP checksum contains a "notional IP header" which is 
included in the calculation.

Today is not a good day for me :(   It must be somebody else's birthday.

Antony.

-- 

I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams
                                                     Please reply to the list;
                                                           please don't CC me.

