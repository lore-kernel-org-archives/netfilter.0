From: Krystian <optimusprime@o2.pl>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 14:27:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40506957.8050609@o2.pl>
References: <001201c40744$1f34a190$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c40744$1f34a190$2a245cc2@cea05>
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
To: Tomasz Macioszek <tomekm@cea.pl>
Cc: Netfilter <netfilter@lists.netfilter.org>

Tomasz Macioszek wrote:

>Hello!!
>I would like to block all known p2p program ( Kazaa, eDonkey, ...). I would
>like to find patch of iptables (p-o-m) which blocks all this programs??
>
>Thanks for your help
>Tomek
>  
>
maybe ill write some tutorial :D

protecting from P2P is difficult, all depends on you users skillz :)
couple things I do:
- dont block normal P2P ports. it wont solve much becouse the user or 
the program (kazaa automaticly) changes ports to avoid such block. 
besides if you dont block the port you can easily spot P2P connections 
in program like IPTRAF(which helps diagnosing)
- do QoS on your router forcing every packet from HTTP.. to have 
prioroty over nonstandart ports.
- to filter connections on normal ports(HTTPS) use layer-7 filters like 
squid (for http,ftp and https), for other programs (SMTP,POP3,NEWS...) 
user layer-7 filters
- this should help you squash around 95% of downloaders. the other 5% 
you r going to slay using IPTRAF+normal user punishing :D

One more thing which is the good. P2P programs like to use a lot of 
connections. Limit number of connections per user to lets say 20-30 (im 
guessing here :). this is the easyiest to do with a proper Iptables 
filter :)

p.s.
sorry for my english

Krystian Antoni Szybis
tez Polak :D

