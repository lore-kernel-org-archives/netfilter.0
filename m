From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: continuity of nat after nat rules deleted
Date: Tue, 13 Apr 2004 15:09:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404131509.26056.Antony@Soft-Solutions.co.uk>
References: <00d001c4215e$de0ec990$68892090@grouse>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d001c4215e$de0ec990$68892090@grouse>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Tuesday 13 April 2004 2:54 pm, Jee J.Z. wrote:

> Hi all,
>
> I just found an interesting issue and wish to have your confirmation:
>
> My network setup is like the following:
>
> PC1 and the Internet<---->PC2<---->PC3
>
> PC2 is doing nat for PC3 and is transparant to PC3. I start transmitting a
> large file using ftp from PC1 to PC3 via PC2. During the transmission, I
> disable all the nat rules on PC2 (iptables -F & iptables -F -t nat), but
> PC2 goes on doing nat until finishing transmitting the whole file. Only
> after that the connectivity between PC1 and PC3 breaks.
>
> Could anyone tell me the reason for this phenomenon?

Connection tracking.

If you look at the packet counts in your nat rules, you will only see the 
first packets of each connection - all the rest get handled in the background 
by the nat-helper for ftp, and your rules don't see them.

Therefore, once the first packet of a connection has gone past, you only need 
the nat-helper to keep the connection going; you don't need any nat rules any 
more.

Regards,

Antony.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


