From: Tom Eastep <teastep@shorewall.net>
Subject: Re: help on DMZ project
Date: Thu, 13 Mar 2003 06:32:14 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <224590000.1047565934@wookie.shorewall.net>
References: <00ae01c2e941$3a133ac0$2200000a@nocpc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ae01c2e941$3a133ac0$2200000a@nocpc3>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org



--On Thursday, March 13, 2003 05:16:27 PM +0800 louie miranda 
<lmiranda@chikka.com> wrote:

>
> Could this be done? And which documents should i read? I currently have a
> different network that i am masquerading right now. But i had never tried
> a dmz type that is so complicated yet for me.
>
> Hope i could have feedback on my problem!
>

You might take a look at Shorewall (http://www.shorewall.net) -- it makes 
setting up these types of configurations much easier than it would be by 
hand. Start with http://www.shorewall.net/shorewall_setup_guide.htm to get 
an idea of your options. While that document describes just a 
three-interface firewall with DMZ, extending it to include more networks is 
straightforward.

-Tom
--
Tom Eastep   \ Shorewall - iptables made easy
Shoreline,    \ http://www.shorewall.net
Washington USA \ teastep@shorewall.net


