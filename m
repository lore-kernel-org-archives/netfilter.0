From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Change source port
Date: Tue, 27 Nov 2007 09:21:36 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0711270918560.19843@mail3.jubileegroup.co.uk>
References: <1196115598.27273.1223346377@webmail.messagingengine.com>
 <474B77F0.8080109@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474B77F0.8080109@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Mon, 26 Nov 2007, Grant Taylor wrote:

> On 11/26/2007 4:19 PM, netfilter@buglecreek.com wrote:
> > We have a situation where our nameservers are contacting an upstream
> > nameserver to resolve a name using a source port 53 and a destination
> > port 53.  We have found out that the upstream name server will not honor
> > our request since the source port from our nameservers is 53.  Until we
> > can resolve this with the upstream admin, we would like
> > change the source port from our name server to a high numbered port
> > using iptables when it tries to contact the upstream nameserver.  We can
> > not seem to put together a rule to do this.  Is it even possible?
>
> Refer to the IPTables man page for exact syntax, but yes you can change
> the source port if you SNAT the packets.
>
> iptables -t nat -A POSTROUTING -o ${ExtIF} -p udp --sport 53 -j SNAT
> --to-source ${ExtIP}:${ExtPort}
>
> iptables -t nat -A POSTROUTING -o ${ExtIF} -p tcp --sport 53 -j SNAT
> --to-source ${ExtIP}:${ExtPort}

If you use BIND V9 you could just tell the nameserver to use a
different port, without needing to mess around with iptables.

See chapter 10.15 of the O'Reilly book "DNS and BIND".

--

73,
Ged.
