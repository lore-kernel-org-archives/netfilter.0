From: "Mohammad Norouzi" <mnrz57@gmail.com>
Subject: Re: REJECT doesnt work
Date: Tue, 19 Jun 2007 13:51:02 +0330
Message-ID: <34b8543c0706190321w4fcd43e7yfa6a4a1308def5f9@mail.gmail.com>
References: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com>
	<01c501c7b236$54be1530$0b0ffe0a@NS006819>
	<34b8543c0706190127h41d80c97yec8606b03f72a7f1@mail.gmail.com>
	<003001c7b256$dd268810$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=cP9WJz1npk/lowIMubKma7HrUFhDbvcF+153irPEmQNjZp5bM2XxZZ2MAV/To3N3Rx8qUl6EsbzgQXyvY2ECpQ+n5l74imAsRXO8JvhzB1rArNKK4/+lk6HAaA+x8KlCO6MbrAjErT+iWyecgLmSLKvAhji6RJ/oQvsy9Gh80XM=
In-Reply-To: <003001c7b256$dd268810$0b0ffe0a@NS006819>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>> Please reply to the list.

Sorry Rob, I didnt know that clicking on "reply" will reply to your
email address directly

>> Well, this rule generates no error for me. Doesn't it for you?

no for me it returns error
here is my iptables config file

*nat
:PREROUTING ACCEPT [831:64633]
:POSTROUTING ACCEPT [20:1927]
:OUTPUT ACCEPT [11:1333]

-A POSTROUTING -s 192.168.0.157 -o eth1 -j MASQUERADE
-A INPUT -s 192.168.0.157 -m mac --mac-source ! 00:11:2F:29:96:84 -j REJECT
COMMIT

I dont know what is wrong with it !!! I want define a rule if the IP
192.168.0.157 is cloned then reject its packets. but when restarting
the iptables it will fail

I've seen another configuration in internet and I think it will
fulfill my needs but I dont understand it, would you take a look at
this and tell me what it means:
-----------------------
*filter
:FORWARD DROP [0:0]
:INPUT DROP [0:0]
:OUTPUT ACCEPT [0:0]
:mac - [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A FORWARD -j mac
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth1 -m state --state NEW -j ACCEPT
-A mac -i eth1 -s 1.2.3.4 -m mac --mac-source 00:01:02:03:04:05 -j RETURN
-A mac -i eth1 -s 1.2.4.8 -m mac --mac-source 00:01:04:04:08:10 -j RETURN
-A mac -i eth0 -m mac --mac-source 00:0a:bc:dc:ba:98 -j RETURN
-A mac -j LOG --log-prefix "Invalid MAC "
-A mac -j DROP
COMMIT
----------------------

I dont understand what RETURN means??




On 6/19/07, Rob Sterenborg <rob@sterenborg.info> wrote:
> Please reply to the list.
>
> Mohammad Norouzi wrote:
> > Thanks Rob
> > so please tell me how to use it to filter INPUT or FORWARD?
> > I mean is it possible to filter any packet that are not coming from
> > the specific mac address? I want to prevent any IP cloning to access
> > the internet
> > -A INPUT -s 192.168.0.157 -m mac --mac-source ! 00:11:2F:29:96:84 \
> >   -j REJECT
>
> Well, this rule generates no error for me. Doesn't it for you?
>
> I think you're working the other way around. If you have a DROP policy
> and ACCEPT a match on IP and MAC I think you should be set.
> Alternatively, you can add a *last* rule that REJECT's everything that
> didn't match anything.
>
> -P INPUT DROP
> [...]
> -A INPUT -s 192.168.0.157 -m mac --mac-source 00:11:2F:29:96:84 \
>   -j ACCEPT
>
> or
>
> -A INPUT -s 192.168.0.157 -m mac --mac-source 00:11:2F:29:96:84 \
>   -j ACCEPT
> [...]
> -A INPUT REJECT [--reject-with ...]
>
>
> Grts,
> Rob
>
> > On 6/19/07, Rob Sterenborg <rob@sterenborg.info> wrote:
> >>> Hi All
> >>> I have following line to drop any request that is not from the
> >>> original computer and it works fine
> >>> -A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
> >>> 00:11:2F:29:96:84  -j DROP
> >>>
> >>> but now I want to change it to REJECT but it doesnt work and
> >>> iptables will fail
> >>>
> >>> -A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
> >>> 00:11:2F:29:96:84  -j REJECT --reject-with=icmp-host-pro hibited
> >>>
> >>> what is the problem?
> >>
> >> # man iptables
> >>
> >> REJECT
> >> [...]
> >> This target is only valid in the INPUT, FORWARD and OUTPUT chains,
> >> and user-defined chains which are only called from those chains.
> >> [...]
> >>
> >> The PREROUTING chain doesn't fit into this category thus REJECT
> >> cannot be used.
> >>
> >>
> >> Grts,
> >> Rob
>
>
>
> --
> Disclaimer: Any errors in spelling, tact, or fact are transmission
> errors.
>
>
>


-- 
Regards,
Mohammad
--------------------------
see my blog: http://brainable.blogspot.com/
another in Persian: http://fekre-motefavet.blogspot.com/

