From: Ed W <lists@wildgooses.com>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 16:34:46 +0000
Message-ID: <508D5EA6.8040004@wildgooses.com>
References: <5088717B.6080300@wildgooses.com>
	<1351412418.2740.5.camel@andylaptop>
Reply-To: ntop-dev@unipi.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <ntop-dev-bounces@listgateway.unipi.it>
In-Reply-To: <1351412418.2740.5.camel@andylaptop>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://listgateway.unipi.it/mailman/options/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=unsubscribe>
List-Archive: <http://listgateway.unipi.it/pipermail/ntop-dev>
List-Post: <mailto:ntop-dev@listgateway.unipi.it>
List-Help: <mailto:ntop-dev-request@listgateway.unipi.it?subject=help>
List-Subscribe: <http://listgateway.unipi.it/mailman/listinfo/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=subscribe>
Sender: ntop-dev-bounces@listgateway.unipi.it
Errors-To: ntop-dev-bounces@listgateway.unipi.it
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org, ntop-dev@unipi.it

On 28/10/2012 08:20, Andrew Beverley wrote:
> On Wed, 2012-10-24 at 23:53 +0100, Ed W wrote:
>> Hi all.  There is an interesting project that was called opendpi
>> (originally by ipoque GmbH) and recently been forked and maintained by
>> the ntop guys under the nDPI label.  It offers a new and currently
>> maintained layer 7 (L7) packet identification library.
> That's great news.
>
> I had a play with l7-filter some time ago, which I assume is similar to
> nDPI. How do the 2 projects compare?

Actually, just to augment my last answer.

The biggest thing I pick out as "interesting" in nDPI is that it has a 
go at inspecting SSL traffic and odd sub protocols of http (eg Skype, 
Windows Update).  Given that we are rapidly seeing everything start to 
look like an HTTP protocol and then there is SSL on top, it's tricky to 
classify stuff like Skype or Facebook traffic.  nDPI can do this 
(although would benefit from more work in this area). So if your SSL 
certificate says mail.google.com, then you can guess the "protocol" in 
use...

So if you want a one trick reason to try nDPI, right now you can use it 
to block/prioritise/time-restrict Skype... (or Windows Update, etc)

I have a load of users on expensive satellite connections and I need to 
help protect them from themselves so being able to prevent Windows 
Update from banging 10MB down a $30/MB connection is very helpful.  I 
also use your squid patches to do sticky per user conntrack labelling of 
traffic and hence enabling users to choose a traffic profile (so they 
can choose to do the above if they really want to...)

Cheers

Ed W
