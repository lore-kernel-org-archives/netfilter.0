From: Jason Opperisano <opie@817west.com>
Subject: Re: SNAT question
Date: Tue, 21 Sep 2004 09:11:17 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095772277.1897.10.camel@wolfpack.ljm.dom>
References: <20040919171018.24029.qmail@web61101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040919171018.24029.qmail@web61101.mail.yahoo.com>
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

On Sun, 2004-09-19 at 13:10, darmian martinez wrote:
> Alex,
>  
> It's doesn't work because NAT rules applies only to new connections, and
> the icmp reply packet is part of an "virtual" established connection.
> This is my original question, how to make a rule that make a NAT to 
> a packet that belong to already established connection.
>  
> thanks you.

not an answer, but a hint...

if you need to fiddle with packets that are replies to established
connections--investigate the capabilities of the RAW table patch from
POM and its NOTRACK capabilities.

-j

-- 
Jason Opperisano <opie@817west.com>


