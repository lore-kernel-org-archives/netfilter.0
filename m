From: <bigman@monster-solutions.net>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Tue, 29 Oct 2002 19:30:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002b01c27fab$9d590fb0$6d02a8c0@lsmith5953>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <20021029091525.CVFB9836.mta01-svc.ntlworld.com@there> <004201c27f3d$20c88520$8f33e40f@lsmith5953> <200210291303.g9TD3Ne10065@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

when I run DHCRELAY -i eth2 it tells me that it is listening on eth2 and
sending on eth2. I assume this is wrong? how do I fix it? is it my routing
table?

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, October 29, 2002 8:03 AM
Subject: Re: DHCRELAY through IPTABLES Firewall


> On Tuesday 29 October 2002 11:20 am, bigman@monster-solutions.net wrote:
>
> > below is what gets logged when using DHCRELAY. It looks like it will
work
> > but then I never see the request from the 192.168.2.69 (firewall) hit
the
> > DHCP server which I am running a sniffer on. I must be making this
harder
> > then it should be. Can you provide me with the steps to get DHCRELAY
> > working across different subnets. I really appreciate all of the help.
> >
> > Oct 29 07:13:12 firewall kernel: IN=eth2 OUT=
> > MAC=ff:ff:ff:ff:ff:ff:08:00:09:f1:b2:ba:08:00 SRC=0.0.0.0
> > DST=255.255.255.255 LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=8523 PROTO=UDP
> > SPT=68 DPT=67 LEN=308
>
> Packet comes in on eth2 with broadcast destination IP and MAC adresses,
> source IP address = 0.0.0.0
>
> > Oct 29 07:13:12 firewall kernel: IN= OUT=eth2 SRC=192.168.2.69
> > DST=192.168.1.70 LEN=328 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP
SPT=67
> > DPT=67 LEN=308
>
> The the firewall sends a packet from its own IP address 192.168.2.69 to
the
> DHCP server 192.168.1.70 on *eth2* !!!
>
> Why ?
>
> > Oct 29 07:13:27 firewall kernel: IN=eth2 OUT=
> > MAC=ff:ff:ff:ff:ff:ff:08:00:09:f1:b2:ba:08:00 SRC=0.0.0.0
> > DST=255.255.255.255 LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=8537 PROTO=UDP
> > SPT=68 DPT=67 LEN=308
>
> DHCP client hasn't had an answer within 15 seconds so it asks again.
>
> > Oct 29 07:13:27 firewall kernel: IN= OUT=eth2 SRC=192.168.2.69
> > DST=192.168.1.70 LEN=328 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP
SPT=67
> > DPT=67 LEN=308
>
> Firewall sends the request to 192.168.1.70 out of the wrong interface
again.
>
> Antony.
>
> --
>
> Normal people think "if it ain't broke, don't fix it".
> Engineers think "if it ain't broke, it doesn't have enough features yet".
>


