From: "Elijah Alcantara" <elijah.alcantara@gmail.com>
Subject: Transparent proxy using squid, redirect all ssl/https ... ?
Date: Mon, 22 May 2006 10:17:01 +0800
Message-ID: <b4a631130605211917t7a747ceeo6d9f22b067d67466@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

It seems that implementing transparent squid proxy will cause https &
ssl to not work well on browsers ... and it would be troublesome to
manually setup proxy settings to all browsers within our network.

So I'd like to be able to redirect all other requests like
https/ssl(port 443) or email client's ports to directly access the
internet instead of going through our proxy server.

Here's a little diagram of our network:
http://static.flickr.com/49/149174815_48fa51f1a3_o.png

What I did so far is:
1. Block out all connection request from our router settings except
for our proxy server (adminserver ) only, this will force our users to
use the proxy settings for their other applications.
2. Set all client's pc's to use the new gateway 'adminserver' (our
squid server).
3. Setup transparent proxy for squid. For http requests.

Everything else is working fine so far, except that opening up
ssl-enabled sites (mail.yahoo.com) creates a timeout error and email
clients seems to not work even with proxy settings enabled.

What I need is some sort of iptable rule to grab all port 443
connections and make it connect directly to the internet ... I used
webmin to formulate a rule but that didn't work ... so I thought of
asking for help here, anyone?

Here are my current rules:
-A PREROUTING -p tcp -m tcp -i eth0 --dport 80 -j REDIRECT --to-ports 3128
-A PREROUTING -p tcp -m tcp -i eth0 --dport 443 -j DNAT
--to-destination 192.168.100.3

The first one works, it's for transparent proxy, the other one.. I
have no idea why it's not working =3D(


Regards,
Elijah A.

