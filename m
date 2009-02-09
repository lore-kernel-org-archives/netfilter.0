From: Ralf <rm@amitrader.com>
Subject: Error when adding an entry to mangle/PREROUTING
Date: Mon, 09 Feb 2009 21:08:20 +0100
Message-ID: <gmq2gg$g63$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The following command brings an error ("iptables: Invalid argument"):

   $IPTABLES -t mangle -A PREROUTING -p tcp --dport 9999 -j REJECT

What's wrong here?

