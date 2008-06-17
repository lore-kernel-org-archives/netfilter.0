From: "Len Gross" <sandiegobiker@gmail.com>
Subject: Want to "plug in" a link-level protocol into IP stack
Date: Mon, 16 Jun 2008 20:03:39 -0700
Message-ID: <27cb3ada0806162003l3f8d4ee0y7db0306ddb1de9e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=cbLyrIZ7jKOfsEObuR0mRbi7RcwUy2lglWBEddT7Dm0=;
        b=ItLb8M1dZQPDEXqqBihzoGQiRELwcnHZfOBT+PHN/t1M+gqZ+Wi+3q75Xcy+AIFad0
         fhzUblsoGs4qBXPOYbnls+uhZQ2t0g6FM85Qrpdb5+4Zeh+guyXm7XGPCwDiuxpnjnAA
         qsALNDgOme8kt5msMfRJeTiQWxVfkZM8QO33w=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have used FreeBSD's Netgraph to successfully develop a unique link-level
protocol.  I would like to do a similar thing in Linux and would like to do
the initial implementation in userland.  I use Ethernet packets on a
LAN and embed
the protocol inside them.  I have to modify outgoing packets and strip out
header/trailers from incoming packets.  IP frames need to be passed-up
the stack.

Would Netfilter be the best way to approach this? If not, what other
LINUX tools make sense\?

Thanks in advance for any suggestions.

-- Len
