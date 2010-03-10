From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: transparent proxy
Date: Wed, 10 Mar 2010 13:23:26 +1300
Message-ID: <857a760cf2ade9bdadec40329e2e010b@mail.treenet.co.nz>
References: <21B7BA85E0A248919216BC6546842EFB@sence>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <21B7BA85E0A248919216BC6546842EFB@sence>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Schuth <marco@it-schuth.net>
Cc: netfilter@vger.kernel.org

On Wed, 10 Mar 2010 00:44:14 +0100, "Marco Schuth" <marco@it-schuth.net>
wrote:
> Hello,
> 
> Iam using iptables on my router, and have a dedicated proxy server with 
> squid sarg and squidguard running.
> 
> all the clients send the request for a website to the default gw (router

> 10.12.0.1) the router redirects (dnat)
> the package to the proxy server ip:10.12.0.250
> but in the logs i get the ip from the router.

NAT destroys the IP addresses before they leave the machine doing NAT.
Please read the Squid FAQ examples of how to configure policy routing ...

Router:
 http://wiki.squid-cache.org/ConfigExamples/Intercept/IptablesPolicyRoute

Squid box:
  http://wiki.squid-cache.org/ConfigExamples/Intercept/LinuxDnat

Amos
Squid Project
