From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: block an ip
Date: Sat, 14 Sep 2002 09:59:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020914085958.ZYDV13709.mta07-svc.ntlworld.com@there>
References: <34638.10.0.0.10.1031971141.squirrel@aydin.no-ip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34638.10.0.0.10.1031971141.squirrel@aydin.no-ip.org>
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

On Saturday 14 September 2002 3:39 am, yuksel@aydin.no-ip.org wrote:

> Hello,
>
> I'm a novice. I understand how to block acces to some ports but I didn't
> understand how to block an ip.

iptables -A FORWARD -s 11.22.33.44 -j DROP

Antony.
-- 

This is not a rehearsal.
This is Real Life.

