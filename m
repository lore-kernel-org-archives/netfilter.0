From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How can be user time management implemented through netfilter for MASQ?
Date: Tue, 10 Aug 2004 09:03:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408100903.13687.Antony@Soft-Solutions.co.uk>
References: <20040809205650.45180.qmail@web40414.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040809205650.45180.qmail@web40414.mail.yahoo.com>
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

On Monday 09 August 2004 9:56 pm, E-mail by Joe wrote:

> hi/
> I'm facing some problem for user time management like
> Squid. I want to let some user get the internet connection for 12 hours and
> some users for 24 hours. how can i do  this with netfiltering?

Use the "-m time" match.

You can match on:
 - earliest time of day a packet may match
 - latest time of day a packet may match
 - day of week a packet may match
 - earliest date a packet may match
 - latest date a packet may match

You could set up one rule matching the 12 hour slot you want to restrict some 
users not to be able to use, and jump to a user-defined chain which checks 
for the IPs you want to block during that 12 hour period.

Regards,

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


