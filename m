From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 21:11:16 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705201118.DFBE4626.mta02-svc.ntlworld.com@there>
References: <NJEFLNJDIFFNMHDEBKMJAEKADOAA.jpatterson@asgardgroup.com> <20020705191417.UWDG4119.mta06-svc.ntlworld.com@there> <020c01c2242b$8c9565b0$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <020c01c2242b$8c9565b0$8703000a@aid.inf.cu>
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

On Friday 05 July 2002 2:54 pm, david wrote:

> Yes Antony ,but I do not know what to do with these rules

Simple.   Put them in a script, on their own, and run it.   See if it does 
what you want.

> .I put these in the
> /etc/rc.d/init.d/iptables script , in  the start section of the script and
> then what i do is :
>
> service iptables save
> /etc/rc.d/init.d/iptables restart

I cannot comment on this because I don't do that on my system.   Why do you 
do that on yours ?

> and I got all those errors message.
>
> Maybe I am doing something wrong with putting these rules in the script.

Is there something else in the script which could be causing the problems ?

 

Antony.

