From: ads nat <adsnat@yahoo.com>
Subject: RE: Is it possible to Jam windows network neighbour?
Date: Wed, 25 Aug 2004 01:01:04 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040825080104.94531.qmail@web60403.mail.yahoo.com>
References: <1093372602.3704.71.camel@Sewak.Asr.Lan>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093372602.3704.71.camel@Sewak.Asr.Lan>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: skpobox@hotpop.com, Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

O.K. 
I am putting a fictitious situation as follows :

Linux server with iptables firewall acts as Gateway
for internet configured as DHCP server with only mac
address setup in DHCP configuration file, having win
98 clients. 
Another Linux server acts as File server, having it's
owm iptables rules to block unwanted mac-addresses
same win 98 clients also acts as DHCP server.

Now win client setup have Gateway IP as IP of Internet
Gateway and WIN server IP as IP of file server.

DHCP HOWTO asks to add following lines for individual
clients in DHCP configuration file.

####
host xyz {
   hardware ethernet 08:00:2b:4c:59:23;
   fixed-address 192.168.1.222;
}

####
In this case Can i use above setting by eliminating
line specifying IP address (fixed-address
192.168.1.222;
)?

so that IP addrress/subnet of client will not be known
to anybody.

Now if outside user with Laptop try to connect to this
network with one of the network switch, with concent
of any win 98 client user and in absence of
administator by assigning any IP address of any subnet
(By trying permutation combination of 192.0.0.0,
10.0.0.0, 172.0.0.0) then will not get access to any
win 98 machine by netbour neighbour.

I am not sure whether this will work, I should try but
in the mean time is it feasible?

Hope i have made requirements clear.

Thanks for support.

--- Sanjay Arora <skpobox@hotpop.com> wrote:

> On Tue, 2004-08-24 at 23:00, Jason Opperisano wrote:
> 
> > 
> > so, essentially, put every machine on its own
> dedicated subnet and have all traffic routed through
> the firewall?  that sounds scalable...
> > 
> > -j
> > 
> Never claimed scalable ;-) 
> 
> Sanjay.
> 
> 
> 
> 

--- Sanjay Arora <skpobox@hotpop.com> wrote:

> On Tue, 2004-08-24 at 23:00, Jason Opperisano wrote:
> 
> > 
> > so, essentially, put every machine on its own
> dedicated subnet and have all traffic routed through
> the firewall?  that sounds scalable...
> > 
> > -j
> > 
> Never claimed scalable ;-) 
> 
> Sanjay.
> 
> 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

