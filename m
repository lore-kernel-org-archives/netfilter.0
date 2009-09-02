From: Tormod =?ISO-8859-1?Q?Nyg=E5rd?= <tormod@sug.no>
Subject: Re: Checking line status
Date: Wed, 02 Sep 2009 16:13:49 +0200
Message-ID: <1251900829.17228.23.camel@TN-kontor>
References: <4A93CC1C.3070100@infoservices.in>
	 <58261217A1E14FCCB2F0CF27FA977252@squarepi.com>
	 <4A93DDA0.6000900@trash.net>
	 <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: john.lister@kickstone.com

Hi

I do what you try at a couple of networks.

I have one IP-address outside my networks that I use to ping to check i=
f
a link is good. I do some counting of packet loss before switching
routes. The IP-address I use to check routes is always routed out of th=
e
preferred route and not the default route. I switch route based on
packet loss.

The script I use is meant to choose between two bad links where I prefe=
r
one of them, you should change and tune it to fit your needs. This is
not a script to check if an interface is down. The script never stops,
you have to use <ctrl-c>. It could probably be done more elegant, but i=
t
fit my needs.

#!/bin/sh

# An IP-address outside our net, used to check the link.
target=3Dxxx.xxx.xxx.xxx

# Preferred route
route1=3Dxxx.xxx.xxx.xxx

# Backup route
route2=3Dxxx.xxx.xxx.xxx

interval=3D1
pingfail=3D5
switchback=3D100


# Internal variables
switch=3D0
successcounter=3D0

# Delete any existing route to $target and add one trought $route1
if ( ip route | grep $target ) ; then
  ip route del $target
fi

ip route add $target via $route1


if ( ip route | grep "default via $route1" > /dev/null 2>&1 ) ; then
  echo $(date) - Starting on $route1
else
  echo $(date) - Starting on $route2
fi


while [ 1 ] ; do
  if ( ! ping -c $pingfail $target > /dev/null 2>&1 ) ; then

      if ( ip route | grep "default via $route1" > /dev/null 2>&1 ) ;
then
          # We are using the prefered route, switch to route2
          switch=3D1
      fi
      successcounter=3D0
  else
      successcounter=3D$( echo $successcounter+1 | bc )
      if ( ip route | grep "default via $route2" > /dev/null 2>&1 ) ;
then
          # We are not using the prefered route
          if [ $switchback =3D=3D $successcounter ] ; then
              # We have enough success pings to switch back
              switch=3D1
          fi
      fi

  fi

  if [ $switch =3D=3D 1 ] ; then
      # Switch route

      if ( ip route | grep "default via $route2" > /dev/null 2>&1 ) ;
then
          echo $(date) - Switching to $route1
          ip route del default via $route2
          ip route add default via $route1
      else
          echo $(date) - Switching to $route2
          ip route del default via $route1
          ip route add default via $route2
      fi

      # Flush routing cache
      ip route flush cache

      # HUP openvpn to reset connection
      ps ax | grep [o]penvpn | awk '{ print $1 }' | xargs kill -HUP
> /dev/null 2>&1

      switch=3D0
  fi

  # Sleep for $interval seconds
  sleep $interval

done

exit 0



Tormod Nyg=C3=A5rd




On Wed, 2009-09-02 at 10:23 +0100, John Lister wrote:
> Hi, I have a multihomed machine to which i'd like to check the status=
 of=20
> each line periodically. I want to do this so that I can modify the ip=
tables=20
> rules and send new connections out over the active lines and restore =
service=20
> when the line comes back up.
>=20
> I thought I could use ping with the -I option, but that doesn't seem =
to=20
> work, it always uses the default route. However if I get rid of the d=
efault=20
> route and modify the rules to match the packets I get a "network=20
> unreachable" message without it ever hitting iptables. For example ad=
ding=20
> something like this never gets matched for the ping.
>=20
> iptables -t mangle -I OUTPUT -j LOG --log-prefix "output: "
>=20
> Normally ping results in ICMP messages being traversed, but not this =
time.
>=20
> Could someone explain what is going on and I'd be grateful if there w=
ere any=20
> suggestions on other ways to detect if a line is down - simply lookin=
g in=20
> /proc/net/dev or similar wouldn't help as the local connection is lik=
ely to=20
> be up, but the physical line to the ISP may be down.
>=20
>=20
> Thanks
>=20
> John=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

