From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to make 1 I/P look as if from many?
Date: Sat, 19 Jun 2004 14:17:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406191417.54526.Antony@Soft-Solutions.co.uk>
References: <000001c4543c$07655970$c801a8c0@kevinwr01>
Reply-To: "iptables" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c4543c$07655970$c801a8c0@kevinwr01>
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
To: iptables <netfilter@lists.netfilter.org>

On Thursday 17 June 2004 8:23 am, Kevin Robertson wrote:

> I have a project that requires a kind of reverse NAT. That is, to make one
> IP address appear as if it is coming from many IP addresses.
>
> I understand that you can give a range of I/P address such as:
>
> ## Change source addresses to 1.2.3.4, 1.2.3.5 or 1.2.3.6
> # iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4-1.2.3.6
>
> however, the other element is I would like it to round robin through the IP
> address range and not use the "least currently used" IP algorithm.
>
> Does anyone have suggestions on how to accomplish this?

I would have thought converting "least used" to "round robin" would be a 
fairly simple hack to the SNAT source code?   Certainly much easier than the 
other way around, anyway...

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


