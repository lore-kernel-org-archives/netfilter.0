From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: Re IPv6 MARK support
Date: Thu, 01 Mar 2007 17:42:19 +0200
Message-ID: <45E6F45B.4090509@caf.com.tr>
References: <200702281053.l1SArNIC025800@toshiba.co.jp>	<200702281136.l1SBaJLe019021@toshiba.co.jp>	<2acb06d50702280353q10529555vebd20e93ee7040e1@mail.gmail.com>	<200702281238.l1SCcE4F016826@toshiba.co.jp>	<2acb06d50703010232k64325368l2cfab895b460c9b7@mail.gmail.com>	<2acb06d50703010305u3bc7a1d9h862b8d01bed685c4@mail.gmail.com>
	<45E6EEA9.4050009@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=caf.com.tr; s=originating;
	t=1172763745; bh=Aj8qPG5cSLUI8QnTVVuAFiyZ5LI=; h=DomainKey-Signature:
	X-Virus-Scanned:Received:Received:Received:Message-ID:Date:From:
	Organization:User-Agent:MIME-Version:To:Subject:References:
	In-Reply-To:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding:X-OriginalArrivalTime; b=dWQupH9AdWqARj2v
	L06s51gIPvK2y+Ywy8b/gkhy78Ioq0YySqDadlItaPVEuyAgw0qOyMRTDxlPRCiD9NF
	+GBLyX4l5ACFbMlTZz6q5pLRDFh9JM4hIafJmISJR1Q5L7lnJWvHAjptWqET63VfddZ
	q250oU4taOtXL2+//R6mY=
In-Reply-To: <45E6EEA9.4050009@plouf.fr.eu.org>
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
To: netfilter@lists.netfilter.org

Pascal Hambourg wrote:
 >> and
>> not the IPv6 adress of the default route. Is it possible on PREROUTING
>> hook to change the IPv6 address of the outgoing packets ?
> 
> I'm afraid not. This is not even possible in IPv4. It is possible to NAT
> the IPv4 source address in the POSTROUTING chain, but there is no such
> support for IPv6 NAT (and don't think there will ever be any).

I remember reading a comment for such a request from a member of the
core team (think it was Harald Welte).  The comment was  "over my dead
body".  So yeah it is a pretty safe bet that it won't happen.

-- 
Eray

