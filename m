From: "Alfred E. Heggestad" <alfredh@sxdesign.com>
Subject: Re: netfilter: port restricted NAT
Date: Wed, 29 Oct 2003 23:55:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067468104.18806.66.camel@tellus>
References: <1066914957.10239.128.camel@tellus>
	 <20031028234921.GA19394@home.tig-grr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031028234921.GA19394@home.tig-grr.com>
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
To: Tom Marshall <tommy@home.tig-grr.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-10-29 at 00:49, Tom Marshall wrote:
> Opening RTP conversations with SIP can be quite complicated -- perhaps
> impossible -- if you allow both sides to be behind a NAT.  Even with only
> one side behind a NAT, it's not easy.
> 
> You are correct that netfilter is a "port restricted cone".  This is by
> design -- it's not secure to do it the other way.  Your typical consumer
> "residential gatemay" device, on the other hand, will only map the external
> port to an internal ip/port regardless of the source.
> 
many thanks for your answer - you confirmed by suspicion of netfilter
being port restricted. After long time of testing and configuration
I now realise this. I agree that the other way is not secure.
To bad those deployed SIP proxies out there have two or more separate
UDP sockets which result in the source port being random...


> In order to make STUN/RTP work with Linux, you need to multiplex the
> protocols.  Your client must send the STUN request to the negotiated port(s)
> on the server, and the server must be listening on those ports for both STUN
> and RTP requests.  Now, if your server is also behind a NAT, you are stuck. 
> You need a relay that is openly accessible to act as a relay.
> 
RTP works fine, but only if the device behind the NAT box sends the
first UDP packet - hence keeping the connection open - and the other
device sends from the same source port as it is listening on.
Well, this is pure luck though...

/alfred

> On Thu, Oct 23, 2003 at 03:15:58PM +0200, Alfred E. Heggestad wrote:
> > Hi
> > 
> > I have a question about restricted NAT vs. port restricted NAT
> > in the implentation of netfilter in 2.4.18 kernel. We are
> > developing Voice-over-IP products using SIP for signalling,
> > where the packets normally go over UDP port 5060.
> > 
> > For VoIP devices located behind NATs we use a protocol called
> > "STUN - Simple Traversal of UDP Through NATs" (RFC3489) to probe
> > for public interface ip/ports, and refresh connection tracking
> > in netfilter for outgoing/incoming RTP streams. The SIP proxies
> > and/or devices are located on the public network.
> > 
> > This works quite well with most SIP proxies but we have seen some
> > cases where the response is "lost" in the gateway (linux 2.4.18)
> > This is the case where the source port of the response is not the
> > same as destination port of the request. I have looked around in
> > these files:
> > 
> >   net/ipv4/netfilter/ip_conntrack_proto_udp.c
> >   net/ipv4/netfilter/ip_nat_proto_udp.c
> > 
> > and it looks like the connection tracker requires the response to
> > come from the same port as the ougoing request was sent to.
> > 
> > Typical scenario:
> > 
> > 
> > -------------------------------------------
> > [           DEVICE 10.47.11.109           ]
> > -------------------------------------------
> >     |
> >     |
> >    \/
> > src: 10.47.11.109:5060
> > dst: 80.80.80.80.5060
> >     |
> >     |
> > -------------------------------------------
> > [       GATEWAY 213.187.186.10            ]
> > -------------------------------------------
> >     |                                 /\
> >     |                                  |
> >    \/                                  |
> > src: 213.187.186.100:5060     src:80.80.80.80.12345
> > dst: 80.80.80.80:5060         dst:213.187.186.100:5060
> >     |                                 /\
> >     |                                  |
> >    \/                                  |
> > -------------------------------------------
> > [        SIP PROXY 80.80.80.80            ]
> > -------------------------------------------
> > 
> > 
> > The packet is lost in the gateway.
> > 
> > >From RFC3489:
> > 
> >    Restricted Cone: A restricted cone NAT is one where all requests
> >       from the same internal IP address and port are mapped to the same
> >       external IP address and port.  Unlike a full cone NAT, an external
> >       host (with IP address X) can send a packet to the internal host
> >       only if the internal host had previously sent a packet to IP
> >       address X.
> > 
> >    Port Restricted Cone: A port restricted cone NAT is like a
> >       restricted cone NAT, but the restriction includes port numbers.  
> >       Specifically, an external host can send a packet, with source IP 
> >       address X and source port P, to the internal host only if the    
> >       internal host had previously sent a packet to IP address X and   
> >       port P.
> > 
> > 
> > This behaviour I suspect would be close to the "Port Restricted Cone"
> > definition. My main question is: With netfilter, is it possible at all
> > to have only "Restricted Cone" with no source port checking and if yes
> > how is this possible to configure?
> > 
> > I have read through iptables man page and searched www but could not
> > find any reference to my problem.
> > 
> > 
> > For reference, here is the iptables NAT table on my gateway:
> > 
> > root@uranus:~# iptables -t nat -vL
> > Chain PREROUTING (policy ACCEPT 1762K packets, 285M bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> > 
> > Chain POSTROUTING (policy ACCEPT 833K packets, 209M bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> >  177K   11M MASQUERADE  all  --  any    eth0    10.47.10.0/24        anywhere           
> >  107K   13M SNAT       all  --  any    eth0    anywhere             anywhere           to:213.187.186.100 
> > 
> > Chain OUTPUT (policy ACCEPT 227K packets, 26M bytes)
> >  pkts bytes target     prot opt in     out     source               destination  
> > 
> > 
> > 
> > Hopefully you are able to understand my question, thanks for any help.
> > 
> > /alfred

