From: "pankaj jain" <jainp1979@gmail.com>
Subject: Packet reaching POST-ROUTING but not going out
Date: Mon, 9 Jul 2007 16:45:13 +0530
Message-ID: <d41814cf0707090415p51ac0743q5628a53212d27cf6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=otJ9Fx4m3xArt1hQk9MVwBaxckPccRjwaPQS0Jnxuas0NdxkarmvaHQ7mBLOp4i05xp1XGmk5pWLYxe4PGPDQKTZAQG7ZFk++8QAdNseJjZdSH4EKUkJx2k3H0tDNUClgpnvy1lt1zZ/fuyIxomvy1CaHIJ5lXuLgta4T0VJ/dE=
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
I have SNAT rule to change source ip for outgoing packets. My ping
packets seems to be matching SNAT rule but they don't show up in
ethereal traces at both ends.

eth0      -> 127.0.33.3

eth0:1   -> 169.254.1.1



SNAT Rule: To convert source from 169.254.1.1 to 172.16.45.200

DNAT Rule: To convert destination 172.16.45.200 to 169.254.1.1

There are arptables rules also to responds arp of 172.16.45.200

Any clue?



-- 
Thanks
Pankaj Jain

