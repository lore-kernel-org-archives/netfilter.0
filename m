From: Sudhakar Moharana <soodhakar@gmail.com>
Subject: Re: help needed for RTSP conntrack module 2.4 kernel
Date: Thu, 15 Dec 2005 13:27:08 +0530
Message-ID: <6dbb1b230512142357n53b254b4s7e3033e76916ea15@mail.gmail.com>
References: <6dbb1b230512132056m36f76f21kd2dd7e2dbc0fd91b@mail.gmail.com>
	<73fc994a0512140755v2662a65dj2e106297424bdeff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <73fc994a0512140755v2662a65dj2e106297424bdeff@mail.gmail.com>
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
To: Arjen Smit <smit.arjen@gmail.com>
Cc: netfilter@lists.netfilter.org, netfilter-failover@lists.netfilter.org

Hi ,
      Thanks for ur response. The client indicates same client_ports
in the subsequent SETUP messages.
I have a diskless Set Top Box which uses RTSP Client. This Client
always uses a fixed client port. Since the box is diskless so there is
no need of multiple streams. It needs only one connection at a time.

So if two SETUP messages are coming from the client, is there any way
to  discard the connection tracking made for first SETUP message and
allow the same to be done for the second SETUP message.
Because if there is two SETUP messages from the same client, we should
have to accept the later SETUP message only.

Thanks in advance . . .
Sudhakar

On 12/14/05, Arjen Smit <smit.arjen@gmail.com> wrote:
> Hi Sudhakar,
> We use the RTSP Conntrack also,
> It is quite usual for a client to send more SETUP messages for each
> track in the video (e.g a SETUP for track 1 audio, a SETUP for track 2
> video, etc). But in all the scenarios I have seen the client indicates
> different client_ports in the SETUP message. In our setup this goes
> smoothly through the RTSP conntrack module.
>
> When you mention "two RTSP SETUP requests with same source port one
> after another". Do you mean that the client indicates similar
> client_ports in the SETUP message.
> Which clients are you using ?
> BR
>
>
> /Arjen Smit
> Service Design
> Telfort

> On 12/14/05, Sudhakar Moharana <soodhakar@gmail.com> wrote:
> > Hi,
> >
> > I'm running RTSP conntrack module in my application gateway ( uClinux
> > 2.4.22 kernel, ARM processor).  The application gateway has one uplink
> > WAN port and eight LAN ports.  The devices on the LAN port are given
> > local IP address. The application gateway does NAT + PAT for  all the
> > outgoing traffic.
> >
> > Now the problem is that sometimes  RTSP Client behind my gateway sends
> > two RTSP SETUP requests with same source port one after another. The
> > RTSP module in the gateway handles the first SETUP message correctly
> > while the second SETUP request does not get handled properly and the
> > local IP address of the RTSP client goes to the RTSP server on the
> > Network(i.e the local ip address and the port in SETUP message are not
> > getting mangled to the global IP address and global ports of the
> > gateway). Since the local IP addresses are not routed in the Network
> > so the RTSP client fails playing the stream.
> >
> > How can I handle this situation where two SETUP message are sent
> > subsequently. Please note that  RTSP client needs only one connection
> > at one time.
> > Is there any way to  discard the connection tracking made for first
> > SETUP message and allow the same to be done for the second SETUP
> > message if the connection tuple remains the same.  I'm getting EBUSY
> > error for the second SETUP Message in ip_conntrack_expect_related
> > function.
> >
> > Please suggest any other ideas to do the same.
> >
> >
> > Thanx & Regards,
> > Sudhakar

