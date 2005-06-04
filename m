From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: iptables on multiple CPUs (SMP & Hyperthreading question)
Date: Sat, 04 Jun 2005 19:08:58 +0200
Message-ID: <42A1E02A.1080001@danbbs.dk>
References: <d6dfb92c05060215211afa98c@mail.gmail.com>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d6dfb92c05060215211afa98c@mail.gmail.com>
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

Michael Buffer wrote:
> I'm considering purchasing some firewall machines for my organization, and
> I am trying to decide whether a machine with multiple CPUs is worth the
> additional expense performance-wise (aside from being able to assign CPUs
> to interfaces).  I'd also like to know whether there are any stability
> issues with iptables & SMP (and/or hyperthreading with multiple CPUs).
> Any input would be appreciated.

To second the other very good remarks...
I've had a Celeron 430 with 128MB ram or so handling 8 interfaces (quad 
Dlink cards) as a firewall/router, while also running the facility's 
internal bind and dhcpd, plus acting as a FreeSwan IPsec concentrator 
for three external departments.
On a 2Gbit connection, load was mostly idle. I even had it running seti 
(priority -19) for a while, just to see how it handled the load.

This was for an educational facility with some 200 students and 30+ 
staff on the central setup, and maybe 40 students +8 teachers at the 
external depts.
Quite a lot of those students didn't know how to activate themselves, so 
there was -a lot- of browsing, chatting, and downloading taking place.

The only times I would've liked more raw power was for my homeoffice ssh 
connections

But I can fully agree to other remarks on setting up clustered solutions 
with failover.


-- 
Kind regards,
Mogens Valentin


The dual core chips are dubbed the "brains" of a computer.
Although Intel has recently changed that description by
describing its dual core processors as having a heart as well.
   -- fun on theinquirer.net


