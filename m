From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquarede stalls?
Date: Tue, 10 Aug 2004 19:31:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408101931.45838.Antony@Soft-Solutions.co.uk>
References: <20040810202316.17e3a5dd.monk@geotronic.hu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040810202316.17e3a5dd.monk@geotronic.hu>
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

On Tuesday 10 August 2004 7:23 pm, Meszaros Gergely wrote:

> Hi!
>
> Are there any issues about netfilter in kernel 2.4.25 ?
>
> I tried to make a masquerading setup, but all connections from the internal
> network what is larger than a minimal size are stalls, and just waits waits
> waits...
>
> What can it be?

What is the MTU on your external interface?

ifconfig should tell you.

You may need to use clamp-mss-to-mtu if it's less than 1500 bytes.

Regards,

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.


