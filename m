From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: icmp redirect
Date: Wed, 10 Jul 2002 20:31:08 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <0207102031080D.04513@Lms>
References: <0207101911210A.04513@Lms> <20020710174901.LOAD23840.mta03-svc.ntlworld.com@there>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020710174901.LOAD23840.mta03-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

On Wednesday 10 July 2002 19:46, Antony Stone wrote:
> On Wednesday 10 July 2002 6:11 pm, Jan Humme wrote:
> > I am developing an application that will eventually run on a PC with two
> > ethernet cards; unfortunately the development PC that I use has only one
> > ethernet card (eth0) and no available slots (except for one that I need
> > for another purpose).
> >
> > Doesn't matter, during the development I can have both applications use
> > eth0 instead, if I can only stop the icmp redirect messages that the
> > kernel sends back to the source, whenever it finds out that it is
> > forwarding a packet via the same eth0 interface on which it came in.
> >
> > Of course, I can choke the icmp redirect message using iptables, but is
> > there a better (proper) way, to prevent the message from being generated?
>
> Does it help if you put two addresses onto eth0 from different subnets (eg
> 192.168.0.1 and 172.16.0.1) so that icmp redirect is no longer appropriate
> (because this is used only between machines on a single subnet) ?


That is exactly what I am doing, and lo-and-behold! tcpdump reveals an 
icmp-redirect message.

=> 192.168.255.254: my firewall/internet gateway
=> 192.168.0.1 (eth0) alias 1.2.3.254 (eth0:0) my development machine, using 
192.168.255.254 as the gateway
=> 1.2.3.4 my Windoze test machine, using 1.2.3.254 as its gateway

So when the Windoze machine tries to ping, say 194.134.32.32, it forwards the 
packet to 1.2.3.254, who forwards it back onto the same eth0 towards 
192.168.255.254.

Also, an icmp-redirect message is sent back to the Windoze-machine, telling 
it to forward those packets straight to 192.168.255.254 from now on.


> Then your other machines which are talking to it can pretend that one
> address is eth0 and the other address is eth1.

I wouldn't know how to tell this to my test Windoze box.

Jan Humme.

