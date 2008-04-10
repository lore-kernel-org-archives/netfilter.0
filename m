From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: FTP connection without NAT
Date: Thu, 10 Apr 2008 09:16:50 +0800
Message-ID: <008801c89aa8$8e306a60$8119fea9@MingChing>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a firewall/router which is setup to do connection
tracking firewalling but does not do NAT. And I would like
to house an FTP server inside the firewalled  router.

The firewall is setup to do this :-

1. FORWARD rule policy is DROP.
2. Inside can ACCEPT NEW connection to go to outside.
3. ACCEPT established or related connections.
4. FORWARD tcp port 21 from outside to the
    inside FTP server is ACCEPT.

No PREROUTING DNAT and POSTROUTING SNAT,
since the box does not do NAT.

Will the connection tracking modules help in allowing
passive FTP session to get through to the FTP server ?

Any comments ?

