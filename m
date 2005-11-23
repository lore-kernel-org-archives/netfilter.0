From: Sandro Dentella <sandro@e-den.it>
Subject: Re: IP issue
Date: Wed, 23 Nov 2005 22:08:35 +0100
Message-ID: <20051123210835.GA26466@casa.e-den.it>
References: <20051123205900.47993.qmail@web30007.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051123205900.47993.qmail@web30007.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Nov 23, 2005 at 12:58:59PM -0800, Thamara Wanigatunga wrote:
> Dear Gurus,
> 
> I need to have 4 web servers behind a iptables packet
> filter, could i achive this through alised ips. Or
> what could you recomend. Please help ..


I normally do that with proxy arp. I think I read about it on LARTC Howto
some years ago. It works just fine. I don't know if it's the best way. 

So no need to use alias, just two interfaces w/ same IP, a little bit of
routing info and just iptables to forward what you need/like.

sandro
*:-)


-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

