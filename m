From: Jason Opperisano <opie@817west.com>
Subject: Re: Port 25
Date: Sun, 06 Feb 2005 15:04:38 -0500
Message-ID: <1107720278.4679.40.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.58.0502061446150.1174@linux>
	<1107718151.4679.28.camel@hubcap.ljm.dom>
	<Pine.LNX.4.58.0502061551540.1318@linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0502061551540.1318@linux>
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

On Sun, 2005-02-06 at 14:54, Ted Gervais wrote:
> On Sun, 6 Feb 2005, Jason Opperisano wrote:
> 
> 
> > On Sun, 2005-02-06 at 13:51, Ted Gervais wrote:
> > > I have a problem getting mail packets to go out with my present firewall
> > > setup.
> >
> > is the mail server on a machine behind the firewall, or running on the
> > firewall itself?
> 
> On the firewall.

k--here's the basic idea:

  # allow established packets in
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  
  # allow mail in
  iptables -A INPUT -p tcp --syn --dport 25 -j ACCEPT

  # allow established packets out
  iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

  # allow mail out
  iptables -A OUTPUT -p tcp --syn --dport 25 -j ACCEPT

  # allow dns lookups out
  iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

-j

--
"Well, I'm not calling you a liar, but... I can't think of a way to
 finish that sentence."
	--The Simpsons


