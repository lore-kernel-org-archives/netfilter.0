From: Michael <mutk@ozemail.com.au>
Subject: Re: IP Traffic Accounting
Date: Mon, 24 Jun 2002 22:27:41 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D17103D.5060400@ozemail.com.au>
References: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net> <20020623225040.A26831@tiger.csl.uiuc.edu> <3D16B131.4090202@ozemail.com.au> <200206241033.LAA14840@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: IPtables Users <netfilter@lists.samba.org>

Antony Stone wrote:

>On Monday 24 June 2002 6:42 am, Michael wrote
>
>I have had experience with similar programs, for example ipmeter
>
>>(http://www.ipmeter.org).
>>
>
>Hi Michael.
>
>Could you check and confirm that URL please ?
>
>Doesn't work from where I am.....
>
Oops, it's a dot com, not dot org. Much appologies.
Do a dig on www.ipmeter.com....it was up once upon a time!!

In any case the web page must have been pulled down or is offline for 
some reason. Here's a link to a mirror that carries it.

http://www.mirrors.wiretapped.net/security/network-monitoring/ipmeter/

In a nutshell, the thing is designed from ground up to run on FreeBSD, 
and it's not really a program, but a collection of scripts to use 
NetraMet. Two ways to get it going, download the install cdrom image, 
and burn CD, or download the source and run some scripts to set it up on 
a fresh FreeBSD installation.

The Install CDrom is easiest, but uses an old BSD version. I found the 
old FreeBSD version very flakey on the hardware we had, with it running 
out of system resorces. I managed to get it all going on a later FreeBSD 
4.4, with a bit of tweaking and it has been rock solid. Due to the way 
it's been implemented, it won't run anylater than PostgresSQL 7.0.2 
without some big changes (It has some custom SQL functions that clash 
with new ones in later versions).

Ours is actually still running now, 73 days uptime. Last downtime due to 
power supply failure...

If you are really curious about how it looks, I can make the admin front 
end available for you to browse. It's in service right now, monitoring 
about 70 users, but sometime in the near future it will be de-comissioned.

Some free advice, avoid it !!! It's BSD, it is slightly clunky, very 
resource hungry etc. It's good for monitoring servers, not so much users 
accessing Internet. Some excellent ideas there though, so for some 
inspiration, it's worth a look.

Cheers,
Michael




