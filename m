From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ROUTING A IP and ERASE the URL EXTENSION ?
Date: Sat, 13 Mar 2004 10:51:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403131051.07728.Antony@Soft-Solutions.co.uk>
References: <23362.1079174150@www13.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <23362.1079174150@www13.gmx.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Saturday 13 March 2004 10:35 am, RedNuX@gmx.at wrote:

> On my network a Client has problems with an URL which has burned in, in his
> system. Even if I remove the entries from registry, the URL is there with a
> restart again.
>
> The Problem is the URL-Extension... ( $HATEIP/index.php?v=4&aff=2130 ) ...
>
> Is it possible to be deleted this extension or gives it another possibility
> the inquiry on " $HATEIP / index.php? V=4*aff=2130 " on "google.de" farther
> supply?

Yes - use Squid, with its rewrite capability.   You could probably get Apache 
to do this for you as well, running in proxy mode.

This is not a task for netfilter.

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


