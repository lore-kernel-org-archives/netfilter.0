From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Re: Saving IPTable rules..oops
Date: Thu, 30 Dec 2004 12:39:16 -0800
Message-ID: <6.1.2.0.0.20041230123544.02691b78@corpmail.courtesymortgage.com>
References: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
	<002501c4edd3$872fb6b0$0500a8c0@floydian>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002501c4edd3$872fb6b0$0500a8c0@floydian>
References: <6.1.2.0.0.20041229095858.02518240@corpmail.courtesymortgage.com>
	<002501c4edd3$872fb6b0$0500a8c0@floydian>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

At 10:23 AM 12/29/2004, you wrote:
>You can do couple of things:
>- After you enter your commands from a shell, you can do a *service 
>iptables save*. All the commands that you had entered will be stored in 
>the *iptables* file in /etc/sysconfig. By the way this is the file the 
>system reads while boot up to load the firewall configuration.
>- You can directly edit this file to add new commands (though it is not 
>recommended, but I still do it 'coz it makes life easier) and then run 
>*iptables-restore* to load the new configuration.

Appreciate the help and feedback on this. Makes sense now.
One queston regarding the /etc/sysconfig/iptables file. In this file, can I 
put my variables in there? Such as: INET_IP=212.122.131.34, 
INET_IFACE="eth0" and so forth?
Or does that need to go somewhere else?

>Hope this helps.
>
>Deepak Seshadri

Thanks!

Jason 


