From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Why is my 443 port blocked
Date: Sat, 21 Oct 2006 08:27:31 +0200
Message-ID: <000f01c6f4d9$fd188140$0101000a@tanjian>
References: <20061021060651.60312.qmail@web31001.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061021060651.60312.qmail@web31001.mail.mud.yahoo.com>
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

> I made a script for my firewall, one of the rules is
> 
> $IPTABLES -A LAN-Internet -p tcp -s $NET_LSN -d 0/0
> --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
> 
> $IPTABLES -A LAN-Internet -p tcp -s 0/0 --sport 443 -d
> $NET_LAN -m state --state ESTABLISHED -j ACCEPT
> 
> with my default policy DROP..
> 
> I can open http://www.yahoo.com, but how come I can't
> open the mail.yahoo.com???
> 
> In my log list, it says that the packet for port 443
> is blocked, and sometimes port 80 is blocked to???
> what's wrong with my firewall??? why isn't it
> stable...

Try this:

$ipt -A LAN-Internet -m state --state RELATED,ESTABLISHED \
  -j ACCEPT
$ipt -A LAN-Internet -m state --state NEW -s $NET_LAN \
  -m multiport -p tcp --dports 80,443 -j ACCEPT

Why not have the RELATED,ESTABLISHED rule in your FORWARD chain? This
rule will match most traffic so you want it to be one of the first rules
to be checked.


Gr,
Rob


