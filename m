From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: IP Alias replacement
Date: Tue, 26 Aug 2003 15:46:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826194634.GA30150@cannon.eng.us.uu.net>
References: <3F4BB33F.8030106@bus.okstate.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F4BB33F.8030106@bus.okstate.edu>
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
To: Jason Joines <joines@bus.okstate.edu>
Cc: netfilter@lists.netfilter.org

On Tue, Aug 26, 2003 at 02:21:35PM -0500, Jason Joines wrote:

>  I was reading the IP Alias Mini-HOWTO at http://tldp.org.  It said, 
> "IP Alias has been deprecated in 2.4.x and replaced by a more powerful 
> firewalling mechanism."  What is this mechanism?

I don't know what he means by "more powerful _firewalling_ mechanism" but
iproute2 package which replaces the whole family of ifconfig/arp/route
commands, gives you a neat and more straight forward way of dealing with
the IP aliasing.

Ramin

> 
> Thanks,
> 
> Jason Joines
> Open Source = Open Mind
> ========================
> 

