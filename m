From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 21:22:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402192122.14756.Antony@Soft-Solutions.co.uk>
References: <40351bc0.48d2.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40351bc0.48d2.0@arbbs.net>
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
To: netfilter@lists.netfilter.org

On Thursday 19 February 2004 8:25 pm, John Black wrote:

> >I think you simply need to remove the "-d 161.x.x.x/21" from your rule and
> >
> >things will start working the way you want.
>
> just wanted to make sure this is right.
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0  -j SNAT --to
> 161.x.x.x

Yes, that's what I meant.

> <iptables -t nat -L -n> gives me
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> SNAT       all  --  192.168.0.0/24       0.0.0.0/0          to:161.x.x.x

A better command is "iptables -t nat -l -nv" because the v option also shows 
the interface names.

Regards,

Antony.

-- 
I'm pink, therefore I'm Spam.

                                                     Please reply to the list;
                                                           please don't CC me.


