From: arif <djreef@yahoo.com>
Subject: Re: forwarding rule (internal webserver) HELLPP!!
Date: Tue, 16 Mar 2004 09:32:19 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040316173219.5817.qmail@web10202.mail.yahoo.com>
References: <20040316021346.GG26800@samad.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040316021346.GG26800@samad.com.au>
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
To: netfilter@lists.netfilter.org


--- Alexander Samad <alex@samad.com.au> wrote:
> On Mon, Mar 15, 2004 at 11:10:20AM -0800, arif
> wrote:
> > Anyone know why the following rule does not work
> when
> > i use SNAT but does when i use MASQUERADE??
> > 
> > /sbin/iptables -A PREROUTING -t nat -p tcp -d
> 63.x.x.x
> > --dport 80 -j DNAT --to 10.0.0.3:80
> > 
> > When I use the following rule, the previous rule
> > works: 
> > /sbin/iptables -t nat -A POSTROUTING -o eth1 -j
> > MASQUERADE
> > 
> > but when i do it like this, i just get a
> connection
> > refused from the outside:
> > /sbin/iptables -t nat -A POSTROUTING -s
> 10.0.0.0/24 -o
> > eth0 -j SNAT --to-source 63.203.63.246
> 
> Not sure if its a typo MASQ is for eth1 and the SNAT
> is for eth0 
> 
> > 
> > Both work as far as NAT'ing my internal hosts, but
> i
> > cant get the darn forward to work! thanks!! :)
> > 

yes, you are correct, i made a typo - the MASQ rule
should read:
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j
MASQUERADE

i still can't get this port forward to work no matter
what i try with SNAT, i guess i will just use
masquerade although i really wish i knew why i can't
get it to work with SNAT :(

__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com

