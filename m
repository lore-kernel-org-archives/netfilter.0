From: rodolphe <rodolphe.averty@oxance.com>
Subject: [Fwd: Re: two router connected to the internet]
Date: Tue, 31 May 2005 16:57:06 +0200
Message-ID: <429C7B42.6040401@oxance.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080208080603020309040003"
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------080208080603020309040003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

aren't there any problem with ftp using that. Do i need to add some 
iproute rules ?

because when i connect to some site i've got

No control connection for command: No such file or directory
Login failed.
No control connection for command: No such file or directory


--------------080208080603020309040003
Content-Type: message/rfc822; name="Re: two router connected to the internet"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="Re: two router connected to the internet"

X-Account-Key: account1
Return-Path: <netfilter-bounces@lists.netfilter.org>
Delivered-To: raverty@localhost.com.oxance.com
Received: from localhost (localhost.localdomain [127.0.0.1])
	by yanaon.com.oxance.com (Postfix) with ESMTP id 4C1A725C2F1
	for <raverty@localhost>; Tue, 31 May 2005 17:20:16 +0200 (CEST)
Received: from pop.oxance.com by localhost with POP3 (fetchmail-5.9.12)
	for raverty@localhost (single-drop);
	Tue, 31 May 2005 17:20:16 +0200 (CEST)
Received: from vishnu.netfilter.org (vishnu.netfilter.org [213.95.27.115])
	by paris117.amen.fr (8.10.2/8.10.2) with ESMTP id j4VEFnE24167
	for <rodolphe.averty@oxance.com>; Tue, 31 May 2005 16:15:49 +0200
Received: from localhost ([127.0.0.1] helo=vishnu.netfilter.org)
	by vishnu.netfilter.org with esmtp (Exim 4.41 #1 (Debian))
	id 1Dd7hE-0006V0-2T; Tue, 31 May 2005 16:26:20 +0200
Received: from smtp3.wanadoo.fr ([193.252.22.28])
	by vishnu.netfilter.org with esmtp (Exim 4.41 #1 (Debian))
	id 1Dd7h2-0006T0-Pa
	for <netfilter@lists.netfilter.org>; Tue, 31 May 2005 16:26:10 +0200
Received: from me-wanadoo.net (unknown [127.0.0.1])
	by mwinf0303.wanadoo.fr (SMTP Server) with ESMTP id 013911C003F2
	for <netfilter@lists.netfilter.org>;
	Tue, 31 May 2005 16:15:23 +0200 (CEST)
Received: from [10.0.2.147] (LNeuilly-152-21-5-60.w82-127.abo.wanadoo.fr
	[82.127.68.60])
	by mwinf0303.wanadoo.fr (SMTP Server) with ESMTP id C3CB61C003E5;
	Tue, 31 May 2005 16:15:22 +0200 (CEST)
X-ME-UUID: 20050531141522802.C3CB61C003E5@mwinf0303.wanadoo.fr
Message-ID: <429C717A.70801@oxance.com>
Date: Tue, 31 May 2005 16:15:22 +0200
From: rodolphe <rodolphe.averty@oxance.com>
User-Agent: Mozilla Thunderbird 1.0 (X11/20041206)
X-Accept-Language: fr, en
MIME-Version: 1.0
To: jengelh@linux01.gwdg.de
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.6 (--)
Cc: netfilter@lists.netfilter.org
Subject: Re: two router connected to the internet
X-BeenThere: netfilter@lists.netfilter.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: General discussion and user questions <netfilter.lists.netfilter.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
X-Virus-Status: No
X-Virus-Checker-Version: clamassassin 1.2.2 with clamdscan / ClamAV
	0.83/872/Mon May 9 09:56:06 2005
X-Spam-Checker-Version: SpamAssassin 2.64 (2004-01-11) on 
	yanaon.com.oxance.com
X-Spam-Level: 
X-Spam-Status: No, hits=0.0 required=5.0 tests=none autolearn=ham version=2.64

i try

ip route add default scope global nexthop via 10.0.2.200 weight 2 \
nexthop via 10.0.2.254  weight 1

and it seems to work

thank you very much Jan for help







--------------080208080603020309040003--


