From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Help Needed
Date: Thu, 13 Nov 2003 10:35:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB3A4AE.3080608@Loudoun-Fairfax.com>
References: <001201c3a9f7$ab954a90$36b4fea9@station1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c3a9f7$ab954a90$36b4fea9@station1>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Harish Sabnani wrote:

> Hi All,
>  
> I am using Iptables with IPmasquerade on my LAN network to share the 
> Internet connection, I have used rc.firewall script that I downloaded 
> from the netfilter site.The whole setup is rocking but I get mssgs at 
> /var/log/messages every sec, is there a way I can stop this? 
> Sometimes, this clogs my network ?
>  
> Any pointers in this reagard will be appreciated.
>  
> Regards
>  
> Harish

You need to take a look at those messages and find out why you are 
getting them and what they tell you. The LOG rules in that script have a 
prefix to the message that identifies which chain it came from. If 
you're getting enough messages to clog your network you either have a 
serious configuration problem or a DOS attack.

Jeff


