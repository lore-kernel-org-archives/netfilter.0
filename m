From: "riffraff" <riffraff@mail.ev1.net>
Subject: Re: foward ing specific ports
Date: Fri, 28 Jun 2002 16:08:13 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206281608.AA87687286@mail.ev1.net>
Reply-To: <riffraff@mail.ev1.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org, Anthony Cesar <Anthony.Cesar@abcdistributing.com>

---------- Original Message ----------------------------------
From: "Anthony Cesar" <Anthony.Cesar@abcdistributing.com>
Date: Fri, 28 Jun 2002 16:55:54 -0400

>is it possible to tell iptables to allow forwarding of specific ports
>that are staggered, in one entry?  for example, i know that you can do a
>range of ports ( --sport 1024:65535) but what if i have only three ports
>like 25,110, and 53?
>
>does the syntax allow for me to list these ports in just one chain
>(hypothetical: --sport 25-53-110)?
>
example:

iptables -A FORWARD -p tcp -m multiport -d 1.2.3.4 --dport 50,51,71,8101 -j ACCEPT

yes, you can, with the -m multiport --dport x,y,z options


>or do i have to generate a chain for each one?  it would help my typing
>fingers a lot if what i'm asking was possible....
>
> 
>
>--Anthony C--
>

