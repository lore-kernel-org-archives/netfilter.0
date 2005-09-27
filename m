From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Confirm: letting certain packages pass through un-natted
Date: Tue, 27 Sep 2005 11:15:51 +0200 (CEST)
Message-ID: <59094.193.173.147.3.1127812551.squirrel@webmail.sterenborg.info>
References: <4337A526.3@canada.com>
	<51347.193.173.147.3.1127721085.squirrel@193.173.147.3>
	<43388FB0.2060307@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43388FB0.2060307@canada.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tue, September 27, 2005 02:17, David Leangen wrote:
>> What do the byte counters for this rule say when you execute :
>> iptables -nvL PREROUTING
>
> Hmmm... weird...
> [root@sannomiya ~]# iptables -nvL PREROUTING
> iptables: Table does not exist (do you need to insmod?)

Not at all ; my mistake : I forgot to add "-t nat" in the rule.

> I tried that. Apparently, the packets get routed to 192.168.2.1 as
> expected, so they must be getting eaten up by my iptables... I'll
> take another look to try to figure out why.

Check out J=F6rg's reply.
If the setup in his reply represents yours, is it really necessary to
do NAT for 192.168.1.0/24 to reach 192.168.2.0/24 ?
I'd say you should be able to reach 192.168.2.0/24 using routing only
(when FORWARD policy is ACCEPT and doesn't do filtering and ip_forward
is set to "1").


Gr,
Rob



