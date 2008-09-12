From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT Passthrough for MAC address
Date: Fri, 12 Sep 2008 12:53:39 -0500
Message-ID: <48CAACA3.9090508@riverviewtech.net>
References: <13c27d00809120825o1b7756afx608740fa4548ca11@mail.gmail.com> <13c27d00809120904o773c622fp8d35d720b3d47916@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <13c27d00809120904o773c622fp8d35d720b3d47916@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/12/08 11:04, Karthik V wrote:
> I would like to know if there is a way to perform NAT passthrough of
> MAC address.

I don't know if you will be able to do this will IPTables or not.  I 
think you will have much better luck looking at bridging, namely a 
bridging router.  You can bridge the traffic to / from the MAC(s) you 
want while still doing normal routing for the rest of your LAN.

> I have a OpenWRT router and would like to passthrough the MAC address
> of my LAN client on the WAN but retain NAT/Masquerading for other LAN
> entities in the same subnet.


Grant. . . .
