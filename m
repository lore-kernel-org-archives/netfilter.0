From: "Zander Subatomic" <zander@subatomic.org.uk>
Subject: Re: firewall script placement
Date: Sun, 19 Jan 2003 23:57:59 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <013f01c2c016$9831f6e0$0401a8c0@darthvader>
References: <00d601c2bfbb$4d85a930$0401a8c0@darthvader> <001001c2bff1$45db51e0$0a90a8c0@boris>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "Michael J. Tubby B.Sc. (Hons) G8TIC" <mike.tubby@thorcom.co.uk>, netfilter@lists.netfilter.org

> Zander,
>
> I use a homebrew iptables based firewall script on all my RH 7.2, 7.3
> and 8.0 machines which is based on Oskar's tutorial and good work
> as its much more flexible than the built-in systems...
>
> I call the script "rc.firewall" and keep it in /etc/rc.d as its a bit
non-standard
> like rc.local and then cd to /etc/rc.d/rc3.d and hack things a little by
> removing S07/08/09 ipchains/iptables stuff, and adding a symbolic
> link:
>
>     ln -s ../rc.firewall S11firewall
>
> so that the start up sequence ends up looking something like this:
>

<SNIP>

cheers for the advice, I have managed to cludge it and get boot-up firewall
script up and running, excellent! :o)

Z


