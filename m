From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Trigger firewall Script on IP Change:
Date: Sat, 05 Oct 2002 15:53:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPGEHDDBAA.stewart.thompson@shaw.ca>
References: <20021005223853.YOAC27697.mta05-svc.ntlworld.com@there>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20021005223853.YOAC27697.mta05-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

Hi Antony:

	Thanks for the tip. I will have a look.
I new it was possible, I just wasn't sure how.

Regards,

Stu.......


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: October 5, 2002 3:39 PM
To: netfilter@lists.netfilter.org
Subject: Re: Trigger firewall Script on IP Change:

On Saturday 05 October 2002 11:03 pm, Stewart Thompson wrote:

> Hi All:
>
>         Can anyone tell me how to automatically trigger
> my firewall script to execute when the IP on the External
> Interface changes. Thanks.

If your external IP address is changing, you must be using DHCP...

If you're using ISCs dhcpcd, you can create scripts called
/etc/dhcpc/dhcpcd-<ifname>.exe where <ifname> is eth0, eth1, eth2 etc which
will get called whenever there's a new address on the interface.

man dhcpcd for a bit more info.

Antony.

--

I vote "no" to this proposal to form a committee to investigate whether we
should or should not hold a ballot on whether to vote yet.


