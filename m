From: Jason Opperisano <opie@817west.com>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 22:43:06 -0400
Message-ID: <20050414024306.GA32458@bender.817west.com>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
	<20050413211349.GA31336@bender.817west.com>
	<1113436673.3544.186.camel@seberino.spawar.navy.mil>
	<20050414013525.GA32192@bender.817west.com>
	<425DC848.5090909@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <425DC848.5090909@riverviewtech.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Apr 13, 2005 at 08:32:56PM -0500, Taylor Grant wrote:
> >yeah--somewhere around line 1434 of:
> >
> >  /usr/src/linux-2.4.28/net/ipv4/route.c
> >
> >on the machine i'm looking at.
> 
> Do you have any idea where the corresponding code would be in the 2.6 
> kernel?  I was not aware that such a filter did exist.  Personally I'd like 
> a way to turn it off and set up my firewall the way that I want.  IMHO this 
> could be considered a hidden bug.

same file (/usr/src/linux-2.6.11/net/ipv4/route.c) around line 1583.

considering this a "hidden bug" might be a bit bold of you...IMHO.

-j

--
"Richie: Mom, uh, I really like Potsy.
 Mrs. Cunningham: Well, Potsy's a nice boy, dear. Why shouldn't you
 like him?
 Richie: No, I mean... I REALLY like Potsy.
 Mr. Cunningham: We heard you the first time, son, you've got a
 homosexual attraction to Potsy."
        --Family Guy

