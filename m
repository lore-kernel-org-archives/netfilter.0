From: lartc@ssi.bg
Subject: Re: netfilter CPU usage
Date: Sun, 13 Jun 2004 21:16:49 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <32855.212.36.22.250.1087150609.squirrel@mail.ssi.bg>
References: <33105.217.79.71.234.1087126250.squirrel@mail.ssi.bg>
    <200406131626.17416.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406131626.17416.Antony@Soft-Solutions.co.uk>
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

> On Sunday 13 June 2004 12:30 pm, lartc@ssi.bg wrote:
>
>> Hello
>>
>> Can someone tell me just how intensive netfilter is towards CPU?
>>
>> Is it posible for 6000 rules with no target set in the FORWARD chain to
>> eat up about 60% of my P4 2.4 GHz?
>
> I would be very surprised at this, however you haven't said what sort of
> bandwidth you're shovelling through the machine, and this will clearly
> make a difference to the CPU usage.

yes - the bandwidth was the issue. thanks for the help.


