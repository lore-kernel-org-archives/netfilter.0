From: "Timur Alperovich" <timur.alperovich@gmail.com>
Subject: ROUTE target
Date: Thu, 7 Feb 2008 19:18:58 -0500
Message-ID: <52950c3f0802071618yb755744l6936484d08482b93@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=3iFnH00+fnNEwvWZ94jxVXQFYY9vDlJoC/m4tBLQ58k=;
        b=DpihRaGm+N6az9SN9X2PMud2FhROz0iVdYHcMLus/WNCC9XOxua9Ax3sIRpngi2wQdziGFSCLlCKCz31bzC/e4jJks2/+uctrkn4XJSnJFtG9cIYBXpHRDy1xJFRCTNzswEZ3adZGZSFDMddHrtTF94YvuHtDJ+HvBFtrPoNUS8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I noticed there was a patch to add the ROUTE target and mangle the
interface used by the packets. I was looking through patch-o-matic-ng
and couldn't find it. I presume because it's not supported anymore.
What is a way to accomplish similar results with netfilter? For
instance, if someone could give me an example of how to force all ICMP
packets through eth0, that would be great.

Thank you,
Timur
