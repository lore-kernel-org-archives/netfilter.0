From: "Stephan Higuti" <higuti.sam@gmail.com>
Subject: IPtables l7 string
Date: Thu, 12 Apr 2007 01:39:53 -0300
Message-ID: <3da957060704112139i476fcbc1q1d22c698e538514a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=gdz+Fk66IBL3RG5FfrdSUsvXydgoQqBJpAac0J40RO0grLwL9038r3Ld/L2kMDWzikkI96zWopNy23RonurhRiRDF3nsw8SldGBtwZM7ndRAZvcVE7mrjvzVB5Xkzef11NHCw6rRgyr3rniy8WAheIQF7FUF/5TakzZ2BekUqRQ=
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

Hello, anybody can help me with this:

osiris:~# iptables -t filter -A FORWARD -m string --string "orkut" -j DROP
iptables v1.3.4: STRING match: You must specify `--algo'
Try `iptables -h' or 'iptables --help' for more information.

--algo?

What's?

Best Regards

Stephan

-- 
---------------------------------------------------------------------
Stephan Higuti
MSN: higutisam@hotmail.com
Email: higuti.sam@gmail.com
---------------------------------------------------------------------

