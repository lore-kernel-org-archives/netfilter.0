From: alexb@atix.com.br
Subject: Re: Who is connected to network
Date: Wed,  5 Jan 2005 20:09:52 -0200
Message-ID: <1104962992.41dc65b0c4a62@webmail.atix.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Michael!

I'm interest to know how to make a VPN from the AP to each client.
How do you implement to do:
"We do not allow any type of access from the AP's without a VPN session
established"
Is this down at the gatway between the APs and the Internet ?
Something I can do with iptables ?

Thanks,

Alex

-----Mensagem original-----
De: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] Em nome de Michael Balasko
Enviada em: quarta-feira, 5 de janeiro de 2005 14:39
Para: it clown; netfilter@lists.netfilter.org
Assunto: Re: Who is connected to network

Currently we have coded something in house that scrubs all the
connectivity devices for the mac addresses and will email us when an
unauthorized device shows up on the network (All Cisco gear). There is
work in progress to expand this to automatically clip the port and fire
off a series of emails and other actions.  Additionally, all of the
ports on the switches are configured to allow only one device into a
port, so it would be very difficult to drop a hub in place and start
sniffing. There are also a few other tricks in place to prevent man in
the middle attacks and a few other exploits.

As far as the wireless stuff goes, it would be amazingly difficult but
not impossible to get it right. Our AP's will not allow authentication
without the client mac being pounded into our ACS servers.(MAC spoofing
isn't all that hard, but) Also the AP's don't broadcast the
SSID's(fairly easy to get around). In the case that someone gets the
first two right, they need to then figure out the name of the VPN
servers. We do not allow any type of access from the AP's without a VPN
session established. Then they need to get the VPN settings right and
also need to have a user account comprised that had VPN access. Not
impossible, but quite difficult for someone to do without making any
"noise" that we would be alerted on.  At that point the access lists on
the AP's keep you from really touching any of the gear that would hurt us=
.

All that being said there are million of exploits out there and lots of
tools, but we feel that we have a fairly good system in place to deter
all but the very skilled and very determined person out there.

Hope that provides a bit of info you were looking for. Feel free to ask
any ?'s if you have any.

Mike Balasko
Network Specialist II
City of Henderson

it clown wrote:

>Is there a way to see who is connected to your network.
>
>Say if you have a wireless network and you need to know if
>someone got it right to get onto your network.
>
>How do you monitor that and how do you prevent it?
>
>Even on a normal network how could you monitor who is
>connected to your network?
>
>Regards
>_____________________________________________________________________
>For super low premiums, click here http://www.dialdirect.co.za/quote
>
>
>


-----------------------------------------------------------------
Esta mensagem foi enviada pelo IMP, o Internet Messaging Program.

