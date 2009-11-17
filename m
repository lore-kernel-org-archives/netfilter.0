From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Disabling conntrack for local net
Date: Tue, 17 Nov 2009 11:03:45 +0100
Message-ID: <4B027501.2010303@chello.at>
References: <034DEBCAE934A74991E6E76B8DA72D14185DD509DA@HSSBS.holdstead.local> <4AE13AA6.5080509@chello.at> <4AE14B9E.9050705@chello.at> <034DEBCAE934A74991E6E76B8DA72D14185DD509DD@HSSBS.holdstead.local> <034DEBCAE934A74991E6E76B8DA72D14185DD50A7F@HSSBS.holdstead.local>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D14185DD50A7F@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Gary Smith wrote:
> Can anyone tackle the problem below?  I need to NAT an external IP/Port internally (actually multiple, but one sample will do).  I also need to access these from internally as well through the NAT'ing (because we don't control DNS).  The final caveat is that we would like to skip conntrack for everything else (like MySql connections originating from one of the NAT'd boxes going to a non-NAT'd box internal, etc).
>
>   
>> Here is an example of the rules we are running right now:
>>
>> _A PREROUTING -d 208.35.34.20 -p tcp -m tcp --dport 53 -j DNAT --to-
>> destination 10.40.16.21
>> -A PREROUTING -d 208.35.34.20 -p udp -m udp --dport 53 -j DNAT --to-
>> destination 10.40.16.21
>> -A PREROUTING -d 208.35.34.20 -j DNAT --to-destination 10.40.16.29
>> ...
>> -A POSTROUTING -s 10.40.16.21 -o eth1 -p tcp -m tcp --sport 53 -j SNAT --to-
>> source 208.35.34.20
>> -A POSTROUTING -s 10.40.16.21 -o eth1 -p udp -m udp --sport 53 -j SNAT --to-
>> source 208.35.34.20
>> -A POSTROUTING -s 10.40.16.29 -o eth1 -j SNAT --to-source 208.35.34.20
>> ...
>> -A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth1 -j SNAT --to-source 208.35.34.2
>>
>>
>> Given this, can someone whip up the proper raw/nat/filter on how to make this
>> NOTRACK and be able to route back inside?
>>
>>     

Well, the RAWNAT target didn't seem to fit you?

You could always use iproute2 to do static nat.

OR - get routable IP addresses...


Regards

Mart


