From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: nat table not working with 'iptables -L nat'
Date: Fri, 25 Apr 2003 10:25:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005f01c30b0c$8e9d9170$0a90a8c0@boris>
References: <002001c30923$1a65a440$0100a8c0@yogi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Stuart Clark <elmhurst@spacelink.com.au>, netfilter@lists.netfilter.org


> Hi
> 
> When I try and add a rule to the nat table it seems to work but when I
> do 'iptables -L nat' I get the error 
> 
> 'iptables: Table does not exist (do you need to insmod?)'
> 
> All the other tables are there when I do 'iptables -L' but no nat table.
> 
> How can I get this working?
> 

try:

    iptables -t nat -L

to specify that you want to list the NAT table.

Mike



