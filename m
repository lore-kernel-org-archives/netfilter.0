From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: connection tracking without iptables?
Date: Thu, 30 Sep 2004 19:04:59 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <561dc326040930160476d839c7@mail.gmail.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>
Reply-To: Jiann-Ming Su <sujiannming@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

On Thu, 30 Sep 2004 11:19:25 -0700, Daniel Chemko <dchemko@smgtec.com> wrote:
> 
> The way I track this kind of information is from netfilter/iptables.
> 
> In the PREROUTING and POSTROUTING chains, you implement 'null' targets
> to add an internal netfilter counter to the packet stream.
> 
> # Detect all outgoing web traffic from that subnet
> iptables -t mangle -A PREROUTING --source ${mynet}/${mymask} -p tcp
> --dport 80
> # Return Traffic
> iptables -t mangle -A PREROUTING --destination ${mynet}/${mymask} -p tcp
> --sport 80
> 

Another thing I'm interested in is the total number of current
connections.  Does /proc/net/ip_conntrack provide this info?  I've
taken my iptables firewall offline,  and I would expect
/proc/net/ip_conntrack to show very few connections, but it seems to
still have quite a bit of historical connections left in it.

Basically, what I want to be able to do is graph the number of
connections as a function of time with MRTG.  I just need to make sure
I'm grabbing the right information.  The output of "iptables -nvxL"
seems to be total packets processed.  Thanks again for any tips.

-- 
Jiann-Ming Su
"I have to decide between two equally frightening options.  
                                            If I wanted to do that,
I'd vote." --Duckman

