From: "Paridhi Bansal" <paridhibansal@mail.com>
Subject: RE: help iptables queing (FYI, example test for your understanding)
Date: Thu, 19 Jun 2003 00:02:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030619050233.25831.qmail@mail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: George Vieira <georgev@citadelcomputer.com.au>, IPtables <netfilter@lists.netfilter.org>

HI!!!

what u r trying to say is redirecting all the packets from filter table chains to another user defined chain and from there i will queue it to my application..but all this will unnecessary increase the latency..so i wanted to queue packets to my application directly through filter and nat table chains..

I am really confused as to how these chains work..but this is what i have understood...in my case, i have queued pkts from filter(input chain) and nat(prerouting,postrouitng and output).

As per the documents, every pkt should now be routed through prerouting cahin to my application and then posrtrouting..

From my observation, the first packet of every session comes to prrouting, then forward and then postrouting...If there is no change in the packet headers, then the subsequent packets will only pass FORWARD chain and not pre and postrouting..However, in case any of the headrs is changed, the subsequent pkts of the session will go through all the three chains..

Paridhi

 





----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
Date: Thu, 19 Jun 2003 09:44:51 +1000 
To: "IPtables" <netfilter@lists.netfilter.org>
Subject: RE: help iptables queing (FYI, example test for your understanding)

> For those of you confused above user tables and what netfilter tables can pass what. Try this on a clean iptables system (no rules, preferably not on the internet either). Hopefully I haven't got something wrong (typo)...
> 
> iptables -N TESTTHIS
> iptables -I INPUT 1 -j TESTTHIS # Browse the firewall
> iptables -I FORWARD 1 -j TESTTHIS
> iptables -I OUTPUT 1 -j TESTTHIS
> iptables -A TESTTHIS -p tcp --dport 80 
> 
> iptables -N TESTTHIS -t nat
> iptables -I PREROUTING 1 -p tcp --dport 80 -t nat -j TESTTHIS # Browsing outside
> iptables -A TESTTHIS -t nat -p tcp --dport 80 
> 
> Browse some websites first (http://www.google.com), then browse the firewall (http://yourfirewall) (whether it has a site or not), Now do this:
> 
> iptables -L TESTTHIS -v -n -x
> iptables -L TESTTHIS -v -n -x -t nat
> 
> notice any differences?  Below is what I got:
> [root@firewall proftpd-1.2.8]# iptables -L TESTTHIS -n -v -x -t nat
> Chain TESTTHIS (1 references)
>     pkts      bytes target     prot opt in     out     source               destination
>       33     1980            tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:80
> [root@firewall proftpd-1.2.8]# iptables -L TESTTHIS -n -v -x
> Chain TESTTHIS (3 references)
>     pkts      bytes target     prot opt in     out     source               destination
>       39     2318            tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:80
> 
> I notice my TESTTHIS space is duplicated but there's a copy in the "nat" filter and one in the "filter" filter.. but they don't see each other...
> 
> This is why I just use the "filter" one as it catches ALL rules except ones that may be dropped at the PREROUTING stage. The example above is just to show you how
> 
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
> 
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
> 
> -----Original Message-----
> From: Paridhi Bansal [mailto:paridhibansal@mail.com]
> Sent: Wednesday, June 18, 2003 9:01 PM
> To: IPtables
> Subject: re: help iptables queing
> 
> 
> hi!!
> 
> iptables -t nat -L 
> shows me that PREROUTING, POSTROUTING nad OUTPUT chains are queuing the pkts to my application ...moreover, i am getting the first ppkt in prerouting chain..
> 
> Paridhi
> 
> DId you use `iptables -N QUEUE` ?
> Your QUEUE table would only work for tables in the "filter", so it only
> works for INPUT, FORWARD and OUTPUT and not the table of "nat" table.
> 
> For some reason I couldn't create a QUEUE which different tables could cross
> over.. ie. -t nat can't  -j to a QUEUE which is created in -t filter.... get
> it..
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Paridhi Bansal
> Sent: Wednesday, June 18, 2003 7:39 PM
> To: netfilter@lists.netfilter.org
> Subject: help iptables queuing
> 
> 
> HI!!
> 
> I am using RedHat linux 7.3 with iptablesv1.2.5..I am using iptables queuing
> to get the packets to my application...I have used thefollowing
> iptables' commands:
> 
>         iptables -t nat -A OUTPUT -j QUEUE
>         iptables -t nat -A PREROUTING -j QUEUE
>         iptables -t nat -A POSTROUTING -j QUEUE
>         iptables -A INPUT -j QUEUE
> 
> But instead of getting all the packets,i just get first packet of every
> connection.For example, just first packet of TCP telnet, FTP connection
> (with SYN bit set and ACK not set )and not the subsequent packets.Why is
> this so?????
> 
> Can somebody help me with the explanation of this??????
> 
> 
> 
> -- 
> __________________________________________________________
> Sign-up for your own FREE Personalized E-mail at Mail.com
> http://www.mail.com/?sr=signup
> 
> CareerBuilder.com has over 400,000 jobs. Be smarter about your job search
> http://corp.mail.com/careers
> 
> 
> 

-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

CareerBuilder.com has over 400,000 jobs. Be smarter about your job search
http://corp.mail.com/careers


