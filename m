From: <ashivale@ownmail.com>
Subject: Re: Iptables rules...
Date: Sat, 7 Sep 2002 17:29:05 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209071159.g87Bx5R02070@mail003.ownmail.com>
Reply-To: <ashivale@ownmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="1729578102.2066.ashivale@ownmail.com"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Didier Hung Wan Luk <DidierH@frci.net>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

--1729578102.2066.ashivale@ownmail.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,
The default policy you set is the default for all the packets in that chain. Hence you need not specify it again for the INPUT chain.
bye,
Amit

Didier Hung Wan Luk wrote:
> Hi All,
> 
> 
> I am new to firewall/iptables can someone help me to clear up some concepts about firewalling?
> 
> If my default rule for the input chain of my external interface is DROP need I again specify to DROP packets in the INPUT chain of my external interface?
> 
> i.e..
> 
> #My Default rule
> iptables -P INPUT DROP
> 
> #Drop all attempts on my ext. interface trough port 6000:6063
> 
> iptables -A INPUT -i ppp0 -p tcp --dport 6000:6063 -j DROP
> 
> If I am right I think that I need not include a rule again saying to drop packets to my 6000;6063 ports since I do not have a rule saying to accept connections on these ports...
> 
> Thanks,
> 
> Didier Hung Wan Luk
> 
> 


--1729578102.2066.ashivale@ownmail.com--

