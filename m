From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 23:35:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407132335.18494.Antony@Soft-Solutions.co.uk>
References: <20040713222509.24799.qmail@web40709.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040713222509.24799.qmail@web40709.mail.yahoo.com>
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

On Tuesday 13 July 2004 11:25 pm, Real Cucumber wrote:

> Basically I've created a port forwarding firewall with
> two network interfaces, that's sole purpose is to
> forward incoming SSH packets on one interface (WAN)
> through the other interface (LAN) to a local SSH
> server.
>
> I've done this using IPtables and the mangle table.

Please explain how you have used the mangle table to achieve this.

The use of the mangle table is for a few fairly restricted and generally 
esoteric purposes, and I cannot see that your situation falls into these 
categories.

Regards,

Antony.

-- 
What makes you think I know what I'm talking about?
I just have more O'Reilly books than most people.

                                                     Please reply to the list;
                                                           please don't CC me.


