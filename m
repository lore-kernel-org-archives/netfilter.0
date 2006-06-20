From: Vincent Regnard <devel@regnard.org>
Subject: conntrack utility
Date: Tue, 20 Jun 2006 19:10:09 +0200
Message-ID: <44982BF1.8090102@regnard.org>
Reply-To: devel@regnard.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I've been playing with the conntrack recently, mainly to get 
conntrack_sip working. Because I had some problems having it working on 
a router with no nat. I compiled the conntrack utility, expecting to 
make some debug with it. But I cannot have the conntrack utility 
working. I use latest available version of the required libs and utility:

- libnfnetlink-0.0.14
- libnetfilter_conntrack-0.0.30
- conntrack-1.00beta1

together with a kernel 2.6.16.20 and iptables 1.3.5

When invoking conntrack as root I always get the following error:

Operation failed: invalid parameters

I am apparently not the only one having this kind of trouble (cf this 
list post on february 17th). I am wondering if there is any chance I can 
have a release of conntrack working. Do some of you have it working (if 
so what version of the libraries/conttrack do you play with ?).

If you have any hints, I would be glad to ear from you. Just knowing it 
work somewhere else and people use it sometimes would make me happy, so 
I could carry on compiling on other environement and pray god a bit more 
longer.

thanks for your feedback

Vincent

