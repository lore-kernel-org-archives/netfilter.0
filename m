From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Iptables execution time
Date: Thu, 16 Oct 2008 19:48:58 +0200
Message-ID: <48F77E8A.6080502@netfilter.org>
References: <48F77A0F.1050405@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48F77A0F.1050405@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

Michele Petrazzo - Unipex srl wrote:
> Hi list,
> I'm seeing that the execution of an iptables update via a shell script
> take very different time into a my "in production" server and on my test
> server. My script has about 1500 iptables commands and simple insert a
> rule on a table.
> 
> On my in production server, it takes about 45 sec and on my test server 4!
> My server are 2x Xeon 2.6GHz (so 4 cpus) with 2.6.26 on x86_64 SMP with
> 2GB ram and my test server amd  3000+ with 2.6.26 i686 1GB,
> 
> Can be that, on the production server that has a lot of connection it
> take so lot of time due the connections (I try to say that it has to "lock"
> the kernel before and "unlock" after an iptables add) or there can be some
> problems?

I think that it's taking the time in forking and executing, but you can
do some profiling so we can stop speculating.

> P.s. Yes, I know that the same rules with iptables-restore on my test
> server takes about 0.5 sec :)

So, why don't you use that interface? :)

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
