From: Stef Coene <stef.coene@docum.org>
Subject: Re: [LARTC] Performanace fo the Iptables Server
Date: Wed, 27 Aug 2003 17:30:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308271730.07228.stef.coene__20377.1471664824$1062300586@docum.org>
References: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall>
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
To: hare ram <hareram@sol.net.in>, netfilter@lists.samba.org
Cc: lartc@mailman.ds9a.nl

On Wednesday 27 August 2003 07:46, hare ram wrote:
> Hi all
>
> I have RH 9.0
> PIII with 550Mhz
> 512MB RAM
>
> working fine with Iptables+TC+HTB
>
> Now i want o make accounting system using ULOG
>
> so i introduced  to send all logs to Mysql
> So i can make my own Graphs
>
> iptables -A INPUT -j ULOG
> iptables -A FORWARD -j ULOG
> iptables -A OUTPUT -j ULOG
>
>
> the Server is connected to Several Clients
>
> does this server will have any Impact of performance
> or this PC can handle Easily
>
> how can caluculate the PC configuration,
The needed configutation also depends on how many logs you will have and how 
you are going to proces them.  
And do you really want to log everything?  If you are interested in what's 
going thru your firewall, you can also log the connections.  Or you can 
install ntop on the firewall.

Stef

-- 

stef.coene@docum.org
 "Using Linux as bandwidth manager"
     http://www.docum.org/
     #lartc @ irc.oftc.net


