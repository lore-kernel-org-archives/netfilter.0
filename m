From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Temporally disable a host
Date: Sun, 15 May 2005 18:28:34 -0500
Message-ID: <4287DB22.4040608@riverviewtech.net>
References: <1116065330.2995.106.camel@crux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1116065330.2995.106.camel@crux>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@lists.netfilter.org

bjorn wrote:
> Hello,
>=20
> I use iptables based on the MonMotha's Firewall script.
> I partly understand what it does but have not been able
> to absorb all the functionality/possibilities that iptables
> offers...
>=20
> I would like to temporally disable one of the hosts inside
> by private network from internet access. Possibly all traffic
> or only http traffic. My idea was to add this rule through a
> cron job at a specific time and then later run another job that
> deletes the rule.
>=20
> Please help me with a suitable iptables command to do this.
>=20
> Regards,
>=20
> /Bj=C3=B6rn

I would recommend that you take a look at the time match extension.  Time=
 match extension is meant to allow rule(s) to match based on time, day of=
 week, with start and stop dates with times.  This would allow you to hav=
e a rule that would allow (ACCEPT) traffic to pass through to / from the =
server in question only during the times that you want it to.  Follow thi=
s rule up with a default drop policy to reject traffic if the former does=
 not allow the traffic to flow through.  You could conversely set up a ru=
le to drop traffic during the times that you want the system to be off li=
ne, but I prefer a default of drop and then explicitly allow the traffic =
to through.

I would recomend that you set up a couple of rules in your firewall in th=
e following order:

  1)  Set a rule using the time match extension, i.e.
        iptables -t filter -A FORWARD -s $IP_address_of_server_to_protect=
 -m time --timestart 08:00 --timestop 17:00 --listofdays Mon,Tue,Wed,Thu,=
Fri -j ACCEPT
  2)  Set a rule that will by default match and drop any traffic that was=
 not explicitly accepted in the previous rule, i.e.
        iptables -t filter -A FORWARD -s $IP_address_of_server_to_protect=
 -j DROP

Or if you are wanting to only block port 80 and 443 traffic I would do so=
mething like the following:

  1)  Set a rule using the time match extension, i.e.
        iptables -t filter -A FORWARD -s $IP_address_of_server_to_protect=
 -p tcp --dport 80 -m time --timestart 08:00 --timestop 17:00 --listofday=
s Mon,Tue,Wed,Thu,Fri -j ACCEPT
        iptables -t filter -A FORWARD -s $IP_address_of_server_to_protect=
 -p tcp --dport 443 -m time --timestart 08:00 --timestop 17:00 --listofda=
ys Mon,Tue,Wed,Thu,Fri -j ACCEPT
  2)  Set a rule that will by default match and drop any traffic that was=
 not explicitly accepted in the previous rule, i.e.
        iptables -t filter -A FORWARD -s $IP_address_of_server_to_protect=
 -p tcp --dport 80 -j DROP
        iptables -t filter -A FORWARD -s $IP_address_of_server_to_protect=
 -p tcp --dport 443 -j DROP

Below is the output of "iptables -m time -h".

TIME v1.3.1-20050422 options:
 [ --timestart value ] [ --timestop value] [ --days listofdays ] [ --date=
start value ] [ --datestop value ]
          timestart value : HH:MM (default 00:00)
          timestop  value : HH:MM (default 23:59)
                            Note: daylight savings time changes are not t=
racked
          listofdays value: a list of days to apply
                            from Mon,Tue,Wed,Thu,Fri,Sat,Sun
                            Coma speparated, no space, case sensitive.
                            Defaults to all days.
          datestart value : YYYY[:MM[:DD[:hh[:mm[:ss]]]]]
                            If any of month, day, hour, minute or second =
is
                            not specified, then defaults to their smalles=
t
                            1900 <=3D YYYY < 2037
                               1 <=3D MM <=3D 12
                               1 <=3D DD <=3D 31
                               0 <=3D hh <=3D 23
                               0 <=3D mm <=3D 59
                               0 <=3D ss <=3D 59
          datestop  value : YYYY[:MM[:DD[:hh[:mm[:ss]]]]]
                            If the whole option is ommited, default to ne=
ver stop
                            If any of month, day, hour, minute or second =
is
                            not specified, then default to their smallest=




Grant. . . .


