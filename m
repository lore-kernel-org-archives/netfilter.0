From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: transparent proxy
Date: Sat, 13 Mar 2010 09:21:23 +0100
Message-ID: <4B9B4B03.7000708@chello.at>
References: <21B7BA85E0A248919216BC6546842EFB@sence> <857a760cf2ade9bdadec40329e2e010b@mail.treenet.co.nz>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <857a760cf2ade9bdadec40329e2e010b@mail.treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 10.03.2010 01:23, netfilter-owner@vger.kernel.org wrote:
> On Wed, 10 Mar 2010 00:44:14 +0100, "Marco Schuth" <marco@it-schuth.net>
> wrote:
>> Hello,
>>
>> Iam using iptables on my router, and have a dedicated proxy server with 
>> squid sarg and squidguard running.
>>
>> all the clients send the request for a website to the default gw (router
> 
>> 10.12.0.1) the router redirects (dnat)
>> the package to the proxy server ip:10.12.0.250
>> but in the logs i get the ip from the router.
> 
> NAT destroys the IP addresses before they leave the machine doing NAT.
> Please read the Squid FAQ examples of how to configure policy routing ...
> 
> Router:
>  http://wiki.squid-cache.org/ConfigExamples/Intercept/IptablesPolicyRoute
> 
> Squid box:
>   http://wiki.squid-cache.org/ConfigExamples/Intercept/LinuxDnat
> 
> Amos
> Squid Project


Hello,

I'd like to ask, if in the above examples, the ACCEPT rules need to be
placed in the mangle table?
Is there a specific reason, couldn't it be done in the filter table?
As that would be the intended/preferred use for filtering?
If so, don't the examples teach people 'bad manners'?

Best regards

Mart

