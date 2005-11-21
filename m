From: =?windows-1252?Q?=3Fukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: Where is TARPIT -- iptables V. 1.3.4
Date: Mon, 21 Nov 2005 20:07:29 +0100
Message-ID: <43821AF1.7050409@wp.pl>
References: <462d0fec0511210948v12bf4046i8836b4ba3797abef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462d0fec0511210948v12bf4046i8836b4ba3797abef@mail.gmail.com>
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
To: NetFilter <netfilter@lists.netfilter.org>

Richard R napisa?(a):
> am using linux kernel 2.6.14.2

hmm.. well afaik the tarpit extension is only for kernels < 2.6
*btw, I just checked, here's how it looks

http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/patchlets/TARPIT/info?rev=4018&view=markup
Title: iptables TARPIT target
Author: "Aaron Hopkins" <lists@die.net>
Status: Works for me
Repository: extra
Requires: linux < 2.6.0

> How do I get TARPIT working on a linux kernel 2.6.14.2 based system? 
well so far (I have also a 2.6.x kernel) I've been using the pom
and just changing the above in the 'info' file to "> 2.4.0" and it 
didn't complain about a thing ;) I know that's a dirty way of doing it, 
but hey, it's working fine for me :)

-- 
Best wishes
?ukasz Hejnak

