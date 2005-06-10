From: CompuGenic <pablo@compugenic.com>
Subject: Re: ip_conntrack_ftp issues
Date: Thu, 09 Jun 2005 23:38:36 -0700
Message-ID: <BAY0-SMTP08C3BF299D10BD22A53542BCFF0@phx.gbl>
References: <Pine.LNX.4.53.0506092001190.29097@altaica>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <42A9356C.70701@compugenic.com>
In-Reply-To: <Pine.LNX.4.53.0506092001190.29097@altaica>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tib <tib@tigerknight.org>
Cc: netfilter@lists.netfilter.org

Tib wrote:

>I am trying to setup an ftp service on a non-standard port (42), and had
>initially encountered information that I may have to recompile the module
>entirely.
>
>Then I saw information saying that I could specify port arguments on the
>insmod command (ie. insmod ip_conntrack_ftp ports=xx,yy,zz).
>
>I'm on debian with iptables 1.2.11 installed - which of the above is true?
>I tried using the insmod command with arguments and got no errors in
>response, but the module didn't appear to work. Is it possible (if
>necessary) to recompile just the module or will I have to redo my whole
>kernel just for a single file or two?
>
><EOL>
>Tib
>
>
>
>  
>
Even though you're using port 42, you still need to specify port 21 for 
it to work correctly.
For example, "insmod ip_conntrack_ftp ports=21,42
Also, if you don't have at least kernel 2.6.11 , you'll also need to 
"insmod ip_nat_ftp ports=21,42" as well.

I hope that helps you out.

Pablo


