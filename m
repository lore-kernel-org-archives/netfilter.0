From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bad Argument error
Date: Mon, 8 Jul 2002 21:17:38 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708201740.QTUR2755.mta05-svc.ntlworld.com@there>
References: <956DDDA708487D498B43C36EA4DEA4050B5C4C@SFEXCH01>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <956DDDA708487D498B43C36EA4DEA4050B5C4C@SFEXCH01>
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
To: netfilter <netfilter@lists.samba.org>

On Monday 08 July 2002 9:00 pm, Mike G. Hammonds wrote:

> I'm running RH7.2 with iptables1.2.4-2
> every time I start iptables I get the following error
> Bad Argument 'LOG_LEVEL="notice" [FAILED]
>
> any ideas on how to fix this?

Use a numeric argument to --log-level instead

"notice"=5

So you would use

iptables -A FORWARD -s 192.168.1.0/24 -j LOG --log-level=5

or whatever....

 

Antony.

