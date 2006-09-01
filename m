From: "Ben DiDonc" <ben.didonc@gmail.com>
Subject: Re: Tough suspected MTU problem
Date: Fri, 1 Sep 2006 18:01:34 +1000
Message-ID: <feca60390609010101r6ddbf367ma9c148bb2773e523@mail.gmail.com>
References: <feca60390608300703i185c6f34n48e5c402f22f07fa@mail.gmail.com>
	<1157042189.2280.35.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1157042189.2280.35.camel@davila.nicaraguaopensource.com>
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
To: netfilter@lists.netfilter.org

Jorge,
Thanks for the tip, but yes I did try to change the MTU on both sides.
I tried 10 values from 576 to 1440 on both sides at the same time, but
the results were always the same: loads of TCP lost segments and dup
ACKs.
I did try something else:
I replace my Linux NAT box with an ADSL modem doing NAT, and the
problem disappeared. No more lost segments. I could finally use HTTPS
and SSH again. I kept this setup for hours and it ran without a
glimpse. This means the Linux box is the one at fault here.

Back with the linux box, when looking for solutions, I also read that
link negotiation issues gave the same symptoms for some people. So I
checked that as well, but all seems fine, both eth cards in the Linux
box have properly negotiated their speed and duplex mode. I dont know
if it matters but the NIC setup I have is as follow:
eth0 is an old Tulip 10mpbs NIC (using the de2104x driver) and is
connected to an ADSL modem working in bridge mode.
eth1 is a 100mbps card and is connected to the local network

so far, I tried:
- changing MTU values on NATed clients and server
- clamping the MSS to PMTU on the Linux NAT box
- trying different txqueuelen values
- checking the link negotiation
 but none of these solved the problem...

I m really stuck here as I have no idea where to search next.
Thanks for your help.



On 8/31/06, Jorge Davila <davila@nicaraguaopensource.com> wrote:
> Are you tried to set the mtu to a lower value?
>
> ip link set mtu <value> dev <device>
>
> You can begin with a value of 1450 and then decrease until have a
> successfully configuration. In some case, I was in need to put the mtu
> value to 1200 to give space to new headers (because of the encryptation
> data).
>
> Hope this helps,
>
> Jorge D=E1vila.
>

