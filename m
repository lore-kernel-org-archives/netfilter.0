From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Why would these rules cause errors only sometimes?
Date: Fri, 25 Oct 2002 08:47:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021025074735.GNQF459.mta02-svc.ntlworld.com@there>
References: <20021025025458.11685.qmail@web40709.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021025025458.11685.qmail@web40709.mail.yahoo.com>
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

On Friday 25 October 2002 3:54 am, Tasha Smith wrote:

> INET_IP=`ifconfig eth0 |grep "inet addr"|awk -F : '{ print $2 }'|cut -d \ 
> -f 1`;
>
> "That lines casues this error:"
>
> cut: the delimeter must be a single character
> Try `cut --help' for more information.

What character are you trying to use for a delimiter ?   Presumably space....

Try pputting single quotes around a space instead of predecing it with a 
backslash.

Antony.

-- 

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

