From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: SNAT in OUTPUT chain of the nat table question?
Date: 08 Jan 2003 18:11:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042045914.17783.2.camel@ranjeet-linux-1>
References: <20030109003721.GA26207@mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030109003721.GA26207@mit.edu>
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


On Thu, 2003-01-09 at 01:37, bauer@mit.edu wrote:
> Is there a good reason that I am unable to conceive of at the 
> moment why SNAT is not a valid target in the OUTPUT chain of the
> nat table? 
> 
> Thanks,
> Steve 
> 
> 

The OUTPUT chain is only for outgoing packets from the linux box itself.

The POSTROUTING chain is the one that contains all packets being
routed/forwarded.

-- 
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/


