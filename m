From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: traffic from particular interface..
Date: Mon, 14 Mar 2005 14:17:02 +0200
Message-ID: <1403218a0503140417712785fa@mail.gmail.com>
References: <20050314120345.60139.qmail@web51909.mail.yahoo.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050314120345.60139.qmail@web51909.mail.yahoo.com>
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
To: Manish <manishsoft@yahoo.com>, netfilter <netfilter@lists.netfilter.org>

iptables -A FORWARD -i eth1 -o eth0 -j DROP


On Mon, 14 Mar 2005 04:03:45 -0800 (PST), Manish <manishsoft@yahoo.com> wrote:
> Hi,
> 
> I had 3 network interface on my linux box eth0, eth1 and eth2. I want traffice from eth1 only pass  from eth2 and eth0 should deny any traffic from eth1 but allow from eth2. what firewall rule should i give to do the above job.
> 
> Thanks in advance
> 
> Manish.
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
> 


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

