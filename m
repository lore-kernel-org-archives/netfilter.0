From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Connection Protocol in the state?
Date: Thu, 25 Sep 2008 10:39:19 +0200
Message-ID: <200809251039.20056.christoph.paasch@gmail.com>
Reply-To: Christoph Paasch <christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :content-disposition:message-id;
        bh=QPYs/sP5vlrw1LXFYdFrsKIKPy7IOfgCaWFKxDRoNqw=;
        b=sg59BdzK12+lq5vowZShYXWvBUgFmODJKDTdI+KLj7fePATNz7Fm8k1bWo3YIlBhRK
         5fvOtrnTttvjmzpgd0Ocv+aX/5lqp8RU8hHJFNZIZvNcBWLUNYOC/lx27vyMPOapgT2i
         7f2LheXSsfjgOhoO2I3KMxTPZ+QLSneI3N9a0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

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
www.rollerbulls.be
--

