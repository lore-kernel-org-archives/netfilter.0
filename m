From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bastion Firewall Host Redirect Question
Date: Tue, 14 Dec 2010 14:59:11 +0000
Message-ID: <4D07863F.3070603@abpni.co.uk>
References: <000601cb9b9e$c6e81e30$54b85a90$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000601cb9b9e$c6e81e30$54b85a90$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iic1tls@yahoo.com, netfilter@vger.kernel.org


>
> QUESTION
> Given that clients on the internal network can freely surf the internet: if
> the clients select a specific web site (ie www.website.com), my goal is to
> configure IPTables to instead redirect the client to the internal web
> server.
>
> - If the client web browser is going to surf www.website.com, then iptables
> redirects the client to 149.10.10.25
> - If the client web browser is going to surf any other website, then
> iptables permits the client to forward to the internet.
>
>
Use a local DNS server and set the hostname of the site that you want to 
re-direct to your local webserver. You can secure this setup a bit more 
by using a proxy server (Squid + SquidGuard) to prevent clients entering 
the IPs directly. The only thing that IPTables would do is make sure 
that only your proxy server can access the internet directly
