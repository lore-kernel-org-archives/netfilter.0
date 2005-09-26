From: "Enrique A. Tobis" <etobis@gmail.com>
Subject: Squid + iptables + apache
Date: Mon, 26 Sep 2005 00:41:34 -0300
Message-ID: <b71b665d05092520412bdddd12@mail.gmail.com>
Reply-To: etobis@dc.uba.ar
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I managed to solve my problem, but, for future reference, I answer
Edmundo's question. The error I was getting from squid was

"
ERROR
The requested URL could not be retrieved

While trying to retrieve the URL: http://something.dyndns.org/

The following error was encountered:

    * Connection Failed

The system returned:

    (111) Connection refused

The remote host or network may be down. Please try the request again.
"

support@ilgtravel.com suggested enabling the option
X-forwarded-something on squid. I tried that, and it didn't work.

Now, /dev/rob0's solution doesn't work either. Firefox just cannot
connect to the host.

However, as you might have seen from the squid message, I was trying
to access 192.168.0.3, as a host, but using the dyndns name it has. Of
course, that name is associated with the ppp0 interface. Adding an
appropriate rule in ip-up did the trick.

/usr/sbin/iptables -t nat -I PREROUTING 1 -i eth0 -p tcp -d $4 --dport
80 -j DNAT --to 192.168.0.1:80

Even so, I tried /dev/rob0's solution, and I tried to acces the host
as 192.168.0.3, and it still doesn't work.

Thank you all for your suggestions.
Enrique

On Monday 19 September 2005 23:57, Enrique Augusto Tobis wrote:
> To sum it up, almost everything is working as it should. But, if I
> try to access 192.168.0.3 from INSIDE the network, I get an error
> from squid...
>
> I activate the transparent proxy with
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 8080
>
> and forward the port 80 connections with
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
> 192.168.0.1:80

iptables -vt nat -I PREROUTING -i eth0 -d 192.168.0.3 -p tcp \
    --dport 80 -j ACCEPT

*Might* do it. My guess is that this router is seeing the packets to
192.168.0.3 for some reason. My rule (-I to insert at top) will bypass
your REDIRECT rule.

Edmundo's question is valid. Normally a host would not go through your
firewall to reach another host on the same physical segment. So my
guess might be wrong.

