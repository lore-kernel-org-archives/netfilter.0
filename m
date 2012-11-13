From: Don bham <defestdude@gmail.com>
Subject: Re: Compiling =?utf-8?b?bGlibmV0ZmlsdGVyX3F1ZXVlLTEuMC4y?=
Date: Tue, 13 Nov 2012 17:58:24 +0000 (UTC)
Message-ID: <loom.20121113T185650-311@post.gmane.org>
References: <508A7252.80202@sterenborg.info> <alpine.LNX.2.01.1210261455090.2774@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

 I have seen this before - it is a bug in CentOS's glibc.
 Commit id of the fix is (glibc.git) 15bac72bac03faeb3b725b1d208c62160f0c3ad7.
 --
 To unsubscribe from this list: send the line "unsubscribe netfilter" in
 the body of a message to majordomo <at> vger.kernel.org
 More majordomo info at  http://vger.kernel.org/majordomo-info.html
 
 

How do i implement this fix please?


