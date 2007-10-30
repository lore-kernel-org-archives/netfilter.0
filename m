From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Gateway with Iptables
Date: Tue, 30 Oct 2007 22:00:30 +1300
Message-ID: <4726F2AE.1060108@treenet.co.nz>
References: <472568A2.3040002@liqwidkrystal.com> <4725BF05.5000708@liqwidkrystal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4725BF05.5000708@liqwidkrystal.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tarak Ranjan <tarak.ranjan@liqwidkrystal.com>
Cc: netfilter@vger.kernel.org

Tarak Ranjan wrote:
> 
>> Amos wrote:
>> I believe you need to exempt the traffic from squid (local machine 
>> IPA) from the REDIRECT about here.
>>
>> $IPT -A PREROUTING -p tcp -s $SQUID_SERVER --dport 80 -j ACCEPT
>>
>> ... And use "http port 8080 transparent" in the squid.conf
>>
>>
>> > $IPT -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT 
>> --to-port $SQUID_PORT
>> > 
>> ############################################################################### 
>>
> but after applying this users are able to connect to the Internet 
> directly without enable proxy. what else i have to do to stop direct 
> connection , they must use proxy.
> 

Huh? that should ONLY exempt the proxy, not the client machines. I'm not 
100% certain of the rule as I use shorewall to simplify the config a lot.

Do you mean the users are actually logged into the proxy server?

Or that it _looks_ like clients can connect directly. Check the 
access.log of squid to be sure.

The entire point of transparent is so clients don't do any config, the 
proxy silently makes internet 'just work' for any allowed browsing.

Amos
