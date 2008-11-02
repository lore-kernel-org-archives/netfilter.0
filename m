From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Single-NIC Traffic Shaping
Date: Sun, 02 Nov 2008 10:46:40 -0800
Message-ID: <490DF590.3010507@amfes.com>
References: <490DDA76.5030600@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490DDA76.5030600@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Daniel L. Miller wrote:
> I am trying - unsuccessfully - to implement traffic shaping using a 
> single NIC.  Using a single-NIC (multi-address) gateway/router, I am 
> trying to impose some bandwidth controls ala ctshaper/wondershaper.  
> But the standard traffic control done by these scripts is quite poor 
> for a single-nic environment.  Is it possible to filter by both IP and 
> fwmark?
Since tc acts on an interface basis - can I perhaps setup a bridge with 
a single interface in it?  So address the physical interface eth0 for my 
LAN, set the bridge for the Internet modem, and then use tc on the 
bridge but not on the ethernet interface?
-- 
Daniel
