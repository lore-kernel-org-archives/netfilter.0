From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 23:18:58 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705221900.HPWC23840.mta03-svc.ntlworld.com@there>
References: <NJEFLNJDIFFNMHDEBKMJAEKADOAA.jpatterson@asgardgroup.com> <20020705201118.DFBE4626.mta02-svc.ntlworld.com@there> <024901c22432$8885a5a0$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <024901c22432$8885a5a0$8703000a@aid.inf.cu>
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

On Friday 05 July 2002 3:44 pm, david wrote:

> When I write these rules in the command line all is OK and  the rules works
> fine.
> But if I put the same rules in a script :
>
> #!/bin/bash
> # Standard default policies
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
>
> I got these errors
>
> iptables :Bad police name
> iptables :Bad police name
> iptables :Bad police name

What name did you call the script ?

Where did you put the script ?

How did you run the script ?

Does the same thing happen if you change all occurences of 'iptables' inside 
the script for '/sbin/iptables' instead ?

 

Antony.

