From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: logging to console
Date: Tue, 16 Dec 2003 17:19:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312161719.31221.Antony@Soft-Solutions.co.uk>
References: <E1AWIhV-0000pk-W3@aphex.cyberpixels.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AWIhV-0000pk-W3@aphex.cyberpixels.com>
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

On Tuesday 16 December 2003 5:10 pm, Ben wrote:

> I'd be interested in knowing how to do this as well

I thik several people would.   It's come up a few times before on this list.   
Short of delving into the netfilter source code, I don't know of a way to do 
it.

Maybe the ULOG target would help in this case, instead of LOG?

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Hurley, Michael
> Sent: Tuesday, December 16, 2003 11:45 AM
> To: Netfilter (E-mail)
> Subject: RE: logging to console
>
> Thanks for your reply, Antony. Changing the log-level to 7 seems to have
> done the trick.
>
> The question then is:
> How do I now capture iptables messages to their own log
> (/var/log/firewall)?
>
> I suppose I could grep for the log-prefix and redirect the output into
> /var/log/firewall, but if there's a simpler way, that'd be swell.
>
> Thanks!

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


