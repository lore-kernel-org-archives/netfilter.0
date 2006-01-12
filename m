From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: iptables: No chain/target/match by that name (detailed)
Date: Fri, 13 Jan 2006 01:31:59 +0200
Message-ID: <43C6E6EF.5070001@gmail.com>
References: <s3c4d304.069@gwia201.syr.edu>
	<55893.193.173.147.3.1136991938.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <55893.193.173.147.3.1136991938.squirrel@webmail.sterenborg.info>
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
Cc: netfilter@lists.netfilter.org

Hi Amresh Kumar!
The PREROUTING and POSTROUTING chains exist only in nat or mangle
tables. So add iptables -t nat or iptables -t mangle

> iptables rule :  iptables  -A PREROUTING -i eth0 -p tcp --dport 80 -m state 
> --state NEW -m nth --counter 0 --every 4 --packet 0  -j DNAT 
> --to-destination 192.168.0.5:80
> 
> iptables -A PREROUTING -i eth0 -p tcp --dport 80 -m state --state NEW -m 
> random --average 25 -j DNAT --to-destination 192.168.0.5:80
> 
> 

The above rules would be for the nat table.
HTH
Sorin


