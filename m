From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: How to know inside a match which chain is calling
Date: Tue, 17 Oct 2006 13:54:24 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0610171349030.18869@blackhole.kfki.hu>
References: <2FEE63312285CF428A8480B07AC1C359036187D0@CHN-SNR-MBX01.wipro.com>
	<4534BB76.7060500@it.uc3m.es>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4534BB76.7060500@it.uc3m.es>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aoliva <aoliva@it.uc3m.es>
Cc: netfilter@lists.netfilter.org

On Tue, 17 Oct 2006, aoliva wrote:

> Sorry for being unspecific. I have implemented a match, this match is called
> in the chains OUTPUT and INPUT. I would like to know a way of accessing an
> structure or calling a function or something similar in order to be able of
> doing a switch inside the match changing the behaviour if the match is called
> from OUTPUT or INPUT.

You can't figure out the calling chain in a match: netfilter does not 
provide the data. You have to pass the info as a command line option.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

