From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: ssh rule
Date: Fri, 13 Jan 2006 12:07:01 +0100 (CET)
Message-ID: <64313.193.173.147.3.1137150421.squirrel@webmail.sterenborg.info>
References: <20060113101651.88870.qmail@web33404.mail.mud.yahoo.com>
	<uiz3bjsfmm2.fsf@false.linpro.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <uiz3bjsfmm2.fsf@false.linpro.no>
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

On Fri, January 13, 2006 11:28, Bj=F8rn wrote:
> Britto <britto_antony@yahoo.com> writes:
>
>> Hi Bjorn,
>
> Stop top posting. Keep replies on-list.
>
>> What rule should i add in the OUTPUT chain?
>
> What about the below advice was so hard to grasp?

I guess the
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
part.

Or just (re)set the OUTPUT policy to ACCEPT. If you don't know how to
deal with it, it just get's in your way.

I would say : read Oskars manual :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob

>> > Hint: Check out the ESTABLISHED and RELATED states.
>> > When you
>> > understand what they do, use them in your output
>> > rules.



