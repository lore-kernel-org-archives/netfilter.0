From: Nick Pasich <nick@NickAndBarb.net>
Subject: Re: block ping  ?
Date: Sat, 10 Apr 2004 17:19:26 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040411001926.GA1135@66.27.62.2>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Syed Faisal Gillani <faisal@clickonlinenetworks.com>
Cc: netfilter@lists.netfilter.org

> From: "Syed Faisal Gillani" <faisal@clickonlinenetworks.com>
> To: <netfilter@lists.netfilter.org>
> Subject: block ping  ?
> Date: Sun, 11 Apr 2004 01:26:27 +0500
> 
> i am a newbie learning iptables ...
> can u tell me the rule of blocking only ping on my nic ?
> 
> Syed Faisal Gillani
> ClickOnline Networks
> http://clickonlinenetworks.com
> 
> E-mail powered by ClickOnline Networks

 You might also try using "echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all"
 

