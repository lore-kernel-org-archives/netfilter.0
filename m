From: Stephen Johnson <stephen.johnson@arkansas.gov>
Subject: Re: problem in openning a port
Date: Thu, 12 May 2011 10:34:10 -0500
Message-ID: <1305214450.32402.77.camel@sjohnson.state.ar.us>
References: <713633.15807.qm@web111723.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <713633.15807.qm@web111723.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 2011-05-12 at 10:05 -0500, Mahmood Naderan wrote:
> Hi,
> beofore openning  a port, I checked which port is open:

> 
> Then I opened a port with
> 
> 
> mahmood@client:~$ sudo iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dport 4949 -j ACCEPT
> [sudo] password for mahmood:
> mahmood@client:~$ 
> 
> 
> However netstat doen't show it is open:

> What is wrong?
> // Naderan *Mahmood;

There are two issues here. The iptables rule you specified will only
allow network traffic to flow to that port. It will not enable any
service to hang off of that port.

Secondly on the open port issue via netstat. Netstat only shows ports
that are in use on the system via processes. In order to have port 4949
to be in use (i.e. LISTEN state) a process has to create the socket and
bind to it. Iptables has nothing to do with that. 


-- 
Stephen Johnson <stephen.johnson@arkansas.gov>

