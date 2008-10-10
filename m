From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Different kind transparent proxy
Date: Fri, 10 Oct 2008 13:04:31 -0500
Message-ID: <48EF992F.7010106@riverviewtech.net>
References: <48EDE496.8000900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48EDE496.8000900@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/09/08 06:01, Brent Clark wrote:
> I have a basic home setup, the router / gate and the proxy server sit on 
> different machines (Dont want squid on the FW).

*nod*

> I have a client that I want to access the web, but via squid.
> 
> The proxy and the client, both are on the same LAN etc.

The proxy and the client on the same LAN is a clue.

> Here are my rules.
> 
> For PREROUTING nat I have
> 186 10692 DNAT       tcp  --  eth1   *      !192.168.111.9        
> 0.0.0.0/0           multiport dports 80,443 to:192.168.111.9:3128
> 
> In my FORWARD filter I have
> 
> 362 20472 LANWEB     tcp  --  *      *       0.0.0.0/0            
> 0.0.0.0/0           tcp dpt:3128

You are missing a critical rule.  (I'll get to it after an explanation 
of what is happening.)

> For my LANWEB chain I have
> 
> Chain LANWEB (1 references)
> target     prot opt source               destination        LOG        
> tcp  --  0.0.0.0/0            192.168.111.9       LOG flags 0 level 4 
> prefix `ECCOWALL I'
> ACCEPT     tcp  --  0.0.0.0/0            192.168.111.9      LOG        
> tcp  --  0.0.0.0/0            192.168.111.9       LOG flags 0 level 4 
> prefix `ECCOWALL O'
> 
> For some reason I cant get this working.
> I have a look at the squid logs and theres nothing.

There won't be.

> Using tcpdump on the gateway I am seeing,
> tcpdump -n -i eth1 port 3128
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
> 12:54:55.611493 IP 192.168.111.31.40550 > 192.168.111.9.3128: S 
> 233035686:233035686(0) win 5840 <mss 1460,sackOK,timestamp 3618633 
> 0,nop,wscale 6>
> 12:54:55.611653 IP 192.168.111.9.3128 > 192.168.111.31.40550: S 
> 1234458253:1234458253(0) ack 233035687 win 5792 <mss 
> 1460,sackOK,timestamp 737699015 3618633,nop,wscale 2>

I'm surprised that you are seeing the second packet here.  Are you using 
a hub rather than a switch?  (Not that it really matters.)

> And on squid
> 
> root@eccowall:~# tcpdump -n port 3128
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
> 12:56:42.322401 IP 192.168.111.31.42990 > 192.168.111.9.3128: S 
> 1202540725:1202540725(0) win 5840 <mss 1460,sackOK,timestamp 3645306 
> 0,nop,wscale 6>
> 12:56:42.322693 IP 192.168.111.9.3128 > 192.168.111.31.42990: S 
> 2913335189:2913335189(0) ack 1202540726 win 5792 <mss 
> 1460,sackOK,timestamp 737725700 3645306,nop,wscale 2>
> 12:56:42.322435 IP 192.168.111.31.42990 > 192.168.111.9.3128: R 
> 1202540726:1202540726(0) win 0

This is what I would expect.

> But i cant understand cause the browser is not displaying anything.

In short, this is what is happening on your network.

1)  Client sends a request to the web server via the firewall.
        <Client MAC>, <Firewall MAC>, <Client IP>, <Web Server IP>
2)  Firewall redirects the packet to the proxy.
        <Firewall MAC>, <Proxy MAC>, <Client IP>, <Proxy IP>
3)  Proxy fulfills the request and replies.
        <Proxy MAC>, <Client MAC>, <Proxy IP>, <Client IP>
4)  Client gets a reply from the proxy that it did not ask for and says 
"Go Away!", better known as a "RST".
        <Client MAC>, <Proxy MAC>, <Client IP>, <Prosy IP>

What you need to do is SNAT the traffic that is being redirected to the 
proxy server.  That way the proxy server will reply to the firewall 
which will then un-redirect the traffic back to the real client.

You are suffering from what I call the "TCP Triangle".

> If anyone could help, it would be appreciated.

*nod*

Try SNATing traffic from the firewall to the proxy server.  (I might add 
only SNAT traffic that originates from your local LAN.)



Grant. . . .
