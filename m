From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: using iptables for poor-man's load balancing?
Date: Wed, 19 Feb 2003 19:12:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302191912.06748.netfilter@newkirk.us>
References: <HMEBKOCKLOOEJGIOMFAPAEJNFJAA.ian@icreditvision.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEBKOCKLOOEJGIOMFAPAEJNFJAA.ian@icreditvision.com>
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
To: Ian Douglas <ian@icreditvision.com>, netfilter@lists.netfilter.org

On Wednesday 19 February 2003 06:17 pm, Ian Douglas wrote:
> > Say for argument's sake that our public IP is 1.2.3.4 and our
> > internal LAN machines are:
> >   192.168.1.1
> >   192.168.1.12
>
> (cut two of them out since they're not actually ready to run yet)
>
> > Just curious if the following rules would work to round-robin the
> > connections:
> >
> > /sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 80  -j
> > DNAT \ --to-destination 192.168.1.1:80 \
> >    --to-destination 192.168.1.12:80

AFAIK, you can only DNAT to a contiguous range of IPs from a single rule,=
=20
and the rule construction you have here will ignore 'excess'=20
destinations.  If you have (or can arrange) your internal machines to=20
have sequential IPs, then try something like this (which is=20
"by-the-book"):

/sbin/iptables -t nat -A PREROUTING -p TCP -d 1.2.3.4 --dport 80  \
-j DNAT --to 192.168.1.1-192.168.1.5

The port number is only needed after the new IP if you are redirecting to=
=20
a different port than the original destination, and "--to" is an=20
acceptable substitute for both "--to-source" and "--to-destination".

j


