From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: http-rules and browsing ebay Problem
Date: Wed, 11 Feb 2004 12:43:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402111243.54271.Antony@Soft-Solutions.co.uk>
References: <10581301.1076502927332.JavaMail.ngmail@webmail02.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <10581301.1076502927332.JavaMail.ngmail@webmail02.arcor-online.net>
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

On Wednesday 11 February 2004 12:35 pm, mgeschermann@arcor.de wrote:

> Hi all,
>
> I spend a lot of time on building my own firewall-script. Mostly everything
> is working fine (some things aren't tested yet), but I've got a tricky
> problem and hope you can help me.
>
> If I want to open the ebay-site from either the firewall or an client my
> browser tells me after a some seconds "This site could not be displayed."
>
> I've done some logging and noticed, that after the reply I get a packet
> with status "NEW" from ebay. (within a few seconds after the the first
> reply)

What sort of packet?   Show us the log (preferably with both the original 
connection, and the new packet, including the timings).

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


