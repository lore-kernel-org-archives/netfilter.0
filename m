From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Dynamic DNS
Date: Wed, 9 Mar 2005 10:04:00 +0200
Message-ID: <fad9d48405030900048e01e6a@mail.gmail.com>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<422E97C3.7040009@eccotours.dyndns.org>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <422E97C3.7040009@eccotours.dyndns.org>
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
To: Brent Clark <bclark@eccotours.dyndns.org>
Cc: netfilter@lists.netfilter.org

On Wed, 09 Mar 2005 08:29:23 +0200, Brent Clark
<bclark@eccotours.dyndns.org> wrote:
> Sebastian Docktor wrote:
> > Hi,
> >
> > I want to allow a Dynamic DNS Client to Access the SSH-Server
> > on my Firewall. But I don't want to open SSH for all IPs,
> > Is it possible that iptables always looks up the ip address from the
> > hostname, so that only the ip has access which is registrated under
> > the dyndns?
> >
> >
> 
> Hi
> 
> This may be a ridiculous suggestion.
> 
> How about basing it on MAC address.
> 
> Stupid I know.
> 
> Buts all I could think off.
> 
> Brent Clark
> 
> 

I'm not too sure either, but I do know that iptables resolve the names
the moment the rule is added, not again. Unless you run the rule every
minute to make sure it's updated constantly.

Can't you setup SSHD to only allow connections from certain hosts?
Then again sshd might use the reverse lookup of the ip, which isn't
always the dyndns name...

Will you let us know how you achieve this?


-- 

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

