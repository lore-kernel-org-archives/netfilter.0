From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: FTP connection without NAT
Date: Thu, 10 Apr 2008 07:45:14 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804100744410.8765@fbirervta.pbzchgretzou.qr>
References: <008801c89aa8$8e306a60$8119fea9@MingChing>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <008801c89aa8$8e306a60$8119fea9@MingChing>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@vger.kernel.org


On Thursday 2008-04-10 03:16, Ming-Ching Tiew wrote:
>
>1. FORWARD rule policy is DROP.
>2. Inside can ACCEPT NEW connection to go to outside.
>3. ACCEPT established or related connections.
>4. FORWARD tcp port 21 from outside to the
>    inside FTP server is ACCEPT.
>
>Will the connection tracking modules help in allowing
>passive FTP session to get through to the FTP server ?

Make sure nf_conntrack_ftp is loaded so that RELATED can do its job.
