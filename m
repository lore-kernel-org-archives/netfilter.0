From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall problem continued
Date: Tue, 10 Aug 2004 09:26:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408100926.33589.Antony@Soft-Solutions.co.uk>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408091231.33128.Antony@Soft-Solutions.co.uk> <20040810081418.GA22730@tranquility.scriptkitchen.com>
Reply-To: Netfilter ML <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040810081418.GA22730@tranquility.scriptkitchen.com>
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

On Tuesday 10 August 2004 9:14 am, Payal Rathod wrote:

> On Mon, Aug 09, 2004 at 12:31:33PM +0100, Antony Stone wrote:
> > Exactly the same as your extisting PREROUTING rule, but you put it in the
> > OUTPUT chain instead (still in the nat table):
> >
> > iptables -A OUTPUT -t nat -d 1.2.3.4 -p tcp --dport 25 -j DNAT --to
> > 10.10.10.2
>
> As I said earlier that now I can access the mail server at 10.10.10.2
> from the firewall machine using its external IP. But now I need to access
> the mailserver from the same machine itself using the external IP.

Why does the mail server need to refer to itself using the public IP?

Why can't it know its own private IP?

As an additional comment, you appear to be digging yourself further and 
further into a situation of "I wouldn't do it like that, but if you really 
need to...."

You should be cautious about doing too many things one after another which are 
simply needed as workarounds for a strange network setup, or a non-ideal DNS 
setup, and sooner or later you need to stop adding workarounds and change the 
underlying design.

Regards,

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

                                                     Please reply to the list;
                                                           please don't CC me.


