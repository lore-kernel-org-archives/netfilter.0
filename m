From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 20:10:47 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0910232003430.8539@blackhole.kfki.hu>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <4AE163B6.9040706@chello.at> <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910230951060.13472@spider.phas.ubc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl Michal <michal@physics.ubc.ca>
Cc: netfilter@vger.kernel.org

On Fri, 23 Oct 2009, Carl Michal wrote:

> 
> DNS queries are definitely allowed.  My problem is somewhat intermittent -
> sometimes an scp transfer will complete, sometimes it won't.  When an scp
> transfer of a file stalls, it often stalls at the
> same point in a file.
> 
> Karl + Matt:
> 
> Stalls are when there's something going on - usually heavy traffic.
> If a file transfer is going to stall, its usually near the beginning - in the
> first few 100 kB or so.
> 
> This is just a local firewall, this machine isn't doing any routing.
> 
> iptables -I INPUT -p tcp --dport 22 -j ACCEPT
> doesn't seem to help.
> 
> I tried the --clamp-mss-to-pmtu option, but it didn't help
[...]
> 10:11:53.666783 IP 128.189.212.241.49536 > spider.phas.ubc.ca.ssh: S
> 1204070872:1204070872(0) win 5840 <mss 1380,[|tcp]>
> 10:11:53.666819 IP spider.phas.ubc.ca.ssh > 128.189.212.241.49536: S
> 3213527017:3213527017(0) ack 1204070873 win 5792 <mss 1460,[|tcp]>

Different MTU sizes? It does look like an MTU problem. What kind of 
Internet connection do you have? What is your network topology?

Try to set MSS to 1380 with the TCPMSS target in the OUTPUT chain.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
