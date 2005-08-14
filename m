From: Michael Hallager <michael@networkstuff.co.nz>
Subject: Re: IP Tables slows network response times
Date: Sun, 14 Aug 2005 21:54:47 +1200
Message-ID: <200508142154.47484.michael@networkstuff.co.nz>
References: <200508142133.57867.michael@networkstuff.co.nz>
	<1124012967.4878.2.camel@porky>
Reply-To: michael@networkstuff.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1124012967.4878.2.camel@porky>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, netfilter@lists.netfilter.org

Hi Eric.

Don't think so, I fixed the reverse DNS issue earlier:
root@202-150-101-225:/usr/local/Dialect/PaymentClient/config# nslookup 
202.150.101.225
Server:         202.150.101.225
Address:        202.150.101.225#53

225.101.150.202.in-addr.arpa    name = 202-150-101-225.networkstuff.net.nz.

root@202-150-101-225:/usr/local/Dialect/PaymentClient/config# 

This machine runs its own DNS server.

> several seconds ? looks like you've got a timeout problem on name
> resolution (or another network access). Please ensure that DNS or name
> resolution traffic is not blocked.
> More over, add a rule to accept loopback traffic on INPUT, blocked
> loopback traffic could explain problem you have.

Could you please provide a sample of this rule?
-- 
Michael Hallager
networkStuff ltd
www.networkstuff.co.nz | p.09.839.1000 | m.029.638.7883

