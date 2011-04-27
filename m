From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Proxy Filter iptable Settings
Date: Wed, 27 Apr 2011 18:48:29 +0530
Message-ID: <4DB817A5.3020604@atc.tcs.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>	<1303885014.18916.10.camel@andybev-desktop>	<BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>	<4DB80945.8040304@atc.tcs.com> <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/27/2011 06:15 PM, Mike Hendrie wrote:
> I tried:
> sudo  iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
> REDIRECT --to- 8080
> iptables -t nat -A POSTROUTING -s 172.20.0.0/16 -j MASQUERADE
>
> And still ended up with the same message

You should not have both rules in place. Basically Andy's suggestion and 
my suggestion are based on two different assumptions. Please select one, 
based on your scenario.

Scenario #1 Running Web Proxy

If you are running a web proxy like squid, please ensure that it is 
listening on the correct port (seems, 8080 in your case), and configured 
correctly (to allow your subnet etc).

Also, ensure that the machines on the LAN have the proxy settings in 
place, for various applications like web browser, email client etc.

I am not sure why do you need an iptables rule in this scenario. Are you 
looking for something like, the machines on the LAN won't have proxy 
settings for different applications, but still have to reach Internet 
through web proxy?

Scenario #2 Configuring server as the Internet Gateway

If you want to configure your server as the Internet Gateway, please add 
the following iptables rule to the server,

iptables -t nat -A POSTROUTING -s 172.20.0.0/16 -j MASQUERADE

Also, ensure that all the machines in the LAN should point your server 
as the default gateway.

ip ro add default via 172.20.1.1

Here, I assume that your server's internal IP is 172.20.1.1.


Regards,
Vignesh
