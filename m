From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: filtering asym. routing without "ip_conntrack: table full"?
Date: Wed, 29 Jan 2003 03:14:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030129031435.1677325c.arnt@c2i.net>
References: <20030114093711.GC9940@westend.com>
	<20030121061614.GA24090@kwaak.net>
	<20030121104505.GD603@mispa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030121104505.GD603@mispa>
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

On Tue, 21 Jan 2003 11:45:05 +0100, 
Jakub Jakacki <admin@md4.pl> wrote in message 
<20030121104505.GD603@mispa>:

> I have the same problem, and have found
> /proc/sys/net/ip_conntrack_max.
>  Is it contains the default max hashsize? May I only write:
> 
>  cat 16384 > /proc/sys/net/ip_conntract_max

..you meant 'echo "16384" > /proc/sys/net/ip_conntract_max' ?

>  to solve the problem of "full table"?


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



