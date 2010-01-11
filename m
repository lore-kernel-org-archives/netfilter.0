From: Lars Nooden <lars.curator@gmail.com>
Subject: REJECT as a default policy
Date: Mon, 11 Jan 2010 14:02:01 +0200
Message-ID: <4B4B1339.1040502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:openpgp
         :content-type:content-transfer-encoding;
        bh=Z4vyzA+ZmsjBVLUZdXnVNB7DhymhrNNsw+wyZD2LWME=;
        b=v/iJEJbQwhwmkRTHst0ggyo1CWCYs22Tam9356PP7uMV0uY+cfXauLfS057AjUPaBW
         dCpzBbHDqgfdlNs/oeZkgQtrtsdWKeGCQJ1uoUtiDbr9cbFHo1vPMRxUE4lEOTMw5ZRB
         8Z0zWCJLTc69YgCNvNOjTwOH7LOnG9igibzzA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'd like to add the ability to use the REJECT target as a default policy
to the netfilter / iptables wishlist.

Using REJECT as a default is currently possible as a kludge a few steps
would be saved by allowing it as a default policy.  Perhaps that might
even speed up some filtering in some cases.

A good (IMHO) discussion of DROP vs REJECT has been written by Peter Benie :
	http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject


Regards,
/Lars
