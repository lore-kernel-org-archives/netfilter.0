From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: active connections
Date: Sat, 1 May 2004 10:02:50 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005801c42f7c$9c35acb0$0200000a@heretic>
References: <BAY15-F34bqJGNzscE8000002f5@hotmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

and they will, this is conntrack :)
try unload the module and thats it



----- Original Message ----- 
From: "azeem ahmad" <azeem484@hotmail.com>
To: <netfilter@lists.netfilter.org>;
<netfilter-failover@lists.netfilter.org>
Sent: Friday, April 30, 2004 9:43 PM
Subject: active connections


> hi all
> i m having a problem that i m using MASQUERADING on a redhat 8.0 box with
> iptables. the problem is that when i want the users to be disconnected i
> flush iptables; the new connections dont get established but the current
> active connections dont break. like if a user is downloading msn messenger
> for example and i flush iptables, this user's connection dont break. so
what
> i can do to break the active connection
> please help me out
> Regards
> Azeem
>
> _________________________________________________________________
> Help STOP SPAM with the new MSN 8 and get 2 months FREE*
> http://join.msn.com/?page=features/junkmail
>
>
>


