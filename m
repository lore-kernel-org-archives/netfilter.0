From: Shirley Ong <soap6gal@gmail.com>
Subject: SNAT - matching original and natted IP addresses
Date: Fri, 15 Jan 2010 15:33:39 +0000
Message-ID: <1ef54a181001150733r5b688d27x3feaf7d4cc25128d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type;
        bh=GctsVctA9RFNVsPKm500wDr6FIoubEuFil+MR2J/a1Y=;
        b=tem3VldEW6xH+MxRHyBQaZMkr7k7Q+NSDyHnrDxHargY5pKjUMkh1YWZ7HANkpqicJ
         hoihcGmA21UbILI2+o363WY3O+jml+19wuMRsTDhQBkycpVkXiOVF4qM14SI6P1Bjn8e
         co6jsbB0YxQ+uMvPvW5K8dSrZV/HOYxeKWAv4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to map a range of private IP addresses to a range of public
IP addresses. For this, I'm using SNAT:

    # iptables -t nat -A POSTROUTING -s <private range> -d ! <private
range> -j SNAT --to-source <public range>

The public range is higher than private range. I can see from
conntrack that the last 2 octets of original and natted IP addresses
are always the same. Can I be sure that the mapping is always correct
without parsing conntrack from time to time because it's heavy
processing? Or is there any other way that I can make sure the mapping
is always correct?

Thanks.

Shirley
