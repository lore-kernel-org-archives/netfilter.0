From: Pete Kay <petedao@gmail.com>
Subject: ip_conntrack_acct
Date: Thu, 28 Oct 2010 20:43:41 +0800
Message-ID: <AANLkTinxk3yjONqZZ8mvuO+Qcm6Kt4NEs_NTJY9HOvxO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=1k+T65fW1BIHt9BPH7mx/uaFLwju73Krsss73pnT2hE=;
        b=EKm0gk+QT2cdleRpfxqBjdJyi7/NT8Zid0uDivtUYef8GbpGESKQpk2CFj/wnznRVa
         6EjJaEYgmJzeebCYWM6n1BwWRyWQTDrMEfy7Bz/lq3LfqXqWddjPyFRbrOkVDQtYEXVV
         9h+CiwQBWZKgxkDxYgd6U5iSG2W4uS5VdsxFE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I would like to use L7 to configure packet inspection rules and then
ip_conntrack_acct to perform accounting.  I am looking to track each
and every connection and log the type of packet ( whether it is
HTTP/SIP/RTP).  Is it possible to do that using ip_conntrack_acct?
How can I specify the packet type with ip_conntrack_acct?

Is this the right approach or is there a better solution?

Thanks,
Pete
