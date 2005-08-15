From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 11:32:31 +0200
Message-ID: <4300612F.6070603@mnemon.de>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
	<200508152018.33866.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508152018.33866.michael@networkstuff.co.nz>
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
To: netfilter@lists.netfilter.org

Michael Hallager schrieb:
>>I think correct should be:
>>itpables -I INPUT -i lo -j ACCEPT (guess you misspeled it in the hurry)
>>forward rule for loopback is not necesary, as long as i remember
>>iptables -I OUTPUT -o lo -j ACCEPT;
> 
> 
> HOLD ON,
> This creates the following:
> chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> DROP       all  --  202.71.136.166       anywhere
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> 
> Looking at the first and last rule displayed here, dosn't this have the effect 
> of negating everything else?
> Eg: Allow all, from anywhere to anywhere....
> 
> Am I missing something?

Yes, -v ;) Ok, you certainly typed "iptables -L" and this will not
output the interfaces. Try "iptables -nvL" and you will see, that
"ACCEPT all anywhere anywhere" concerns only loopback.

Regarding the timeout issue, do as Grant recommended. May be you should
log in OUTPUT too, at least if logging in INPUT will not show the problem.

Have a nice time,

Joerg


