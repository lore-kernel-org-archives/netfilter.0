From: =?iso-8859-1?Q?KUCKAERTZ_R=E9gis_-_NVISION?= <regis@nvision.lu>
Subject: RE: Port forwarding
Date: Fri, 17 Sep 2004 16:09:59 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C8JR4-00038Q-00@deer.gmane.org>
References: <1095429469.1886.41.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095429469.1886.41.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: 'Jason Opperisano' <opie@817west.com>, netfilter@lists.netfilter.org

> stupid question:  is IP forwarding enabled (sysctl=20
> net.ipv4.ip_forward)?

argh, last week there was a maintenance cycle in our datacenter and =
every
machine was rebooted. I thought

echo "1" > /proc/sys/net/ipv4/ip_forward

would be persistant but I was wrong. Also I forgot to check if it was =
still
there after the reboot. Really sorry, this is time lost!

Thank you very much, good job!

R=E9gis


