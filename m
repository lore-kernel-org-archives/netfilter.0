From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Tue, 18 May 2004 15:44:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405181544.24474.Antony@Soft-Solutions.co.uk>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
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

On Tuesday 18 May 2004 3:22 pm, alucard@kanux.com wrote:

> Hi there again,
>
>    I finally decided to add a second card to both, the server and the
> client to be able to forward packets from port 8080 in server 1 to port
> 80 in server 2 and somehow this packets are not going thru, let me
> explain my scenario
>
> - Server 1 has a natted addres using it's 10.73; what I'm trying to do is
> that evrything that comes to 10.73.219.156:8080 gets forwarded to
> 192.168.0.2:80.
>
> - Server 1 functions as a webserver and that's why I'm using port 8080 in
> order to forward packets to port 80 in server 2
>
> - Here's my Server 1's /etc/rc.d/rc.firewall script because somehow it's
> not working:
>
> #para el forward
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 8080 \
>     -j DNAT --to-destination 192.168.0.2:80
> echo 1 > /proc/sys/net/ipv4/ip_forward
> -----

That nat rule should read:

iptables -t nat -A PREROUTING -d 10.73.219.156 -p tcp --dport 8080 -j DNAT 
--to-destination 192.168.0.2:80

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


