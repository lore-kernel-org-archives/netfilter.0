From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Reg iptables Connection tracking
Date: Fri, 10 Jan 2003 00:32:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301100032.39224.netfilter@newkirk.us>
References: <4223A04BF7D1B941A25246ADD0462FF5647695@blr-m3-msg.wipro.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4223A04BF7D1B941A25246ADD0462FF5647695@blr-m3-msg.wipro.com>
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
To: Amit Kumar Gupta <amitkumar.gupta@wipro.com>, netfilter@lists.netfilter.org

On Friday 10 January 2003 12:03 am, Amit Kumar Gupta wrote:
> Hi List,
>
> I am getting a problem with iptables :-
>
> I have added some rules in which I check the states of the packets
> which I receive i.e. whether it is NEW, ESTABLISHED or INVALID and
> then do some actions.
>
> Now the problem which I am getting is :- (However I have already
> posted a si ilar query reg this but I think this will be more
> elaborative).
>
> As soon as somebody pings to my m/c , that fellow doesn't get the
> reply and on my m/c , kernel keeps dumping certain messages which are
> like this :-
>
> Ip_contrack: maximum limit of 1016 entries exceeded.

Well, that's what's happening then.  The conntrack table is filling.  The=
=20
real question is "why"?  How many machines are connected to/through this=20
one, how many interfaces, subnets, etc?  Ping from LAN to firewall box,=20
internet to LAN, what?  Just this box on the internet?  You need to=20
elaborate still further for anyone to have much chance figuring out the=20
source of your problem.  Since the conntrack limit is being reached, try=20
"cat /proc/net/conntrack" and see what it's filled with.  (Probably 1016=20
entries, but are they all legitimate traffic, or what?)

Conntrack is used for state and NAT both.  It might help if you also=20
included the new state rules you added, and any NAT or state rules that=20
were already in place.

j


