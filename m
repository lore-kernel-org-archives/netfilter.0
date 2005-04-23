From: Jason Opperisano <opie@817west.com>
Subject: Re: blocking all trafic exapt selcter ports
Date: Sat, 23 Apr 2005 10:54:44 -0400
Message-ID: <20050423145444.GA8083@bender.817west.com>
References: <a3f524e05042301477b3598d3@mail.gmail.com>
	<426A13FB.2030507@crazeecanuck.homelinux.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <426A13FB.2030507@crazeecanuck.homelinux.net>
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

On Sat, Apr 23, 2005 at 05:23:07AM -0400, Ed wrote:
> Kashif Ali Bukhari wrote:
> > i want to block all inbod access to my linux box and want to allow
> > dns, http proxy,ssh,telnet,and ftp 
> > how can i do this 
> 
> First, please see
> http://www.catb.org/~esr/faqs/smart-questions.html

i love that link.

> iptables -A INPUT -p tcp --dport  21 -j ACCEPT
> iptables -A INPUT -p tcp --dport  22 -j ACCEPT
> iptables -A INPUT -p tcp --dport  23 -j ACCEPT
> iptables -A INPUT -p tcp --dport  53 -j ACCEPT

and:
  iptables -A INPUT -p udp --dport 53 -j ACCEPT

> iptables -A INPUT -p tcp --dport  3128 -j ACCEPT
> iptables -P INPUT DROP
> 
> or if you compile your kernel/iptables with multiport support
> 
> iptables -A INPUT -m multiport -p tcp --dports 21-23,53,3128 -j ACCEPT

multiport doesn't support ranges, mport does (and it uses a ':' not a
'-'):

  iptables -A INPUT -p tcp -m mport --dports 21:23,53,3128 -j ACCEPT
  iptables -A INPUT -p udp --dport 53 -j ACCEPT

> iptables -P INPUT DROP
> 
> A classic RTFM/STFW case, nonetheless...

yes.  couldn't resist the nit-pick, though.  ;-)

-j

--
"Joe Swanson: You can't just come over here and annex my pool!
 Peter: Oh yeah? Well, according to paragraph 7, sentence 3, word 8 of
 the Geneva Convention..."the". So, tough luck, Swanson."
        --Family Guy

