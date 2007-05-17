From: "Mike C" <smith.not.western@gmail.com>
Subject: TCP RST vulnerability - handling question
Date: Thu, 17 May 2007 12:56:54 +1200
Message-ID: <bd0eabd0705161756q79024a91y74a132e34616c7fa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=imfas8ggOSMibQm407GXXKltqF0NRcsi6tUAofRvVkkN3LN3jByC5eWhtE7KhfBcFu1UgIqh5G01D2LHBXvarA1bzGnDyBu2BJcieSv+aNgtVvDMNTjkXqjsfrU9eZKXlZ+XnUnr6nJyqqEbTGKbeNwqbadwB/OJnOnsShFKW9A=
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

I am using an iptables 1.3.5 based setup and wonder if there are any
tools or techniques available to prevent or mitigate the TCP RST
spoofing issue (http://osvdb.org/displayvuln.php?osvdb_id=4030)

I see elsewhere there has been suggestions of only accepting the RST
if the sequence id is 1 more than the current, or providing some sort
of challenge response
(http://tools.ietf.org/html/draft-ietf-tcpm-tcpsecure-02#section-2.2).
I don't believe netfilter uses either of these, so I am interested in
hearing other peoples approaches to it.

Regards,

Mike

