From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: a NAT question
Date: Fri, 16 Jul 2004 20:25:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407162025.05908.Antony@Soft-Solutions.co.uk>
References: <7C9884991ADAE0479C14F10C858BCDF591E342@alderaan.smgtec.com> <20040716185022.GA20595@tranquility.scriptkitchen.com>
Reply-To: Netfilter ML <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040716185022.GA20595@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Friday 16 July 2004 7:50 pm, Payal Rathod wrote:

> On Fri, Jul 16, 2004 at 11:43:05AM -0700, Daniel Chemko wrote:
> > The setup of a Script-only setup isn't too hard. You have to abandon the
> > concept of ip aliases since netfilter dropped support for the concept.
> > You only deal with the root interface and ip addresses.
>
> You mean the something like eth0:1 isn't supported?

It's supported just as much as the (preferred) "ip addr add..." is, so long as 
you keep in mind that netfilter doesn't use anything other than the "real" 
name of the interface, eg: eth0, not eth0:1

However, this makes no difference to your netfilter rules - all the packets 
are really coming in on eth0 anyway, even if ifconfig decided to label the 
second IP address eth0:1

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.



