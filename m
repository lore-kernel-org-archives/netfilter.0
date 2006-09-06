From: "Ben DiDonc" <ben.didonc@gmail.com>
Subject: Re: Tough suspected MTU problem
Date: Wed, 6 Sep 2006 11:17:00 +0000
Message-ID: <feca60390609060417x1fd5a03amf5606901e5698fb5@mail.gmail.com>
References: <feca60390608300703i185c6f34n48e5c402f22f07fa@mail.gmail.com>
	<1157042189.2280.35.camel@davila.nicaraguaopensource.com>
	<feca60390609010101r6ddbf367ma9c148bb2773e523@mail.gmail.com>
	<1157116844.2332.7.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1157116844.2332.7.camel@davila.nicaraguaopensource.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: davila@nicaraguaopensource.com
Cc: netfilter@lists.netfilter.org

Jorge,
no I dont rely on any proxy of any sort at all. I tried 4 different
ISPs over the last 6 months (just to rule out the transparent proxy
hypothesis) and I m still have the same problem. Here are the rules in
my firewall on the NAT box:

In the FORWARD chain (default policy DROP)
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

In the NAT table:
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIF_IP

I do have of course some rules in the INPUT chain of the NAT box, but
I dont think it s releveant here.
As you can see it s a very basic NAT setup. I didnt want to go too
complicated until I got this issue resolved.

Thanks





On 9/1/06, Jorge Davila <davila@nicaraguaopensource.com> wrote:
> Are you using a proxy in your home network to reach Internet?
>
> >From your first post I can see that in your side the https connection is
> being "reseted". What are your firewall rules?
>
> Jorge.
>
> El vie, 01-09-2006 a las 18:01 +1000, Ben DiDonc escribi=F3:
> > Jorge,
> > Thanks for the tip, but yes I did try to change the MTU on both sides.
> > I tried 10 values from 576 to 1440 on both sides at the same time, but
> > the results were always the same: loads of TCP lost segments and dup
> > ACKs.
> > I did try something else:
> > I replace my Linux NAT box with an ADSL modem doing NAT, and the
> > problem disappeared. No more lost segments. I could finally use HTTPS
> > and SSH again. I kept this setup for hours and it ran without a
> > glimpse. This means the Linux box is the one at fault here.
> >
> > Back with the linux box, when looking for solutions, I also read that
> > link negotiation issues gave the same symptoms for some people. So I
> > checked that as well, but all seems fine, both eth cards in the Linux
> > box have properly negotiated their speed and duplex mode. I dont know
> > if it matters but the NIC setup I have is as follow:
> > eth0 is an old Tulip 10mpbs NIC (using the de2104x driver) and is
> > connected to an ADSL modem working in bridge mode.
> > eth1 is a 100mbps card and is connected to the local network
> >
> > so far, I tried:
> > - changing MTU values on NATed clients and server
> > - clamping the MSS to PMTU on the Linux NAT box
> > - trying different txqueuelen values
> > - checking the link negotiation
> >  but none of these solved the problem...
> >
> > I m really stuck here as I have no idea where to search next.
> > Thanks for your help.
> >
> >
> >
> > On 8/31/06, Jorge Davila <davila@nicaraguaopensource.com> wrote:
> > > Are you tried to set the mtu to a lower value?
> > >
> > > ip link set mtu <value> dev <device>
> > >
> > > You can begin with a value of 1450 and then decrease until have a
> > > successfully configuration. In some case, I was in need to put the mt=
u
> > > value to 1200 to give space to new headers (because of the encryptati=
on
> > > data).
> > >
> > > Hope this helps,
> > >
> > > Jorge D=E1vila.
> > >
> >
> --
> Jorge Isaac Davila Lopez
> Nicaragua Open Source
> +505 808 2478
> davila@nicaraguaopensource.com
>
>

