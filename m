From: Kirk <whereisgui@gmail.com>
Subject: Re: Temporary redirection with DNAT and SNAT
Date: Thu, 28 Apr 2005 16:25:58 -0700
Message-ID: <48be50bb050428162538605b12@mail.gmail.com>
Reply-To: Kirk <whereisgui@gmail.com>
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

Thanks for your help. I solved the problem.
First, I'll answer your questions then I'll explain the fix.

Grant,
>Do you have any other rules in your FORWARD chain that will allow the
rest of the traffic flow >through to the Proxy, i.e. --state
ESTABLISHED?  Correspondingly do you have any rules that >will prevent
the traffic that is flowing from the proxy in eth1 and back out eth0?=20
This could get >you down the road.

Yes, I have FORWARD rules and I allow ESTABLISHED connections.  The
other 5 servers behind the firewall work fine. I did check for typos
but I did not find any.

>You will have to specify a protocol "-p tcp" to use any port definitions.
No typos but.. right, I was missing the protocol. I added the protocol
to the rules and I was able to start the connection to the server but
the server had problems replying to the client so the connection was
dropped.

To Jim,

>I think the difference is that the SNAT rule does not
>specify the protocol the way the DNAT rule does ( -p tcp ).
>You can only specify a source port for a
>protocol that uses the concept of a "port".
You might be right I fixed the syntax of my rules and I still did not
get the set up to work.


If you are interested, here's what I did.=20

1. Added the proxy's public IP to the firewall's external interface.
ip addr add $PROXY_IP/23 dev eth0

2. Added a second private IP to the server that will be handling the
requests for the offline server (eth0:0).

Now I have an "extra" machine that will be replacing the offline proxy.

3. Configured proxy to listen on eth0:0 192.168.0.9:80
4. Iptables rules

-A FORWARD -i eth0 -o eth1 -p tcp  -d 192.168.0.9 --dport 80 -j ACCEPT

-I POSTROUTING -s 192.168.0.9 -o eth0 -j SNAT --to $PROXY_IP
-A PREROUTING -i eth0 -p tcp -d $PROXY_IP --dport 80 -j DNAT --to 192.168.0=
.9:80

My set up seems to be working fine.
Thanks again for your help.
-K

