From: Jason Cook <jg0327@yahoo.com>
Subject: Re: Port Redirection with iptables (Log information)
Date: Wed, 17 Dec 2003 07:45:14 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031217154514.19655.qmail@web41105.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


The information from the lines that do the logging
finally showed up, but I can't make heads or tails of
them.

I'm getting a lot of lines that look like:
Dec 17 09:37:27 redpen kernel: NET: 61 messages
suppressed.
Dec 17 09:37:27 redpen kernel: Neighbour table
overflow.

But the number of messages keeps changing.
And quite a few lines that look like...

Dec 17 09:37:30 redpen kernel: Iptables Error:IN=eth1
OUT= MAC=00:10:5a:26:ee:31:00:e0:b8:54:98:b0:08:00
SRC=10.10.0.252 DST=10.10.0.1 LEN=48 TOS=0x00
PREC=0x00 TTL=128 ID=1958 DF PROTO=TCP SPT=1068 DPT=80
WINDOW=16384 RES=0x00 SYN URGP=0 

Thanks in advance...
Jason

--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> From: Antony Stone <Antony@Soft-Solutions.co.uk>
> To: netfilter@lists.netfilter.org
> Subject: Re: Port Redirection with iptables
> Date: Tue, 16 Dec 2003 16:25:16 +0000
> 
> On Tuesday 16 December 2003 3:21 pm, Jason Cook
> wrote:
> 
> > I am trying to install Linux as a firewall and
> caching
> > server with iptables and Linux.  I
> > need to do this transparently.
> >
> > I installed Red Hat Linux 9.  Ran all of the
> updates
> > nice and smooth.  Turned on ip forwarding.
> > Configured Squid...and tested it by specifying the
> > servers ip address and port 3128 from the
> > browser.  Works great.  Here the options I had
> changed
> > in the config file.
> >
> > http_port 3128
> > http_access deny to_localhost
> > acl our_networks src 10.0.0.0/8
> > http_access allow our_networks
> > httpd_accel_host virtual
> > httpd_accel_port 80
> > httpd_accel_with_proxy on
> > httpd_accel_uses_host_header on
> 
> I'm puzzled by this combination - are you trying to
> set up Squid as a caching 
> proxy, or as an accelerator (or both)?
> 
> You do not need the acceleration options turned on
> to operate Squid as a 
> transparent proxy (and it is not generally
> recommended that you operate a 
> single instance of Squid in both modes
> simultaneously - you can do it, but 
> it's recommended to use two instances of Squid
> instead).
> 
> > For iptables I used
> > iptables -t nat -A PREROUTING -i eth1 -p tcp
> --dport
> > 80 -j REDIRECT --to-port 3128
> >
> > I then try to browse the internet from a client
> > through the firewall and nothing.
> >
> > When I run iptables -t nat -nv -L
> >
> > Chain PREROUTING (policy ACCEPT 31254 packets,
> 3971K
> > bytes)
> >  pkts bytes target     prot opt in     out    
> source
> >              destination
> >     0     0 REDIRECT   tcp  --  eth1   *
> > 0.0.0.0/0            0.0.0.0/0          tcp dpt:80
> > redir ports 3128
> >
> > PREROUTING is accepting packets...but none are
> > processes by the redirect rule.
> 
> I assume that eth1 is your internal LAN interface,
> so that's where the packets 
> will be coming from.   Can you try adding some LOG
> rules so we can see where 
> the packets are really going?
> 
> iptables -I PREROUTING -t nat -p tcp --dport 80 -j
> LOG
> iptables -I INPUT -p tcp --dport 80 -j LOG
> iptables -I FORWARD -p tcp --dport 80 -j LOG
> 
> Antony.
> 
> -- 
> There are only 10 types of people in the world:
> those who understand binary notation,
> and those who don't.
> 
>                                                     
> Please reply to the list;
>                                                     
>       please don't CC me.
> 
> 


__________________________________
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing.
http://photos.yahoo.com/

