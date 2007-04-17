From: Alan Chandler <alan@chandlerfamily.org.uk>
Subject: Re: Trying to understand a performance problem - help please.
Date: Tue, 17 Apr 2007 21:52:26 +0100
Message-ID: <200704172152.26312.alan@chandlerfamily.org.uk>
References: <200704151827.55457.alan@chandlerfamily.org.uk>
	<1176842690.3870.12.camel@murdegern.cbxnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1176842690.3870.12.camel@murdegern.cbxnet.de>
Content-Disposition: inline
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
To: Torsten Luettgert <t.luettgert@pressestimmen.de>
Cc: netfilter@lists.netfilter.org

On Tuesday 17 April 2007 21:44, Torsten Luettgert wrote:
> On Sun, 2007-04-15 at 18:27 +0100, Alan Chandler wrote:
> > a) Whether wireshark sees the packets before they are processed by
> > IPTABLES? (I want to see if there is a possibility that they reach
> > the machine but iptables drops them)
>
> Yup, wireshark and tcpdump see them before they hit iptables.
>
> Regards,
> Torsten

Thanks - I have been investigating further and it appears to be framing 
errors on the ethernet interface.

-- 
Alan Chandler
http://www.chandlerfamily.org.uk

