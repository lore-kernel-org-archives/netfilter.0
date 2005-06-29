From: "Gustavo Castro Puig" <gcastro@gcp.com.uy>
Subject: Re: MAC filtering
Date: Wed, 29 Jun 2005 12:58:07 -0300 (UYT)
Message-ID: <36457.200.125.10.62.1120060687.squirrel@webmail.gcp.com.uy>
References: <3f96f433f945f0.3f945f03f96f43@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3f96f433f945f0.3f945f03f96f43@vsnl.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Varun:

  I suggest you to check a project called "ebtables". May be of interest
to you: http://ebtables.sourceforge.net/
  Anyway, I think you can do this to disable all other MAC addresses:

  iptables -A FORWARD -m mac --mac-source ff:ff:ff:ff:ff:ff -j ACCEPT
  iptables -A FORWARD -m mac --mac-source ! ff:ff:ff:ff:ff:ff -j DROP

  But if you want to allow more MAC, then you may need to write a custom
chain and pass all that MAC into it.
  I hope this help you.

> Hello,
>       To allow a particular MAC, I plan use the rule
> as sugested in my previous post :
>
> iptables -A FORWARD -m mac --mac-source ff:ff:ff:ff:ff:ff -j ACCEPT.
>
> Now how do you block all other MAC addresses in the first place.
> How to write a rule for that ?
>
> Thanks
>
> Varun
>
>
>

Saludos,
     Gustavo Castro Puig.
     E-Mail: gcastro@gcp.com.uy

LPI Level-1 Certified (https://www.lpi.org/es/verify.html
LPID:LPI000042304 Verification Code: hp6re8w5qg )
-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCS/CM/IT/ED dx s-:- a? C(+++)$ UL++++*$ P+ L++++(++)$ E--- W+++$ N+ o?
K- w O M V-- PS PE++(-) Y-(+) PGP+ t(++) 5+ X++ R tv+ b++(++++) DI+++
D++ G++ e++ h--- r y+++
------END GEEK CODE BLOCK------
Registered Linux User #69342


