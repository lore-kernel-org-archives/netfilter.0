From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Iptables execution time
Date: Thu, 16 Oct 2008 20:17:30 +0200
Message-ID: <48F7853A.20500@unipex.it>
References: <48F77A0F.1050405@unipex.it> <48F77E8A.6080502@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48F77E8A.6080502@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo Neira Ayuso wrote:
> I think that it's taking the time in forking and executing, but you 
> can do some profiling so we can stop speculating.
> 

How do it? It's a "simple" script that repeater N times that same thing,
more or less (where N are ~1500)

And after, also if it's not a iptables-related question, why that so
time for do the fork and execute when It's, at least, two time faster
than the test one?

>> P.s. Yes, I know that the same rules with iptables-restore on my 
>> test server takes about 0.5 sec :)
> 
> So, why don't you use that interface? :)
> 


Why leave the right way for follow the new one that you don't know where
it'll bing you? :). Ok I'll take a look for update my script system!


Thanks,
Michele
