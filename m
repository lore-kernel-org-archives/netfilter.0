From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: rc.local
Date: Tue, 26 Jul 2005 15:30:48 +0400
Message-ID: <9927912d0507260430275d8239@mail.gmail.com>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
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
To: netfilter@lists.netfilter.org

Here is my rc.local file:

#!/bin/bash
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local

IPT=3D"/sbin/iptables"

$IPT -F
$IPT -Z

if [ ! -r x ]; then

# No value from previous run - initialize x
  x=3D1
else
  x=3D$((`cat x`))
  echo "Value of x from previous run =3D $x"
fi

if [ $x -eq 1 ]; then
  #FW1 IP: 192.168.10.2
  $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d
192.168.10.0/24 -p icmp --icmp-type echo-request -j ACCEPT
  $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d
192.168.10.0/24 -p icmp --icmp-type echo-reply -j ACCEPT
  x=3D0;
else
  #FW2 IP: 192.168.10.3
  $IPT -A FORWARD -i eth0 -o eth1 -s 192.168.10.0/24 -d
192.168.10.0/24 -p icmp --icmp-type echo-request -j ACCEPT
  $IPT -A FORWARD -i eth0 -o eth1 -s 192.168.10.0/24 -d
192.168.10.0/24 -p icmp --icmp-type echo-reply -j ACCEPT
  x=3D1;
fi

# Save variable to file
echo $x >x

