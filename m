From: Jason Opperisano <opie@817west.com>
Subject: Re: Redirecting traffic to my ftp site?
Date: Mon, 9 May 2005 14:27:16 -0400
Message-ID: <20050509182716.GA6029@bender.817west.com>
References: <200505092013.56681.chadley@pinteq.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200505092013.56681.chadley@pinteq.co.za>
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

On Mon, May 09, 2005 at 08:13:56PM +0200, Chadley Wilson wrote:
> Greetings
> 
> My firewall / router has two interfaces.
> bond0 == internal
> eth0 == external
> 
> I have an ftp server setup on the same box. If anyone on the internal network 
> tries to access http 80 or ftp 20:21 I would like to route them regardless of 
> the url entered to my ftp site.
>  
> :} "evil I know"

um--it's called "transparent proxying" and i wouldn't refer to it as
"evil."  that being said--the daemon listening on port 80/21 needs to
support transparent proxying (like squid), otherwise it's well..."evil"
wouldn't be *my* choice of words.

> iptables -t nat -A PREROUTING -i bond0 -p tcp --dport 80 -j DNAT \
> --to-dest 192.168.0.1 (ftp??)

  iptables -t nat -A PREROUTING -i bond0 -p tcp --dport 80 \
    -j REDIRECT --to-ports $PROXY_PORT

  iptables -A INPUT -i bond0 -p tcp --dport $PROXY_PORT -j ACCEPT

you'd also need rules to allow the firewall itself to go fetch the
content for the end user.

-j

--
"Stewie: Hidden missile behind the Great Wall? Ancient Chinese
 secret, huh?"
        --Family Guy

