From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 06:23:26 -0500
Message-ID: <42DF85AE.1000400@gmx.co.uk>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af905072021501603cfd5@mail.gmail.com>
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
To: Edmundo Carmona <eantoranz@gmail.com>, netfilter <netfilter@lists.netfilter.org>

Edmundo Carmona wrote:
> I don't think I'm that smart to be the first to need this feature...
> so I hope I'm the ONE vote that flips the balance to convince
> netfilter developers that this is indeed <i>good and necessary</i>.

I am not sure we have developers posting here regularly. I've seen 
Harald Welte, but not often. I just looked and see that Jozsef 
Kadlecsik, who does post here, is on the Core Team.

> Maybe a new chain could be used to do some PREROUTING actions (like
> marking) before the routing decision is made for output traffic.

Is there any reason you can't use mangle/PREROUTING or nat/PREROUTING 
for what you need? What would filter/PREROUTING provide that those do 
not? In fact, although I don't do anything with mangle, I thought 
marking was in mangle territory.

 > What do you think?

Perhaps you should try to make your case on the developers' list.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

