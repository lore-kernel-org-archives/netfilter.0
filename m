From: "William Beattie" <williambeattie@msn.com>
Subject: (no subject)
Date: Mon, 10 Mar 2003 14:33:26 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2e755$11080590$5efffacc@fntax.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I have a fairly complicated network which I have to maintain =
connectivity
with 20 different customers over private line or frame relay and 14 =
remote
offices using frame relay.  Most of the customers use 10.x.x.x or
192.168.x.x subnets.  In order to not conflict with the customer =
networks I
am using all public IP addresses locally and at my remotes. (Ya, Ya, I =
know)

Now I have a mandate from our corporate IT to migrate/RE-IP my entire
network to 10.x.x.x. =20

Right away with the 10.x.x.x subnets I have been assigned for this =
office I
immediately conflict with at least one customer circuit.

IPTABLES looks like the way to go but I need some helpful suggestions. =20

I need to do source and destination nat because we connect to machines =
on
their side and they connect to machines on our side. =20

I need to restrict incoming internet traffic on this firewall to =
basically 5
IP addresses or so and restrict outgoing internet access to a list of =
sites
for my general population and full internet ports 80, 443, 20:21, 23 for =
a
select group.


I am looking for suggestions, sample scripts and anything else you have.

I know RTFM, I did and it just doesn't look like the out of the box
configuration will do.

Please send files or attachments to wbeattie@fnis.com




Sincerely,

William Beattie -- Network Engineer
Microsoft Certified Systems Engineer

FNIS Real Estate Tax Service, Monrovia, CA
(626) 351-5060 ext 214  Fax: 626-351-6181
Cell Phone (626) 625-4973 DC # 124*27588*1
Text Message 6266254973@messaging.nextel.com

MSN IM: williambeattie@msn.com

PS Please only send me PLAIN TEXT EMAIL

