From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SRC and DST
Date: Sat, 31 Jul 2004 09:42:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407310942.12314.Antony@Soft-Solutions.co.uk>
References: <20040731082629.8558.qmail@web25208.mail.ukl.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040731082629.8558.qmail@web25208.mail.ukl.yahoo.com>
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

On Saturday 31 July 2004 9:26 am, dee3lmo wrote:

> Hi Antony,
>
> Thanks for your quick reply. I don't get the first part. You say:
>
> "Similarly the reply packet comes back from the web server: source address
> = remote web server; destination address = your computer; neither of these
> = firewall."
>
> The destination address isn't my. None of the addresses is an address of my
> firewall.

Exactly.   I was simply trying to point out that a firewall which is routing 
packets between one place and another will see lots of packets where neither 
the source nor the destination address belongs to the firewall itself.

Nearly all the packets going through routers (which is what a firewall is) are 
going to, and coming from, somewhere else, therefore the source and 
destination are not the routers IP addresses.

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


