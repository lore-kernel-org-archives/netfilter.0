From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Filter out broadcast messages
Date: Wed, 7 Jan 2004 22:05:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401072205.29859.Antony@Soft-Solutions.co.uk>
References: <BAY10-F77TIFprhMOgR0003cd8a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F77TIFprhMOgR0003cd8a@hotmail.com>
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

On Wednesday 07 January 2004 9:44 pm, Gabby James wrote:

> Hi,
>
> I would like to filter out all broadcast messages.  The packets could come
> from 255.255.255.255 or multiple other addresses of the form 10.*.*.255.
> What kind of syntax do I use to DROP these packets?  The line below will
> filter out packets from 255.255.255.255 but I'm not sure what syntax to use
> to DROP the other adresses.

Second idea:

If you mean what you say, and the other broadcasts fit the pattern 10.*.*.255, 
you could always use the little-known but perfectly valid netmaslk 
255.0.0.255 in a rule such as:

iptables -I INPUT -s 10.0.0.255/255.0.0.255 -j DROP

This will do exactly what you asked - match packets where the source IP's 
first byte=10 and the last byte=255, with the middle two bytes being 
anything, and drop them.

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


