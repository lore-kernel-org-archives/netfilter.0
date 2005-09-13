From: yenganti pradeep <pradeepls143@yahoo.co.in>
Subject: How to find if there are any open streams
Date: Tue, 13 Sep 2005 10:42:36 +0100 (BST)
Message-ID: <20050913094236.43803.qmail@web8405.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-759863782-1126604556=:43525"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

--0-759863782-1126604556=:43525
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Id: 
Content-Disposition: inline

Note: forwarded message attached.



		
__________________________________________________________ 
Yahoo! India Matrimony: Find your partner now. Go to http://yahoo.shaadi.com
--0-759863782-1126604556=:43525
Content-Type: message/rfc822

X-Apparently-To: pradeepls143@yahoo.co.in via 202.43.219.156;
	Tue, 13 Sep 2005 12:06:42 +0530
X-Originating-IP: [209.132.176.167]
Return-Path: <linux-net-owner@vger.kernel.org>
Authentication-Results: mta117.mail.in.yahoo.com
	from=vger.kernel.org; domainkeys=fail (bad syntax)
Received: from 209.132.176.167  (EHLO vger.kernel.org) (209.132.176.167)
	by mta117.mail.in.yahoo.com with SMTP; Tue, 13 Sep 2005 12:06:42 +0530
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S932371AbVIMGgX (ORCPT <rfc822;pradeepls143@yahoo.co.in>);
	Tue, 13 Sep 2005 02:36:23 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org id S932372AbVIMGgX
	(ORCPT <rfc822;linux-net-outgoing>); Tue, 13 Sep 2005 02:36:23 -0400
Received: from web8402.mail.in.yahoo.com ([202.43.219.150]:43388 "HELO
	web8402.mail.in.yahoo.com") by vger.kernel.org with SMTP
	id S932371AbVIMGgW (ORCPT <rfc822;linux-net@vger.kernel.org>);
	Tue, 13 Sep 2005 02:36:22 -0400
Received: (qmail 75306 invoked by uid 60001); 13 Sep 2005 06:36:14 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.co.in;
	h=Message-ID:Received:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=FN7ehYHu+rRye6DZdNP9oKtmtmPn6BN6XN7YW/DmfnmjS1kYPQAHZyHE4xsZUaFEdnbJJ0T8CAvHhiOwiKgTXidVIeFiVdGjAFL4ZSViPCmBocv8gN2uQRTTYlpxs+5olOvG/rmvZ3r6vOocr364IONR9xgN9kjeGtBw30ywSpI=
	; 
Received: from [203.199.213.66] by web8402.mail.in.yahoo.com via HTTP;
	Tue, 13 Sep 2005 07:36:14 BST
Date: Tue, 13 Sep 2005 07:36:14 +0100 (BST)
From: yenganti pradeep <pradeepls143@yahoo.co.in>
Subject: How to find if there are any open streams
To: linux-net@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-net-owner@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-net@vger.kernel.org
Content-Length: 930

Hi All,
We are implementing a protocol for our small wireless
custom network. We have a few different subnets in our
network. So, when a node from one of these subnets
moves to a different subnet, we want the address to
time out. We arrived at this using dhcp, which
automatically times out. Our problem is that we should
not time out the previous address if there are any
open streams.
1.How could we know if there are any open streams? 
2.How to change the lease time at dhcp client on the
run so that it wouldnt timeout?
I'd be glad to find notes on this.
Thanks in advance.
regards,
pradeep 


		
__________________________________________________________ 
Yahoo! India Matrimony: Find your partner now. Go to http://yahoo.shaadi.com
-
To unsubscribe from this list: send the line "unsubscribe linux-net" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--0-759863782-1126604556=:43525--

