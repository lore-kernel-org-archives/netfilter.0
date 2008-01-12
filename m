From: "Peter T. Breuer" <ptb@inv.it.uc3m.es>
Subject: Re: [help] modern iptables rule for transproxy
Date: Sat, 12 Jan 2008 11:59:35 +0100 (CET)
Message-ID: <200801121059.m0CAxZdG008224@betty.it.uc3m.es>
Reply-To: ptb@inv.it.uc3m.es
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Amos Jeffries wrote:
> Peter T. Breuer wrote:
> > I'd be much obliged if somebody could give me a modern iptables
> > equivalent for this ipchains rule
> > 
> >    ipchains -A input -p tcp -d 0.0.0.0/0 80 -j REDIRECT 8081
> 
> My auto-generated FW has this (with suitable replacements):
> 
> iptables -t nat -A PREROUTING -i $LOCAL_IFACE -p tcp -s ! $PROXY_BOX \
> --dport 80 -j REDIRECT --to-ports 8081

Yes, thanks. I've been trying variants on that for some time, with no
success. Stracing the tproxy daemon on port 8081 shows no sign of
activity at all when I do a

   telnet news.bbc.co.uk 80

for example. Is there a canonical way to debug iptables? I'm sure there
must be. tcpdump shows nothing on port 8081 on any interface I can think
of, but the telnet news.bbc.co.uk 80 gets through! It must be avoiding
the REDIRECT somehow.


The tproxy is clearly bound to port 8081

   bind(4, {sa_family=AF_INET, sin_port=htons(8081), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
   listen(4, 128)                          = 0

and is stuck in an accept.

iptables --t nat -L shows

  Chain PREROUTING (policy ACCEPT)
  target     prot opt source               destination
  REDIRECT   tcp  -- !<proxyhost>          anywhere            tcp dpt:www redir ports 8081

and nothing else. The builtins' rules (INPUT, etc.) are all empty.

When I try and talk to port 80 on a distant machine, I ought to be making a
socket which is bound to it with a high local port number. I can see net
traffic from distant port 80s to high ports on my machine with tcpdump,
but no sign of anything stirring on port 8081.


Peter
