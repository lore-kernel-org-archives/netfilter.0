From: "..." <betolourenco@ig.com.br>
Subject: Re: Rule matchup in iptables
Date: Thu, 6 Mar 2003 18:08:30 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <022101c2e424$8bcf2800$32050a0a@rlourenco>
References: <20030306124758.GB23703@talika.eii.us.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

try:

iptables -L -nv

and with the return you can view your consume (ammount of packets) and set
the rules in order to optimize the hits.


...
----- Original Message -----
From: "Javier Miguel Rodr=EDguez" <javier@talika.eii.us.es>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, March 06, 2003 9:47 AM
Subject: Rule matchup in iptables


>
> Hello
>
> I have a iptables based firewall, with 5 gigabit ethernet
> adapters and almost 8000 rules (ouch!). This is a "test bed", (still) not
a
> production enviroment
>
> I can see delays in traffic when crosses the firewall
> (miliseconds). I want to optimize the firewall rules (we use a LOT of
> VoIP) , so this is my question: Is there any way to know when a packet
matches a rule?
> -j LOG is not feasible (thousands of packets per second). I want something
like this:
>
> Last two hours:
>
> Rule 1: 15000 hits, 150 megabytes
> Rule 2: 3500 hits, 34 megabytes
> Rule 3: 9675 hits, 2 megabytes
> ad infinitum...
>
> Other question? How can I test iptables rules? In ipchains I
> could try them, but with iptables do I have to generate fake traffic?
>
> Thank you for your support.
>
>
>


