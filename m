From: Thierry ITTY <thierry.itty@besancon.org>
Subject: Re: bad interpreter
Date: Wed, 27 Nov 2002 14:12:58
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3.0.1.16.20021127141258.1af7ba26@s-net-04.besancon.org>
References: <20021127115344.59352.qmail@web9606.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021127115344.59352.qmail@web9606.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: at@4ix.net
Cc: netfilter@lists.netfilter.org

this happens when you get a script file from dos (with cr/lf eol)
the first line may look normal=20

#!/bin/sh

but the CR (which remains invisible within a text editor that silently
adapts itself) is misunderstood by shell=20

just edit the file using vi, then ":set ff=3Dunix" and ":wq". this will
remove the CRs

hth


A 11:53 27/11/2002 +0000, vous avez =E9crit :
>I am new to iptables. Starting up iptables I receive
>the error
>
>: bad interpreter: No such file or directory.
>
>I would be grateful for any ideas. Thanks in advance
>
>Taniform
>
>__________________________________________________
>Do You Yahoo!?
>Everything you'll ever need on one web page
>from News and Sport to Email and Music Charts
>http://uk.my.yahoo.com
>
>
>
			- * - * - * - * - * - * -
Bien s=FBr que je suis perfectionniste !
Mais ne pourrais-je pas l'=EAtre mieux ?
	Thierry ITTY
eMail : Thierry.Itty@Besancon.org		FRANCE

