From: =?iso-8859-1?Q?Lu=EDs_Fernando_C._Talora?= <talora@4networks.com.br>
Subject: -m limit
Date: Thu, 5 Sep 2002 16:28:00 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <014501c25512$5932a9e0$0101a8c0@osbourn>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter.org" <netfilter@lists.netfilter.org>

Fellows,

I'd like some help using ntefilter "limit" module.

If I put something like the following in a firewall script (to limit tcp syn
packets):

# Block tcp syn floods
     $IPTABLES -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT

        (and then, latter, I put the following)

# Access to my web server
     $IPTABLES -A FORWARD -p tcp -d $MY_WEB_SERVER --dport 80 -j ACCEPT

In this example, will a tcp syn flood be barred by the first line? Is it the
second line allowing more than 1 packet per second? Do I have to use "-m
limit --limit 1/s" on the second line too (and all lines that allow incoming
packets)?

Thank you all!

Regards,

Lu=EDs Fernando C. Talora



