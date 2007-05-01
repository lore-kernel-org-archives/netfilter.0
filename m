From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Subject: RE: Can't get --dport to work
Date: Tue, 1 May 2007 13:28:36 -0700
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B01E83004@pmi00exf00.us.packetmotion.com>
References: <4635EC8E.4090905@saudi.net.sa><Pine.LNX.4.61.0704301547010.29151@yvahk01.tjqt.qr><4636DE7E.80600@saudi.net.sa><Pine.LNX.4.61.0705011030220.18504@yvahk01.tjqt.qr>
	<006b01c78c1e$515f5c20$aa64a8c0@JOELDESKTOP>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <006b01c78c1e$515f5c20$aa64a8c0@JOELDESKTOP>
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
To: Joel Lindsay <joel@waveteq.com>, netfilter@lists.netfilter.org

I don't know why it complains about the --dport option. However, I don't
see how -i ath0 option is compatible with the OUTPUT chain.=20

Siva

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Joel Lindsay
Sent: Tuesday, May 01, 2007 11:27 AM
To: netfilter@lists.netfilter.org
Subject: Can't get --dport to work

Hi,

At one time I had this working.  I could match on the ports and deny
http=20
traffic from certain interfaces.

Now I get an error message and I am not sure what is causing it.  Can
anyone=20
help?

# iptables -A OUTPUT -i ath0 -p tcp --dport 80 -j ACCEPT
iptables v1.3.6-20061129: Unknown arg `--dport'
Try `iptables -h' or 'iptables --help' for more information.


Thanks,

Joel Lindsay, B.Eng
Project Engineer=20



