From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help on port forwarding
Date: Wed, 3 Jul 2002 23:40:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703224036.SAYN295.mta03-svc.ntlworld.com@there>
References: <F23E54D22310BE448D4630B1BB02C1583068@armadillo.inspireit.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F23E54D22310BE448D4630B1BB02C1583068@armadillo.inspireit.com.au>
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
To: netfilter@lists.samba.org

On Wednesday 03 July 2002 11:24 pm, Simon McLeod wrote:

> I currently have a linux machine with a perm modem connection to the
> net.  I'm using iptables to port forward from this machine to other
> machines in my private network.  All is working fine.
>
> I've now just installed ADSL in bridged mode and want to do exactly the
> same thing.  I've installed the ADSL modem on a second ethernet card in
> the linux machine, and it's talking to the net fine.  When I setup port
> forwarding for the IP address of the ADSL connection, it doesn't work.
> For example, if I don't have any iptables rules, I can telnet to the IP
> address of the ADSL connection and get to the linux machine fine.  If I
> add a port forward rule for telnet to another host, when I try and
> telnet to it from the net, it just says "trying" and doesn't go
> anywhere.  Both connections have static IP's, and I disconnected the
> modem link and flushed the iptables rules before trying it with the ADSL
> link.
>
> I used the following line to do the port forwarding - works fine on the
> modem link, but doesn't work on the adsl link - can anyone tell me why?
>
> (obviously x.x.x.x was substituted with the appropriate connection IP
> address)
>
> -A PREROUTING -d x.x.x.x -p tcp -m tcp --dport 23 -j DNAT
> --to-destination 10.20.0.1:23

What do you get if you zero all the packet counters
iptables -Z
then try telnetting from the outside through your port forwarding rule, wait 
for the timeout, and then look at the packet counters:
iptables -L -v -x
iptables -L -t nat -v -x

Does it look like any packets got through the FORWARDing rules ?
Does it look like any packets got through the PREROUTING rule ?

I think either this, or some judicious LOG statements to see if your system's 
dropping packets, will help solve this one.

I agree if it works on the modem, though, it should work on the ADSL...

 

Antony.

