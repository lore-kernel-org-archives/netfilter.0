From: "Jawed Ahmed" <jawed.ahmed@adaniwilmar.in>
Subject: (Fwd) RE: (Fwd) transparent proxying using Dansguardian
Date: Tue, 23 May 2006 18:35:50 +0530
Message-ID: <44735606.6526.B08AFDE@jawed.ahmed.adaniwilmar.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-description: Mail message body
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


------- Forwarded message follows -------
hi, 
thanks for responding.. 
I tried the command suggested by you on the linux box. 

I get this error... 

iptables 1.2.7a: can't use -i with postrouting 
try help for more information 

does it mean I need to upgrade the iptables or anything else... 

Jawed Ahmed 

On 23 May 2006 at 14:51, Sietse van Zanen wrote: 

> You need to add a masquerading rule for the port 443 traffic. Masqueing behind the 
IP of your linux machine. 
> iptables -t nat -A POSTROUTING -i eth0 -p tcp --dport 443 -j SNAT --to ip.of.linux.box 
> and ofcourse allow this traffic. 
>   
> Other method is allowing the IP addresses of your clients in the ISA (RRAS) servers  
to access port 443 on the Internet. 
>   
> -Sietse 
>  
> ________________________________ 
>  
> From: netfilter-bounces@lists.netfilter.org on behalf of Jawed Ahmed 
> Sent: Tue 23-May-06 14:26 
> To: netfilter@lists.netfilter.org 
> Subject: (Fwd) transparent proxying using Dansguardian 
>  
>  
>  
>  
> ------- Forwarded message follows ------- 
> Hi group, 
> I am having a similar kind of problem. 
>  
> I run Dansguardian and Squid on a linux Redhat 9 box. 
>  
> and my source of internet is a DSL modem connected to another win2k PC. I have  
set  
> up RRAS service on the Win2k machine and allowed the linux pc access to ports 443  
> and 80. 
>  
> on my linux pc I have given the IP of the win2k machien as gateway IP. using this  
setup,  
> I am able to access all sites of internet from the linux machine locally. 
>  
> on the client PCs if I configure the proxy to connect to the IP address of the linux  
> machine and port number on which Dansguardina runs, then all sites open properly. 
>  
> but if I configure the IP of the linux machine as gateway IP on the clients and  
configure  
> Internet explorer to connect directly to internet, then I am able to open only the normal  
> sites, I can't open secure sites. 
>  
> on the linux machine I ran the following command 
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to- 
> port 8080 
>  
> can anyone please suggest me if I need to do something else.. 
>  
> thaks 
> Jawed Ahmed 
>  
>  
>  
> On 22 May 2006 at 20:26, Martijn Lievaart wrote: 
>  
> > Elijah Alcantara wrote: 
> >  
> > >> See http://lists.debian.org/debian-user/2004/05/msg01434.html 
> > >> 
> > >> HTH, 
> > >> M4 
> > > 
> > > 
> > > Checked out the link. Actualy I'm not really planning to cache secure 
> > > connections like ssl, I only wanted to be able to redirect that 
> > > request to go directly to the internet (bypass squid). 
> > > 
> > > I currently have an iptable rule for that but it's currently not 
> > > working right... 
> >  
> >  
> > Ah, I see. How about 
> >  
> > -A POSTROUTING -p tcp --dport 443 -j SNAT --to 192.168.100.2 
> >  
> > Don't forget to turn on forwarding as well and create appropriate  
> > forwarding rules. 
> >  
> > Personally I would set this firewall between your clients and the  
> > Internet, in that case you don't need SNAT tricks, just basic FORWARDING  
> > rules. 
> >  
> > M4 
> >  
> >  
> >  
> > ----------------------------------------------------------------------------- 
> > Fortune: India's No 1 edible oil brand. 
> > Visit us at www.adaniwilmar.com 
> > ------------------------------------------------------------------------------ 
>  
>  
> --  
> 9825325766 
> 079-25555625,25555634 
> jawed.ahmed@adaniwilmar.in 
> ------- End of forwarded message ------- 
> -- 
> 9825325766 
> 079-25555625,25555634 
> jawed.ahmed@adaniwilmar.in 
>  
>  
> ----------------------------------------------------------------------------- 
> Fortune: India's No 1 edible oil brand. 
> Visit us at www.adaniwilmar.com 
> ------------------------------------------------------------------------------ 
>  
>  
>  
>  
>  
> ----------------------------------------------------------------------------- 
> Fortune: India's No 1 edible oil brand. 
> Visit us at www.adaniwilmar.com 
> ------------------------------------------------------------------------------ 


--  
9825325766 
079-25555625,25555634 
jawed.ahmed@adaniwilmar.in 
------- End of forwarded message -------
-- 
9825325766
079-25555625,25555634
jawed.ahmed@adaniwilmar.in


-----------------------------------------------------------------------------
Fortune: India's No 1 edible oil brand.
Visit us at www.adaniwilmar.com
------------------------------------------------------------------------------

