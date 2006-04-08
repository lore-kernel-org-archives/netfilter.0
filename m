From: Mike Auty <mike.auty@gmail.com>
Subject: Re: libnetfilter_queue conditions required to rewrite packets...
Date: Sat, 08 Apr 2006 02:50:00 +0100
Message-ID: <443716C8.3060409@gmail.com>
References: <44348A27.60602@gmail.com>	
	<859616420604052330gc251080q95738ef1d112b465@mail.gmail.com>
	<859616420604070655n35ced2eau5c6968f5d2e3f029@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420604070655n35ced2eau5c6968f5d2e3f029@mail.gmail.com>
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
To: David Vogt <beunlovable@gmail.com>
Cc: netfilter@lists.netfilter.org

Looks as though,
	The code in the subversion repository's quite different, so I've 
checked out a copy of that and I'm gonna give it a test when I next get 
a chance.  It requires >=libnfnetlink-0.0.16, so that's also gonna have 
to be built from subversion.
	The changes include incrementing the size of the structure to include 
the size of the payload, and also the structure holding the payload is 
defined outside the conditional statement.  These I think, should mean 
the packet's better formed and hopefully will do the actual mangling...
	I'm not sure how far away those packages are from becoming releases, 
but it seems they have some definite enhancements in them...
	Mike  5:)

