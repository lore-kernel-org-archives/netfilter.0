From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NAT  ONE-TO-ONE or FULL NAT
Date: Wed, 15 Jun 2005 11:27:29 -0500
Message-ID: <200506151127.29143.rob0@gmx.co.uk>
References: <963D966FFE3FA84FA239605E9E0297FC02CE896F@SPEMEN08.icetel.ice>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <963D966FFE3FA84FA239605E9E0297FC02CE896F@SPEMEN08.icetel.ice>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wednesday 15 June 2005 10:35, Gonz=E1lez Sandoval Luis Rolando wrote:
> I'm looking information about one to one NAT and his configuration
> whit IPTABLES v1.2.7a.
>
> My requirements are:
> 1.	Map IP address for the segment 10.129.41.0/24 for an IP address of
> 192.168.20.0/24
>
> #NAT 1:1
> $IPTABLES -t nat -A POSTROUTING -o eth0 -s 192.168.20.183/32 -j
> SNAT --to 10.129.41.242
> $IPTABLES -t nat -A PREROUTING -i eth1 -d 10.129.41.242/32 -j DNAT
> --to 192.168.20.183=20
>
> # Allow forwarding to each of the servers configured for 1:1 NAT
> # (For connections originating from the Internet. Notice how you
> # use the real IP addresses here)
>
> $IPTABLES  -A FORWARD -p tcp -i eth0 -o eth1 -d 192.168.20.183 \
>     -m state --state NEW -j ACCEPT

I think you need rules like these for each host you wish to NAT. You=20
might be able to combine your FORWARD (filter table) rules into one=20
rule.

If you're doing this by means of a shell script you could use a "for"=20
loop, easier if you were mapping 10.129.41.x to 192.168.20.x.

Why not just directly assign your Internet IP's to the hosts in your=20
eth1 segment? You can route to them and control access by means of=20
=46ORWARD rules. All this NAT seems harder to maintain.
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

