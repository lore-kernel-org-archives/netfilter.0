From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Iptables
Date: Wed, 28 Jan 2004 08:25:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4017B844.8090901@Loudoun-Fairfax.com>
References: <Sea2-F29KdVVDMCcltD00014e88@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea2-F29KdVVDMCcltD00014e88@hotmail.com>
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
To: netfilter@lists.netfilter.org

jean-francois fleury wrote:

>
> Im new with Iptables but iv been working on it since the last month to 
> built up rule set.
> I have a linux box with 3 int
>
> Eth0 = $EXT (connected to ppp0, ADSL provider)
>
> Eth1 = $DMZ (only a web server for now)
> Eth2 = $INT (my main computer(net surf) and one for IDS, 
> tcpdumb,backup, etc)
>
> Basicly, i know im not the only one with this kind of setup, im sure 
> ;) . First i want
> to access my web server from the $INT to $DMZ to manage it, i want to 
> access
> internet $INT to $EXT (it can be $PPP0) and few other thing such as 
> SSH from
> inside and outside, give full access inside ($INT and in my $DMZ) to my
> IDS. and like everyone else, good rules. What i would like its a setup 
> rules
> already made for this kind of network, that work but i can personolize 
> it. Is
> there someone with this kind of rules so i can start with something ?
>

Take a look here:  http://iptables-tutorial.frozentux.net/

This is an excellent tutorial and has several examples including one 
similar to your configuration.

> If you want my actual rules i can send it. Thanks
>
> PS : sorry for my english but i write basicly in french.
>

Your English is better than my French :-)

Jeff


