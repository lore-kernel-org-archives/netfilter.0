From: Myles Uyema <mlists@uyema.net>
Subject: Re: NAT help
Date: Tue, 13 May 2003 18:14:14 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305131810121.13227-100000@marx.gruntwerk.net>
References: <96ABC82F42C0F447897813D482A82E8140D1FB@boga101a>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <96ABC82F42C0F447897813D482A82E8140D1FB@boga101a>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?Jairo=2ECasta=F1eda?= <Jairo.Castaneda@siemens.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

"It's not working" does not give us helpful error information.
What is your FORWARD policy?  Those two forward rules you do have will le=
t=20
packets go out to the internet, but I don't see any reverse rules to allo=
w=20
packets to return.  Where in your chains do you think the packets are=20
getting blocked?

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -p tcp --source-port 110 -i eth1 -m state --state EST=
ABLISHED -j ACCEPT
iptables -A FORWARD -p tcp --source-port 25 -i eth1 -m state --state ESTA=
BLISHED -j ACCEPT


On Tue, 13 May 2003, Jairo.Casta=F1eda wrote:

Hi,

I just started working with IPTables but I think I chose a difficult task=
 to
acomplish, let me explain:

INTERNET <-------------> ETH1[LINUX BOX RH9]  ETH0 <-----------> LAN=20

The users in the LAN need to be able to read their email which is stored =
in
a POP3/SMTP mail server located in INTERNET so I did the following:

1. I defined as my users=B4 default gateway the Linux box
2. In the linux box, I created the following rules

IPTABLES -A FORWARD -p tcp --destination-port 110 -i eth0 -j ACCEPT
IPTABLES -A FORWARD -p tcp --destination-port 25 -i eth0 -j ACCEPT
IPTABLES -t nat -A POSTROUTING -p tcp -i eth0 -o eth1 -j MASQUERADE

Well I read the FAQ and I think this configuration should be enough, but
it=B4s not working. Am I missing something here?

Thanks for your help.


Jairo Casta=F1eda



