From: nakulgoud <nakulgoud@gmail.com>
Subject: Multihoming: Changing out device of the packet using a hook
Date: Tue, 23 Apr 2013 05:00:12 +0530
Message-ID: <5175C804.4020504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=aIMAiM0hK/RZLT7lA8TRcg2akofl7H1BMuuW8iwACv8=;
        b=I5QVeP9AWTAKTv8ViYg5Nt2lhCOIjwfRPPgyzl/02RFEricNM0r97pk6GmKHdkBzho
         x1MX8iMIGIVkLFuAeJZ4SffAv2YkEA8lgZM8LfCFfEla3yiDU56LcvxAl/T7KpKmUaTc
         TVjEm6q0VU1LebGO1vZO2yRFEjJbiJ2WrgyprqGwhvOvilqtf02rPvwuN8WWSgUZK+EJ
         xV3Kk2YQWW7njdciQ0L3/OGtaZ6oIKoRNeXLLM9k8V5HSVmRR9LDN46cQ0uCSGdjE/cL
         qbcRNbIvgq2FB11Go4NQhKrif/6ucvyLKvulFWrxc7XBTAHyqVgHxIo/p9Ie4xQpu4PO
         hamw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
   I want to change the out device of a packet using a hook. Please help 
me how can I do this?

   Thanks in anticipation.
