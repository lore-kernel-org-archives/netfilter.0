From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Problems with connection
Date: Mon, 13 Sep 2004 16:16:35 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41460E33.7040403@pbl.ca>
References: <20040913210115.54459.qmail@web50202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040913210115.54459.qmail@web50202.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Giancarlo Boaron <gboaron@yahoo.com.br>
Cc: netfilter@lists.netfilter.org

Giancarlo Boaron wrote:
> Hello!
> 
> I have a client in my LAN that must access a server on
> the Internet listening for requests on 3456 port.
> 
> Using the FORWARD chain (default police = DROP) I have
> the following lines:
> 
> iptables -A FORWARD -m state ESTABLISHED,RELATED -j
> ACCEPT
> 
> <... my rules ...>
> 
> iptables -A FORWARD -d X.Y.0.0/16 -p tcp --dport 3456
> -j ACCEPT

[snip]

> Does it mean that the server is trying to start a new
> back connection to the client and my DROP policy is
> applied? (since I don't permit new incoming
> connections?)
> 
> I read the application documents and it only says that
> I must allow outgoing traffic to and from
> X.Y.0.0/16:3456 using TCP protocol.

The easiest way to see if your firewall is dropping anything is to add 
something like this to the end of your firewall rules (provided you 
don't have any DROP targets beforehand):

iptables -A FORWARD -s X.Y.0.0/16 -j LOG --log-prefix "FWD_FRM_X_Y "
iptables -A FORWARD -d X.Y.0.0/16 -j LOG --log-prefix "FWD_TO_X_Y "

If there is any callback connection, it will show in kernel log (on Red 
Hatish systems /var/log/messages).  It will also show if your firewall 
is blocking any other packets between your network and X.Y.0.0/16.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

