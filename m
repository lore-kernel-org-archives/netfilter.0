From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: owner module
Date: Tue, 10 Aug 2004 19:41:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408101941.33072.Antony@Soft-Solutions.co.uk>
References: <20742.1092159513@www45.gmx.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20742.1092159513@www45.gmx.net>
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

On Tuesday 10 August 2004 6:38 pm, Daniel Boy wrote:

> Hello,
>
> The ethereal-log shows that the CLIENT is possible
> to send the FIN,ACK. The SERVER responds with a
> FIN,ACK and then waits for the leading ACK from the
> CLIENT. But the "--cmd-owner" statement has gone
> false before the last ACK could be send.
>
> If I take out the "--cmd-owner" the last ACK is send.

That seems like a good solution to me.   Use the owner match for the NEW 
packets, and then just accept all ESTABLISHED packets (independent of owner) 
after that.

No process other than the one you want will be able to send the first packet, 
so there will be no established connections except from the correct 
processes.

Regards,

Antony.

-- 
"Linux is going to be part of the future. It's going to be like Unix was."

 - Peter Moore, Asia-Pacific general manager, Microsoft

                                                     Please reply to the list;
                                                           please don't CC me.


