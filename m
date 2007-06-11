From: "=?ISO-8859-1?Q?Martin_Schi=F8tz?=" <malinux@gmail.com>
Subject: iptables state transfer
Date: Mon, 11 Jun 2007 12:55:11 +0200
Message-ID: <e208f5d10706110355o42796f61va19167b7ac2282b6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=DM/UUoT/2PAviy1TtOf+FD7yvOqXs2NQIFrS2/fAOPsp++kqOqAbcGD7eDB44YCT/8G5iB2Xm2GV1y6yuzUAnevMrHoBfAwPf9+ZolWREaYhHpQ7R77DpYwS98TTItMyOz7PpoROnqvndwZea2Psz8lq/dSxvYgx9NWJA0UsbqU=
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

Hi

Can iptables do state transfer between two firewalls for failover
purpose. Something like PF sync with PF in BSD.

I want to do NAT with failover.

Best regards,
Martin

