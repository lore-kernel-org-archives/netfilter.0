From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: pop3 and dns
Date: Tue, 4 May 2004 11:09:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405041109.46300.Antony@Soft-Solutions.co.uk>
References: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
Reply-To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>

On Tuesday 04 May 2004 10:40 am, Fritz Mesedilla wrote:

> Greetings!
> I have been looking for the answer to this through google...
>
> How do I allow POP3 through my iptables rules?
>
> I have done this...
> $IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT
>
> $IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT

These look fine as they are, however you will need a rule to allow the reply 
packets, and perhaps one to SNAT your Internet-bound packets if you are using 
private addresses on your network.

> The problems:
> 1) They still can't resolve domain names.
> 2) POP3 can't seem to pass through going outside from the internal clients.

Questions:
1. Can clients access anything by IP address rather than hostname?
2. Do any other services work, such as web browsing (assuming you have rules 
to allow other servies)?

Suggestions:
1. Describe your network setup to us.
2. Show us all your netfilter rules.

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


