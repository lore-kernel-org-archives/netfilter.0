From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 13:19:48 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0c3201c44f06$c01c6160$49caa8c0@caris.priv>
References: <7EACCDBB65D37443912D80713CC1245D47282C@fsnsab20.losangeles.af.mil> <200406101700.57718.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

That was exactly my problem Anthony.  Thank you for re-iterating it for me.
I was not sure if I was very clear after some of the responses.

Peter

Wireless will become the rue of my networking existence.


----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Thursday, June 10, 2004 1:00 PM
Subject: Re: wireless security


On Thursday 10 June 2004 4:43 pm, Hudson Delbert J Contr 61 CS/SCBN wrote:

> alexksandar,
>
> i concur with your assessment as to not allowing such
> folly.
>
> sometimes corporate mandates require security policy to bend
> to bottom-line needs.
>
> a couple of suggestions though if you just gotta do it.
>
> determine what protocols you want to use as this speaks to distance
> and calculation of telemetry stand off distances.

Sorry - could you rephrase that please?   I'm sure I don't understand it,
because it seems to say that the protocol you are using influences how far
the 802.11 signal can be sent / received - and I'm sure you can't possibly
mean that!

> 802.11x goes x where x = y ft w/out causing or receving unfiltered
> interference.

Remember that if a remote attacker (for want of a better term) uses a
directional or high-gain antenna, they will be able to connect to your
network from much further away than you would usually expect.   Parabolic
dishes not only allow sniffing from long distances, but also allow sending
of
signals from great distances away from your premises.

> the perimeter should use a belt and suspenders topology

 :)   Please remember that this is an international mailing list, and
phrases
like that mean different things in English and American, for example :)

> to prevent
> common-mode failures. example....lotsa wintel boxes as clients
> suggest
> asic (da best) boxes or unix based firewalls to challenge an
> attackers

The problem Peter has, however, is that there is no single firewall between
the wireless people he's trying to keep out, and the wired network he's
trying to protect.   The vulnerability lies in client machines which may
(inadvertently, deliberately, or unknowingly) be connected to both wired and
wireless networks simultaneously.

> platform knowledge base. solaris or hpux box running checkpoint and
> some cisco
> mixed in as chokes would do nicely.

If there was a single choke point available, I would agree.   Unfortunately
in
this case there isn't - hence the difficulty.

Regards,

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the
list;
                                                           please don't CC
me.



