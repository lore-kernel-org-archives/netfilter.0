From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables -F & iptables -X good enough *for all* tables/chains?
Date: Mon, 24 Jun 2002 21:34:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624203459.IVAN2755.mta05-svc.ntlworld.com@there>
References: <20020624114108.A3305@spawar.navy.mil> <001b01c21baf$a4450a50$0a01a8c0@ed> <20020624125713.A3624@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020624125713.A3624@spawar.navy.mil>
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

On Monday 24 June 2002 8:57 pm, Christian Seberino wrote:

> Ed
>
> Thanks for the reply.  I can accept that -F is necessary
> *for every single table separately*.
>
> User defined chains are *not* tied to specific tables
> as far as I can tell.  Is there any value in doing
>
> iptables -t nat -X
> iptables -t mangle -X
> iptables -t filter -X
>
> rather than just iptables -X???

Depends what rules you've put into your user-define chains.

If you've only used "-t filter" rules, you only need to delete with -X, but 
if you've added some "-t nat" rules or "-t mangle" rules then you must use -X 
-t nat or -X -t mangle to delete them.

 

Antony.

