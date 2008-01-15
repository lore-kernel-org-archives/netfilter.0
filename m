From: "Peter T. Breuer" <P.T.Breuer@cs.bham.ac.uk>
Subject: Re: [help] modern iptables rule for transproxy
Date: Tue, 15 Jan 2008 20:33:34 +0100 (CET)
Message-ID: <200801151933.m0FJXYGD011494@betty.it.uc3m.es>
Reply-To: ptb@inv.it.uc3m.es
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Gonzalo Arana" wrote:
> On Jan 12, 2008 8:59 AM, Peter T. Breuer <ptb@inv.it.uc3m.es> wrote:
> > > >    ipchains -A input -p tcp -d 0.0.0.0/0 80 -j REDIRECT 8081

> > > iptables -t nat -A PREROUTING -i $LOCAL_IFACE -p tcp -s ! $PROXY_BOX \
> > > --dport 80 -j REDIRECT --to-ports 8081
> >
> > Yes, thanks. I've been trying variants on that for some time, with no
> > success.

> >   Chain PREROUTING (policy ACCEPT)
> >   target     prot opt source               destination
> >   REDIRECT   tcp  -- !<proxyhost>          anywhere            tcp dpt:www redir ports 8081


> Perhaps your are running 'telnet news.bbc.co.uk 80' on the same box as
> tproxy is running. 

Yes, indeed, that's the whole idea, and the objective, and the problem.
There's no "perhaps" in it! That's the problem description. How to get
outgoing http requests to distant port 80s to be redirected to a proxy
daemon sitting on port 8081 of the LOCAL machine instead.


> If that's the case, telnet's connection may be using
> <proxyhost> as source IP address.

What would be bad about that? And if it is bad, what would one do about
it? I'm puzzled ...

Hmm ...  Why would it be so?  - why should telnet decide to set the
source address on its outgoing packets to that of a distant machine? It
should set the source packet address by looking up the local hostname
(-i), if it does it at all.  Or why should linux decide to do that on
behalf of telnet?  It should set the source address to that of the
outgoing interface.  The redirect rule moves packets that are leaving
to port 80 (on distant machine) via eth0 over to local port 8081
on localhost instead.  That's what the redirect target does:

iptables(8):

   REDIRECT
          This target is only valid in the nat table, in the PREROUTING
          and OUT- PUT chains, and user-defined chains which are only
          called from those chains.  It redirects the packet to the
          machine itself by changing the destination IP to the primary
          ^^^^^^^^^^^^^^^
          address of the incoming interface (locally-generated packets
          are mapped to the 127.0.0.1 address).  It takes one option:

Now, it's in the nat table, so I presume some port or address mangling
goes on.  The man page doesn't say exactly what.  I would suppose
however that a listening socket on local port 8081 which is established
AFTER the rule is put in place would get packets destined at distant
port 80s, and I should see some kind of activity as they are received.

But I don't.

As far as the man page does say, the change that is made by the rule is
that the packet destination address:80 is changed to the address:8081
bound to eth0 locally.  That's what it says.  There can't be a loop
because 8081 != 80.

If I telnet to localhost 8081 I get to talk to the waiting tproxy
daemon. So there's no problem about that. It even works! get http:foo/
HTTP/1.0 works as a command - the tproxy daemon proxies it onward.

What I don't do is get through to the tproxy daemon sitting on localhost
8081 when I telnet out to a distant host on its port 80. I don't know
why. How does one debug iptables?!!!


Thanks for any advice!

Peter

(ps .. please cc: ptb@cs.bham.ac.uk on the reply - I'm not subscribed
directly and news is firewalled - that's why I need proxies!).







