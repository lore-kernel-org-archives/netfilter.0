From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: netfilter is missing all the sext extentions on Debian
Date: Mon, 20 Jun 2005 00:00:23 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506192359330.2952@yvahk01.tjqt.qr>
References: <20050619215151.GO3217@metastasis.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050619215151.GO3217@metastasis.org.uk>
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
To: Nick Drage <nickd@metastasis.org.uk>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

>Hi,
>
>I run Debian and unfortunately that means my IPTables rulesets are
>missing all the interesting extensions such as TARPIT that I would like
>to play with.
>
>Does anyone here using the latest IPTables version rather than the
>latest Debian package?  If so, how do you integrate it into Debian and
>how do you get on?

I am using a self-baked mocked-up iptables, i.e. I took the suse src.rpm, and 
added some POMng patches in. The same goes for the kernel.

That makes 1.3.1-andMyNumber + 2.6.11-myNumber (2.6.11-AS16)



Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

