From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: route outgoing smtp via a specific interface
Date: Mon, 3 May 2004 00:05:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405030005.33281.Antony@Soft-Solutions.co.uk>
References: <16533.31553.47397.464571@jane.localdomain>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16533.31553.47397.464571@jane.localdomain>
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

On Sunday 02 May 2004 11:50 pm, Christer Ekholm wrote:

> I have two IP-providers. And the faster one of them blocks smtp. I
> have been trying to route smtp to the slower while still routing
> everything else to the faster, without success. Is it possible at all?

IProute2, http://lartc.org

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


