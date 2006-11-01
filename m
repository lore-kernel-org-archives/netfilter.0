From: "plugthebox.net /dev/null" <devnull@plugthebox.net>
Subject: Re: RE: INPUT and PORTS
Date: Wed, 01 Nov 2006 17:26:56 +0200
Message-ID: <1162394816.17873.41.camel@localhost>
References: <20061101145719.564.qmail@webmail91.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061101145719.564.qmail@webmail91.rediffmail.com>
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
To: bimal pandit <bimal_pandit@rediffmail.com>
Cc: netfilter@lists.netfilter.org

I want to thank you all for contributing. 

I'm currently setting up a firewall and a web interface for it. My
strategy is to have:

/sbin/iptables -P INPUT -j DROP
/sbin/iptables -P FORWARD -j DROP
/sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -d 10.2.2.116 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.116 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.116 -j ACCEPT
/sbin/iptables -A FORWARD -d 10.2.2.117 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.117 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.117 -j ACCEPT
etc...
/sbin/iptables -A INPUT -j DROP
/sbin/iptables -A FORWARD -j DROP

Meaning, i want to accept the connections from these 3 IPs, and drop all
the rest. Now i want to let those allowed IPs to only use 3 ports for
the INPUT and more than 30 ports for FORWARDs (p2p and misc ports).

I can't use -m multiport for each FORWARD, there are too many ports that
1 FORWARD line can run. 

I thought by allowing the ports BEFORE the IPs, that it would accept
allow only the ports ACCEPTed to the IPs ACCEPTed, is that correct?

thanks,
Sincerely,

On Wed, 2006-11-01 at 14:57 +0000, bimal pandit wrote:
> Dear All,
> 
> 
> On Wed, 01 Nov 2006 anisha.chandrasekaran@wipro.com wrote :
> >
> >I would like to have a little more clear idea on what you need to do
> >exactly????
> >
> >That is, DO you need to allow only 80 and 20 ports from the specified
> >ip?
> >In that case you can have
> >Iptables -P FORWARD DROP
> >Iptables -A FORWARD -p tcp -s 10.2.2.115 -m multiport --dports 80,22
> -j
> >ACCEPT
> >
> >The above rule will allow only 80 and 22 requests from that ip. Is
> this
> >clear or am I not answering what you are asking????
> >
> >
> >  Regards,
> >
> >Anisha Chandrasekaran
> >
> >
> >
> >-----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> >[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
> >plugthebox.net /dev/null
> >Sent: Wednesday, November 01, 2006 6:19 PM
> >To: netfilter
> >Subject: INPUT and PORTS
> >
> >Hello,
> >I want to do the following, accept in comings from 10.2.2.115 only
> >restricting to port 80,22
> >
> >is this correct?
> >
> >-P rules ...
> >-F rules ...
> >/sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
> >/sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
> >/sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
> >/sbin/iptables -A FORWARD -m multiport -p tcp --ports 80,22 -j ACCEPT
> >/sbin/iptables -A INPUT -m multiport -p tcp --ports 80,22 -j ACCEPT
> >
> >Eventhough i saw this setup in many tutorials/howtos,  when ever i
> want
> >to block 10.2.2.115 (by not listing him in the INPUT -j ACCEPT), that
> ip
> >can still connect to port 80 and 22.
> >
> >
> >
> >Thanks
> >Sincerely,
> >
> >
> in my view, since you have already accepted all the connections from
> 10.2.2.115, so there is no question of blocking it as iptables work on
> "FIRST MATCH FOUND".
> 
> regards,
> 
> Bimal Pandit
> 
> 
> 
> 


