From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Question about -m string module
Date: Fri, 4 Feb 2005 10:58:29 -0500 (EST)
Message-ID: <60578.142.169.215.10.1107532709.squirrel@142.169.215.10>
References: <18ba01c50acd$8d4af340$b000a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <18ba01c50acd$8d4af340$b000a8c0@cybergeneration.com>
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
To: Maxime Ducharme <mducharme@cybergeneration.com>
Cc: netfilter@lists.netfilter.org

On Fri, February 4, 2005 10:23 am, Maxime Ducharme said:
>
> Hello guys

Hiya Maxime!

>
> I have a question about -m string module and
> I think you iptables geeks can answer me :)

I am no geek nor guru ;)

>
> Suppose I want to drop TCP connections with
> specific requests.
>
> Example : a mail which contains the word "sperm",

I don't think iptables is the proper tool for such.
Consider using a mail proxy able to scan message for virus
and such instead.

>
> I'd add a rule like
>
> $IPTABLES -t filter -A FORWARD -p tcp --dport 25 -d OURMAILSERVER \
>     -m string --string "sperm" -j DROP
>
> What is the reaction in the TCP connection ?

That packet always gets lost in the black hole.
The sender will keep sending that packet over and over again.
However, I *think* TCP has a timeout mechanism.

>
> The further packets of the same connection get dropped too ?

No

> This would mean the email cannot be sent, and stay in the foreign
> mail server queue for X days ?

My guess is the TCP algorithm would keep trying to send that particular
packet as it didn't get any ACK for that sequence number.

> Would it be the same if I use a REJECT rule ?

No. I think a tcp-reset would do the trick.

>
> Also, can fragmented TCP packets get through this ?

Yes, but that `sperm' word is quite small. Most of the time,
this whole word will stand in a framgented packet.

>
> Thanks in advance
>
> Maxime Ducharme
> Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau
>

Bonne journ=E9e,

Samuel

NOTE: This email reflects author _thoughts_, not the reality.
      I may be totally wrong, so just don't trust me :-)


