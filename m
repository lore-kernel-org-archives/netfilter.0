From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: REDIRECT outgoing packets -- how?
Date: Tue, 10 Feb 2004 20:09:50 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040211040950.45687.qmail@web14004.mail.yahoo.com>
References: <164332529593.20040209125912@mail.ru>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <164332529593.20040209125912@mail.ru>
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
Content-Transfer-Encoding: 7bit
To: DD <9222653@mail.ru>, netfilter@lists.netfilter.org

--- "Dmitry L. Donskih" <donskih@delna.ru> wrote:
> Is there any other way to DNAT/REDIRECT outgoing
> packets to localhost?

  There is an option during compiling the kernel
IP_NF_NAT_LOCAL to enable NAT on locally generated
connections.
  Do let us know if you can manage with this.

=====
Regards,
Kiran Kumar Immidi

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html

