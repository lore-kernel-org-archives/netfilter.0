From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problems routing
Date: Mon, 24 Jun 2002 16:59:35 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206241559.QAA16636@slate.rockstone.co.uk>
References: <007101c21b95$e87a6e50$5064a8c0@optimus> <3D173EF3.71ED313B@quantum.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D173EF3.71ED313B@quantum.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailing list <netfilter@lists.samba.org>

On Monday 24 June 2002 4:46 pm, Karl Fischer wrote:

> Tim wrote:
> > I have a 192.168.100.0 network with my iptables box sitting at
> > 192.168.100.12 and a mailserver at 192.168.100.10 and also with a public
> > ip and name.
> >
> > I have several users who are both on the road and work in the office
> > commonly.
> >
> > I want to make a rule for them so that when they request mail.cimx.com it
> > redirects to 192.168.100.10.
> >
> > I tried to make the following rule:
> > iptables -t nat -A PREROUTING -p tcp -d $MAIL_IP -j REDIRECT
> > 192.168.100.10 but it seems to not work.
>
> You'll have to use DNAT for that:
>
> iptables -t nat -A PREROUTING -p tcp -d $MAIL_IP \
> 	-j DNAT --to-dest 192.168.100.10

Be careful that when they're in the office, on the LAN, the server will try 
to reply direct to their machine, which doesn't go back through the firewall 
(local address, not routed), so the reverse SNAT won't get done, and the 
client risks sending a request to 204.192.102.210 and getting a reply from 
192.168.100.10, which will confuse it.

You'll probably need to SNAT the packets too to make sure the replies go back 
through the firewall:

iptables -t nat -A POSTROUTING -p tcp -d 192.168.100.10 -s 192.168.100.0/24 
-j SNAT --to 192.168.100.12

 

Antony.

