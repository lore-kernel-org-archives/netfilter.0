From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: smtp
Date: Fri, 14 May 2004 12:37:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405141237.08794.gdh@acentral.co.uk>
References: <BAY15-F29OTHXMm9VWL0005acdf@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F29OTHXMm9VWL0005acdf@hotmail.com>
Content-Disposition: inline
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

On Friday 14 May 2004 12:17, azeem ahmad wrote:
> hi all
> i m havingg a continous upload on port 25 but i m unable to know which ip
> from my network is uploading on port 25. i saw on iptraf that some one is
> continously uploading on 25. the hardware addresss that iptraf is showing
> isnt really on my LAN but the traffic is coming from my LAN
> how can i find out the real hardware address or ip of the machine uploadi=
ng

iptraf is a useful tool for some purposes, but here tcpdump would be more=20
appropriate. Install it, and try

tcpdump -n port 25

You may need to specify the eth device with "-i eth0" etc.=20

It should be obvious very quickly which address on your LAN is generating t=
he=20
traffic (the machine will almost certainly be a Windows box with a virus).=
=20
=46rom then, you can issue=20

$ iptables -A FORWARD -p tcp -i ethX -s X.X.X.X --dport 25 -j DROP

And this will immediately stop all traffic from IP address X.X.X.X coming *=
IN*=20
to ethX on your firewall.

=46rom there, remove the virus and then undo the above line. (replace -A wi=
th=20
=2DD)

Cheers,
Gavin.

