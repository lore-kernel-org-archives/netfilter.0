From: Devaraj Das <ddas@india.hp.com>
Subject: libipq
Date: Thu, 08 Apr 2004 14:02:45 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40750E2D.2E4DA20@india.hp.com>
References: <9723.1081409292@zworg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi all,
If I have an application (using libipq) that's waiting for packets, and I
want to inspect the payload, will the payload be encrypted in case I use
esp/transport with kernel 2.6 (with built-in ipsec)?
Thanks,
Devaraj.

__ Radien__ wrote:

> Dear All
>
>    I have read some about ISA server from it's documentation. There were
> listed some facilities for example Circuit Level and App Level
> filtering and gateway.
>
>    Circuit level filtering and gateway were strange for me. What are
> they?
>    How can I see such capabilities in iptables? How they get mapped in
> iptables?
>
>    Is iptables sth other than what ip_conntrack_ftp.o mudule do in
> Application Layer?
>
> Regards
> __Radien__


