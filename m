From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [OT] Was: ESP does not hit the nat table
Date: Sun, 1 Aug 2004 23:28:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408012328.16124.Antony@Soft-Solutions.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC9051218@asimail2.alphanumeric.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051218@asimail2.alphanumeric.com>
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

On Sunday 01 August 2004 8:03 pm, Jason Opperisano wrote:

> <OT>
>  Where is the new-found obsession with dropping packets in the NAT table
> coming from? </OT>

Indeed.   A few people here have commented recently that they prefer dropping 
stuff in the PREROUTING nat table instead of waiting until it hits INPUT or 
FORWARD, for things like spoofed packets or invalid TCP flag combinations.

I guess dropping things in nat is okay in exceptional circumstances, but I 
hardly think the efficiency boost of dropping in nat instead of waiting until 
the first filter table is reached makes any noticeable difference, and I 
still advocate doing address translation in the nat tables, filtering 
operations in the filter tables, and anything else in the mangle tables.

Just so long as you remember never to set a default policy other than ACCEPT 
on any nat or mangle tables.....

Regards,

Antony.

-- 
I own three Windows books, published by O'Reilly.   They are "Windows 
Annoyances", "Office 97 Annoyances" and "Windows 98 Annoyances".   That 
pretty much sums it up for me.

                                                     Please reply to the list;
                                                           please don't CC me.


