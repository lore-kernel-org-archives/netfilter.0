From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Weird routing problem. (I think)
Date: Thu, 6 Nov 2003 14:43:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311061443.hA6EhBj13996@agate.rockstone.co.uk>
References: <003e01c3a471$3e8af660$0200010a@Tinkerbell> <1068129245.22285.1.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068129245.22285.1.camel@main.tqmcube.com>
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
To: IPTables Mailing List <netfilter@lists.netfilter.org>

On Thursday 06 November 2003 2:34 pm, David C. Hart wrote:

> On Thu, 2003-11-06 at 09:21, Stephan Viljoen wrote:
> > Some off my clients started complaining that they're having problems
> > connecting to my mail server. Now all this worked fine up until
> > yesterday. I'm not blocking any ports nor am I blocking ICMP on the
> > network.
>
> Rather slow but  . . .
>
> [root@mail2 root]# telnet 217.10.176.138 25
> Trying 217.10.176.138...
> Connected to 217.10.176.138.

Sure, the mail server is responding, but that doesn't explain the internal 
network response to the pings.   I don't think you can trace this problem 
from the outside.

My question to Stephan is:

Why do you have multiple network ranges all plugged in to eth1 on the 
Firewall?   Looks like a bad idea to me (I'm not saying it won't work, but I 
really don't like it).

Regards,

Antony.

-- 

The only problem with the Universe as a platform, though, is that it is 
currently running someone else's program.

 - Ken Karakotsios, author of SimLife
                                                     Please reply to the list;
                                                           please don't CC me.

