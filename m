From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables analyzer - but slightly OT
Date: Wed, 29 Oct 2003 11:06:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9FE588.5090409@Loudoun-Fairfax.com>
References: <20031029065729.13556.qmail@web40203.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031029065729.13556.qmail@web40203.mail.yahoo.com>
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

SBlaze wrote:

>
>Upon really thinking about it.... if I could just do a continuous iptables
>-vxnL   I would be happy. Perhaps some added counters for in which the the
>differences are shown from the last time it is last checked... say like a 5-10
>second delay?
>
>Sort of a iptop heh.... an iptables in... top like display...
>  
>

I think this is a very cool idea that should be much easier to implement 
than any kind of rule analyzer. Even better, you could calculate the 
delta between -vxnL readings and drop it into a graph that updates at 
user defined intervals, kinda like the bar graph model used in spectrum 
analyzers. You could "see" traffic on each rule in real time and know 
instantly if a particular rule was getting pounded. Maybe set "alarm" 
limits based on % of historical traffic or a user defined level. Set a 
longer (daily) interval and it would produce the kind of output Chris 
Brenton could use with a bar for each of his reject rules. Perhaps an 
option to normalize average traffic to a straight line so that abnormal 
traffic would look like "static" with positive and negative deflection 
from the x-axis. Ooohhh, my head is spinning . . .

Jeff


