From: Whit Blauvelt <whit@transpect.com>
Subject: Re: simple newbie question
Date: Sat, 9 Aug 2003 18:00:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030809220009.GA27575@china.patternbook.com>
References: <000101c35ebe$9504e8f0$0401a8c0@pc2>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000101c35ebe$9504e8f0$0401a8c0@pc2>
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
To: Mario Mer?ngolo <mmeringolo@arnet.com.ar>
Cc: netfilter@lists.netfilter.org

Since eth1 is the closest to the wider Net, that's where to build your
- firewall unless you're also concerned with other people on your home
network having certain sorts of access to your Linux box, in which case you
might want to have rules for eth0 too. Most of us only worry about the
external interface - eth1 in your setup.

I don't use ppp, but for most purposes rules about ppp0 and eth1 should have
the same effect for you, I think.

Whit

On Sat, Aug 09, 2003 at 06:38:32PM -0300, Mario Mer?ngolo wrote:
> Im starting with this iptables stuff and trying to manage a home network
> trough linux and adsl + pppoe 
> 
> I have two simple questions.
> 
>  
> 
> I have my adsl router conected to my eth1
> 
>  
> 
> When im setting my iptables rules, should I think that eth0 routes packages
> through eth1 to ppp0 ?
> 
>  
> 
> Because, if that is, my drop rules should be defined on eth1, and my input
> ones on eth0
> 
>  
> 
> Our should i think that eth1 does not matter and my reliable is eth0 and my
> unreliable ppp0 ?
> 
>  
> 
> Please forgive my crude english
> 
>  
> 
> Thanx 
> 
>  
> 
>  
> 

