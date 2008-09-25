From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Connection Protocol in the state?
Date: Thu, 25 Sep 2008 13:35:58 +0200
Message-ID: <200809251335.58738.christoph.paasch@gmail.com>
Reply-To: Christoph Paasch <christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :content-disposition:message-id;
        bh=s0jk4O5Il7PbqBALPXHZbwtMg4QDtAB3Cq4knfkYQEE=;
        b=q7Ob5nzUgmIjSaKGqsiHa7CsEcBNF+ZTuABEpTpPl6043mUwcVUOz5r0rCbiUsE6aM
         WecabvMK7g8kVvOqxUPF0hu4rfqSmz0uRSYO5ARgwi7q2vwJ9OuLIWDM7KZ1EXvdZ3zZ
         h0eEhfGe3TJaOk8Yz5fM0TgREy5n9uPsZg1uM=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I would like to know, that if I have a filter like the one shown below 
(allowing outgoing connections of every protocol-type), does netfilter stores 
in the state of the established outgoing connection also the protocol which 
established the connection? (TCP, UDP, ....) Or does it opens the connection 
for any protocol?

iptables -A FORWARD -i eth0 --ctstate NEW, RELATED, ESTABLISHED -j ACCEPT


Thanks in advance

-- 
Christoph Paasch
--
