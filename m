From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Gateway preferance
Date: Wed, 7 Jan 2004 09:27:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401070927.22028.Antony@Soft-Solutions.co.uk>
References: <20040107075513.19937.qmail@web13124.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040107075513.19937.qmail@web13124.mail.yahoo.com>
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

On Wednesday 07 January 2004 7:55 am, nayan naya wrote:

> Hi list,
>
> I have two internet connections. i want to use only
> one specific connection for some resions. Supose that
> connection is stop then automaticaly second internet
> connection will be start. this is possible with
> iptables or not and if possible how?

This is not a netfilter question.   Netfilter filters packets which would 
otherwise be routed, it does not decide how to route them.

Check http://lartc.org for advanced routing control.

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


