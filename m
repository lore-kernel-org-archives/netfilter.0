From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 00:38:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707233858.OZRQ19225.mta07-svc.ntlworld.com@there>
References: <006d01c2260e$aec0be20$0a01a8c0@ed>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <006d01c2260e$aec0be20$0a01a8c0@ed>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 08 July 2002 12:33 am, Ed Street wrote:

> Hello,
>
> I've taken the hosts.deny file a bit further and wrote a hosts.trashcan
> and a hosts.dnat.
>
> The hosts.trashcan uses the time patch, it will reject any ip/netmask
> from start_time to end_time on days.
>
> The hosts.dnat file will setup a dnat rule, it's format is
> Sport	ip	dport	protocol

Can you give some more details on how these work please ?

 

Antony.

