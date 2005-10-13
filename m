From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: DNAT problems using a single interface
Date: Thu, 13 Oct 2005 03:19:03 +0300
Message-ID: <3063e50510121719n3199ee10q628397955772f136@mail.gmail.com>
References: <434D8802.40702@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434D8802.40702@satchell.net>
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
To: Stephen Satchell <list@satchell.net>
Cc: netfilter@lists.netfilter.org

In such situations you need to SNAT too, like this:
 for p in 25:26 465 587; do
for ip in $SERVER_IPS ; do
/sbin/iptables -t nat -A POSTROUTING -o eth0 \
-p tcp --dport $p -d $mx11 -j SNAT --to $ip done
done
 This will create problems because you loose the source address at
application level (if you need them), even it can be tracked very well in
FORWARD chains. Else ... who knows, maybe you can do tricks with iproute2
and MARK target from iptables, and instead of nat-ing, you will do some ugl=
y
routing. I can't tell exactly how to do this because i didn't read and
understand all aspects of your situation.

 On 10/13/05, Stephen Satchell <list@satchell.net> wrote:
>
> I have a knotty problem. I have 31 servers running older versions of
> QMail. There is proprietary software on those 31 servers that prevents
> me from updating to the latest QMail patches, and even if I could the
> spam control in qmail is, um, sucky. So I have built a gateway mail
> server, using PostFix, that will "front-end" the 31 QMail servers.
> (There is also a colostomy bag, also running Postfix, to catch and
> retain spam spewing from the servers from things like raped PHP/Perl
> scripts, but that's beside the point.)
>
> The "right" way to do this is to change all the DNS zone files (some
> 6,000) of them to point MX records properly, and convince over 100,000
> people to update their mail program configurations...assuming they
> aren't running something like Eudora 5.2, which doesn't allow split
> servers with different authentication.
>
> IPTABLES TO THE RESCUE! In each of the 31 servers, put a set of
> firewall rules to DNAT up to 200 IP addresses to the gateway server, let
> the TCP communications on port 25 (and other well-known mail ports)
> happen, and put a back-channel using another port for mail that needs to
> go to that server for storage, future pick-up, forwarding, list
> explosion, and autoresponder processing.
>
> I can't get it to work.
>
> -------------Netfilter rules-----------------
> # forward mail requests to x; use absolute IP address.
> mx11=3D10.1.2.99 <http://10.1.2.99>
> SERVER_IPS=3D"10.1.1.11 <http://10.1.1.11> 10.1.1.12 <http://10.1.1.12>
> 10.1.1.13 <http://10.1.1.13> 10.1.1.14 <http://10.1.1.14> 10.1.1.15<http:=
//10.1.1.15>
> "
>
> for p in 25:26 465 587; do
> for ip in $SERVER_IPS ; do
> /sbin/iptables -t nat -A PREROUTING -i eth0 -d $ip \
> -p tcp --dport $p -j DNAT --to-destination $mx11
> done
> done
>
> /sbin/iptables -t filter -A FORWARD -i eth0 -o eth0 \
> -p tcp -d $mx11 --dport $p \
> -m state --state NEW -j ACCEPT
>
> /sbin/iptables -t filter -A FORWARD -i eth0 -o eth0 \
> -p tcp -d $mx11 --dport $p \
> -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>
>
> /sbin/iptables -t filter -A FORWARD -i eth0 -o eth0 \
> -p tcp -s $mx11 --sport $p \
> -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>
> echo 1 >/proc/sys/net/ipv4/ip_forward
> -------------End rules--------------------
>
> Tracing through three sets of TCPDUMP outputs, here is what I saw:
>
> Client send TCP packets SRC=3D192.168.2.10 <http://192.168.2.10> (eth0) D=
ST=3D
> 10.1.1.11 <http://10.1.1.11> (eth0)
> QMbox sends TCP packets SRC=3D192.168.2.10 <http://192.168.2.10> (eth0) D=
ST=3D
> 10.1.2.99 <http://10.1.2.99> (eth0)
> Gateway receives packet
> Gateway replies SRC=3D10.1.2.99 <http://10.1.2.99> (eth0) DST=3D192.168.2=
.10<http://192.168.2.10>(eth0) !!!
>
> Client, totally confused by the whole thing, discards the packet it
> doesn't know, because the source address isn't in the conntrack table
> and that's that -- TCP is broken.
>
> The "Host Forwarding" described in [Ziegler, p 277-8] implies that DNAT
> would mangle the source address so that replies would come back to the
> same server, instead of the circle I saw. This is astonishing based on
> the netfilter documentation I found; I would expect the stuff that works
> with two or more interfaces to work with one interface. Or is that a
> stretch?
>
> What am I missing here?
>
> More importantly, how can I get the functionality I need without using
> the link capability of xinetd (the QMail management software screws up
> the control files on a distressingly regular basis) and without writing
> a custom link program?
>
> For grins and giggles, I tried to include SNAT, but because there are so
> many input addresses I failed to come up with a suitable set of rules.
>
> I know that I really should just throw out the proprietary product that
> uses QMail, but to solve my mail problems within 15 days I don't think
> that's an option. I need a suitable bandaid now, that doesn't call for
> a huge hardware investment and that will be proof against proprietary
> software defeating.
>
> Open source. It works when you have it...
>
> Stephen Satchell
> Pattern-bald from tearing hair out.
>
>
>


--
Bla bla
