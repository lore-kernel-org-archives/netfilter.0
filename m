From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables not forwarding port 443
Date: Tue, 06 Jul 2010 13:03:21 -0500
Message-ID: <4C336FE9.3080403@riverviewtech.net>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C336248.8060700@freemail.hu> <BAY145-w1402AA6231A6B64AC93F23F3B20@phx.gbl>,<4C336757.5080100@freemail.hu> <BAY145-w19572F836A9A64C0737FC2F3B20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-w19572F836A9A64C0737FC2F3B20@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/06/10 12:40, J. Webster wrote:
> No, there is no proxy in the middle in this testing case, I believe 
> that's why the packets are received at port 443 on the server but 
> then somehow dropped.

Do you show OpenVPN log entries indicating that connections are being 
attempted?  Or is this failing during the TCP three-way-handshake?

Have you tried running TCPDump (or the likes) to watch the traffic?

> Is there anything wrong with the iptables rules that might stop this?

I don't see any thing glaringly obvious.

I do question what the source port is on the reply traffic.  It may be 
(a modified version of) what I call the TCP-Triangle (1) that is causing 
things to break.

> It was recommended by the OpenVPN users list.

I've also read that OpenVPN can run over port 443, but I've not messed 
with it my self to know how well it will work.

> Yes, I could but that makes an administration problem to do with 
> status logs and other stuff I think.

Can you do it lone enough to test?

1:  TCP-Triangle is when traffic from a client (C) is directed to a 
front end server (F) which then redirects to a back end (B) server and 
because of various situations the back end (B) server replies directly 
to the client (C).  So what you end up with is C talks to F but replies 
come from B back to C causing C to reject / reset the reply all the 
while timing out the initial outgoing packet.

C -> F
      C -> B
      C <- B
C <- B
C -> B        (RESET I'm not talking to you.)
     ...
C -> F        (Timeout)



Grant. . . .
