From: Robby Workman <netfilter@rlworkman.net>
Subject: Re: Identd requests through firewall
Date: Tue, 15 Nov 2005 10:12:04 -0600
Message-ID: <437A08D4.4030806@rlworkman.net>
References: <43776DB5.8050702@rlworkman.net>
	<200511131109.06283.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511131109.06283.rob0@gmx.co.uk>
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
To: netfilter@lists.netfilter.org

/dev/rob0 wrote:
> On Sunday 2005-November-13 10:45, Robby Workman wrote:
> 
>>What I would like to do is forward the request to one of the boxes
>>behind the firewall (whichever one is attempting a connection with an
>>IRC server).  I know how to forward them all to one of the individual
>>machines (say box 1), but this does not help if I'm using one of the
>>other boxes to connect.
> 
> 
> Perhaps an easier solution than a patch of the IRC helper driver to 
> handle auth requests: run midentd on your firewall machine.
>     http://freshmeat.net/projects/midentd/
> Haven't tried it, myself. You would need to ACCEPT auth at the firewall 
> (INPUT chain). Probably the only way around that is the aforementioned 
> patch.


Thanks for the response; I agree that midentd appears to fit the bill. 
However, I must admit that I'm surprised that a patch for this doesn't 
exist - I wish had a the knowledge to do it...

RW

-- 

http://rlworkman.net

