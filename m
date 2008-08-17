From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: VPN (interface) access for and all traffic through from single
 user -- how to do it?
Date: Sat, 16 Aug 2008 23:31:33 -0500
Message-ID: <48A7A9A5.3040403@riverviewtech.net>
References: <200808151255.44987.janklodvan@gmail.com> <200808152212.59882.janklodvan@gmail.com> <48A5F9E2.5080206@riverviewtech.net> <200808162347.55392.janklodvan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200808162347.55392.janklodvan@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/16/2008 3:47 PM, Jan Klod wrote:
> Is it considerable to be a proof, that pptp VPN tunnel is working, if 
> I can ping -i ppp0 <remote VPN address>?

If the address is on the inside of the VPN or on the LAN on the other 
end of the VPN, most likely.

> Looking for solutions,

Please reset everything to the way it was before trying things suggested 
(restart your network or reboot should do it).

Please provide the output of "ifconfig" and "route -n" after bring up 
the VPN and being able to ping like above.  I'll then try to provide 
example commands at that point to do what you are wanting.



Grant. . . .
