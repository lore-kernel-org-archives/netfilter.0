From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: Fw: IPtables (resend)
Date: Mon, 20 Jan 2003 11:19:21 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ba01c2c032$ba642be0$0bc8c80a@dolphin>
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
To: "netfilter@lists" <netfilter@lists.netfilter.org>


----- Original Message -----
From: "Jet" <yenjet.chan@eglobal.com.my>
To: "Miguel Amador L." <amador@puc.cl>
Cc: <netfilter-request@lists.netfilter.org>
Sent: Monday, January 20, 2003 11:00 AM
Subject: Re: IPtables


> (sorry, I don't speak spanish)
>
> What i do to mitigate the problem are as below:
>
> iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state NEW -j DROP
>
> where eth0 is my network interface that face outside.
> I still don't know if this will break any protocol (or service) to work
> properly.
> So far, it seems to work for my testing.
>
> Basically, here is how I test my firewall (A.B.C.1)
> My firewall have a rule to allow incoming HTTP connection to my web server
> (A.B.C.8)
> At my firewall, I run a tool called iptstate to show me the connection
state
> on the firewall.
> First I try with normal SYN connection.
> hping -c 1 -S -a spoof.ip -p 80 A.B.C.8
>
> Then, the tool, iptstate shows SYN_SEND, and immediately changed to
SYN_RECV
> The TTL is set to one minute. This is good.
> And this is correct state that firewall suppose to have.
>
> Next, I try to do some evil test
> hping -c 1 -A -a spoof.ip -p 80 A.B.C .8
>
> Now,  the tool, immediately shows the state of the connection as
ESTABLISHED
> and having the
> TTL as 120 hours. This is bad because this is a packet that have the state
> "NEW" with only "ACK"
> tcp flag been turned on.
>
> Imagine, it an attacker spoof with a lot of IP addresses (maybe >10K) of
> this type of packets, then
> the firewall will filled up with all unnecessary packets that expire after
> 120 hours.
> This means a DOS attack to your firewall.
>
> I've experienced a performance slow down becasue of this.
>
>  - Jet
> Security Analyst
>
> email: jchan@trusecure.com
>
>
>
> ----- Original Message -----
> From: "Miguel Amador L." <amador@puc.cl>
> To: "Jet" <yenjet.chan@eglobal.com.my>
> Sent: Friday, January 17, 2003 10:47 PM
> Subject: Re: IPtables
>
>
> > Hi, i have the same problem, and i had to make a DMZ , on other ip range
> for
> > work with servers. (it is the correct way)
> >
> > but i know that may be can with combining DNAT and SNAT, but i don't
want
> > probe.
> >
> > if you be can do it... plase , tell me how are you do it..
> >
> > SAlu2
> > Miguel
> >
> > PS: speak spanish ?
> >
> >
> > Jet writes:
> >
> > > Can anyone pls verify that whether iptables is vulnerable to the
> following
> > > bugtraq ID?
> > >
> > > http://www.securityfocus.com/bid/6534
> > >
> > > Base on my testing (1.2.7a), it is vulnerable too.
> > >
> > >  - Jet
> > > Security Analyst
> > >
> > > email: jchan@trusecure.com
> > >
> > >
> > >
> >
> >
> >
>


