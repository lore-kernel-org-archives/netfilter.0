From: Erdal Mutlu <emutlu@fonts.de>
Subject: Re: more than 1 source ip
Date: Tue, 26 Nov 2002 11:53:11 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211261151460.5751-100000@bhows40003.fonts.de>
References: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wasim Bashir <wasim.bashir@nexor.co.uk>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 26 Nov 2002, Wasim Bashir wrote:

> Hi,
>
> how do i select more than 1 source IP, what i want to do is allow vnc access
> to an internal win2k box from 2 different ip addresses, how do you do this,
> at the moment i'm using :
>
> /sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP> -d <ip of my
> machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800
>
> Any help would be much appreciated.
>
> Thanks
>
> Wasim
>
>
>
>

Hi,

just add one more rule as above.

Like this:

/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP 1> -d <ip of my
 machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800
/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP 2> -d <ip of my
 machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800

Erdal Mutlu




