From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Is there way to bypass conntrack?
Date: Fri, 5 Sep 2003 01:52:25 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030904175225.GA2269@propaganda.localdomain>
References: <3F56291A.90003@tigry.net>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F56291A.90003@tigry.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Sep 03, 2003 at 10:47:06AM -0700, Andrey Tverdokhleb spoke thusly:

>I'd really like to have some way to bypass ip_conntrack for some 
>packets. Basically I need to run very intensive port scanning through my 
>firewall and as soon as ip_conntrack loaded it dies within seconds from 
>syn flood. Increase limit doesnt work becuase I need about  127000 
>packets to be sent from different source ports. So far I just keep 
>contrack unloaded and firewall works fine as pure stateless filter. But 
>now I need statefull inspection on this machine for some IPs. So the 
>question - is it possible to avoid connection tracking for some specific 
>IPs?

I think there is a NOTRACK patch somewhere (p-o-m / archives) ? Try looking
for it, from memory I think that is what you need.

