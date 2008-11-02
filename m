From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Single-NIC Traffic Shaping
Date: Sun, 02 Nov 2008 08:51:02 -0800
Message-ID: <490DDA76.5030600@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying - unsuccessfully - to implement traffic shaping using a 
single NIC.  Using a single-NIC (multi-address) gateway/router, I am 
trying to impose some bandwidth controls ala ctshaper/wondershaper.  But 
the standard traffic control done by these scripts is quite poor for a 
single-nic environment.  Is it possible to filter by both IP and fwmark?
-- 
Daniel
