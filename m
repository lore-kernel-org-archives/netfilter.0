From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: Re: something stupid
Date: Thu, 06 Oct 2005 13:18:53 -0500
Message-ID: <1128622733.11829.12.camel@tholian.starken.com>
References: <1128493268.31931.9.camel@tholian.starken.com>
	<Pine.LNX.4.61.0510061903060.31577@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510061903060.31577@filer.marasystems.com>
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

yeah, I do realize they are on the same interface, just wanted to make
sure it was understood what I have.  The very first rule right now in my
script:

iptables -t filter -A INPUT -i eth1 -p tcp -d 1.1.1.188 --dport 25 -j
LOG --log-prefix " SMTP_HERE " --log-level notice

eth1    has IP of 1.1.1.189
eth1:0  has IP of 1.1.1.188

But it never does log anything, though ethereal shows the traffic coming
in on that interface.  Any other way to track these packets?

Dan

On Thu, 2005-10-06 at 19:03 +0200, Henrik Nordstrom wrote:
> On Wed, 5 Oct 2005, Daniel Wittenberg wrote:
> 
> > I think it's late and I've got to be missing something here.  I have 2
> > interfaces to different ISP's.  The second interface, eth1, responds
> > just fine on the primary IP ".189".  I have an alias interface .188 that
> > when I apply an iptables rule to, gets no traffic at all.
> 
> alias interface? IP aliases all belong to the same interface (eth1), even 
> if you give them a label.
> 
> What does your rules look like?
> 
> Regards
> Henrik
> 

