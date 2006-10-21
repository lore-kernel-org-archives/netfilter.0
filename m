From: Adhi Laksono <wingback06@yahoo.com>
Subject: RE: Why is my 443 port blocked
Date: Sat, 21 Oct 2006 00:58:55 -0700 (PDT)
Message-ID: <20061021075856.75119.qmail@web31012.mail.mud.yahoo.com>
References: <000f01c6f4d9$fd188140$0101000a@tanjian>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000f01c6f4d9$fd188140$0101000a@tanjian>
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

OK, thank you very much for the help... I will try
it...

Can I write the rules like this too :

$IPTABLES -A LAN-Internet -p tcp -s $NET_LSN -d 0/0
--dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
$IPTABLES -A LAN-Internet -p tcp -s 0/0 --sport 443 -d
$NET_LAN -m state --state RELATED,ESTABLISHED -j
ACCEPT

It's the same right??? or it's different???

Oh yeah... I have a task in my campus to make a
firewall with a default policy ACCEPT, but I still
don't know witch port to block... can you help me with
this, or is there any reference that I can read... my
block script is this :

dropport="137:138 5050" <this is where I put my ports
to block>

#this is my rule
for ports in $dropport;do
$IPTABLES -A LAN-Internet -p tcp -s 0/0 -d $NET_LAN
--dport $ports -j DROPLOG
$IPTABLES -A LAN-Internet -p udp -s 0/0 -d $NET_LAN
--dport $ports -j DROPLOG
done;

DROPLOG is my LOG chain with DROP policy... Is this
script save??? well, it's easy to block port though, I
can just add the ports I like to block in the
"dropport" variable...


Regards,

Adhi


--- Rob Sterenborg <rob@sterenborg.info> wrote:

> > I made a script for my firewall, one of the rules
> is
> > 
> > $IPTABLES -A LAN-Internet -p tcp -s $NET_LSN -d
> 0/0
> > --dport 443 -m state --state NEW,ESTABLISHED -j
> ACCEPT
> > 
> > $IPTABLES -A LAN-Internet -p tcp -s 0/0 --sport
> 443 -d
> > $NET_LAN -m state --state ESTABLISHED -j ACCEPT
> > 
> > with my default policy DROP..
> > 
> > I can open http://www.yahoo.com, but how come I
> can't
> > open the mail.yahoo.com???
> > 
> > In my log list, it says that the packet for port
> 443
> > is blocked, and sometimes port 80 is blocked to???
> > what's wrong with my firewall??? why isn't it
> > stable...
> 
> Try this:
> 
> $ipt -A LAN-Internet -m state --state
> RELATED,ESTABLISHED \
>   -j ACCEPT
> $ipt -A LAN-Internet -m state --state NEW -s
> $NET_LAN \
>   -m multiport -p tcp --dports 80,443 -j ACCEPT
> 
> Why not have the RELATED,ESTABLISHED rule in your
> FORWARD chain? This
> rule will match most traffic so you want it to be
> one of the first rules
> to be checked.
> 
> 
> Gr,
> Rob
> 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

