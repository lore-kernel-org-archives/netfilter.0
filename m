From: Kristian Hald <kristian@hald.net>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 15:47:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40507C16.3070304@hald.net>
References: <001201c40744$1f34a190$2a245cc2@cea05> <40506957.8050609@o2.pl>
Reply-To: kristian@hald.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40506957.8050609@o2.pl>
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

Hello,

> - dont block normal P2P ports. it wont solve much becouse the user or 
> the program (kazaa automaticly) changes ports to avoid such block. 
> besides if you dont block the port you can easily spot P2P connections 
> in program like IPTRAF(which helps diagnosing)
> - do QoS on your router forcing every packet from HTTP.. to have 
> prioroty over nonstandart ports.
> - to filter connections on normal ports(HTTPS) use layer-7 filters 
> like squid (for http,ftp and https), for other programs 
> (SMTP,POP3,NEWS...) user layer-7 filters
> - this should help you squash around 95% of downloaders. the other 5% 
> you r going to slay using IPTRAF+normal user punishing :D
>
> One more thing which is the good. P2P programs like to use a lot of 
> connections. Limit number of connections per user to lets say 20-30 
> (im guessing here :). this is the easyiest to do with a proper 
> Iptables filter :)


I'm more for blocking P2P standard ports, but remember to log 
information on those ports, since Edonkey and other try to connect to 
other users who use standard ports. These are then registered and 
blocked, so you are both able to log and secure that they can't use any 
Bandwidth.
Specifically with Kazaa I'm using the FTwall(P2PWall) from sourceforge. 
It blocks Kazaa quite well.
The user can offcourse change the port, but I would recommend blocking 
connections going to standard P2P ports(Blocking both src and dest 
ports). That way alot of connections are denied, thereby not using 
Bandwidth.

QoS is a good idea if there are services you know you'll need, like 
mail, SSH, HTTP and so on. (Going to do that in the next firewall update)

Best regards
Kristian Hald


