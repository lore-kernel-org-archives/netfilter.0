From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: filtering HTTP signatures/headers ?
Date: Wed, 1 Mar 2006 18:31:18 +0100 (CET)
Message-ID: <64303.193.173.147.3.1141234278.squirrel@webmail.sterenborg.info>
References: <64843.193.173.147.3.1141215185.squirrel@webmail.sterenborg.info>
	<20060301154001.71840.qmail@web51114.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060301154001.71840.qmail@web51114.mail.yahoo.com>
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

On Wed, March 1, 2006 16:40, S t i n g r a y wrote:
> will it filter out HTTP tunneling also ?

Do you mean you have a VPN tunnel which transfers http, or what ? If that=
 is
the case, I don't think so ; Squid can only inspect traffic that it can s=
ee of
course. However, if the Squid-box is at the end of the tunnel you may be =
able
to do it.
But maybe I don't understand correctly what problem you are trying to sol=
ve.


Gr,
Rob

> --- Rob Sterenborg <rob@sterenborg.info> wrote:
>> On Wed, March 1, 2006 12:45, S t i n g r a y wrote:
>> > Is it possible to filter HTTP signatures/headers
>> > with Iptables ? or is there addon for it ?
>>
>> You may be able to use the String match but you can
>> only filter the payload of 1 packet at a time : if a
>> signature/header spans multiple packets then it
>> won't work.
>>
>> Netfilter is not meant to do content filtering.
>> Perhaps you can use Squid.
>>
>>
>> Gr,
>> Rob



