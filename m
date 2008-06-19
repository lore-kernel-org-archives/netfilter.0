From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: How to SNAT in PREROUTING table for local machine
Date: Thu, 19 Jun 2008 12:00:15 -0500
Message-ID: <485A909F.1080808@riverviewtech.net>
References: <004a01c8d204$fb1022e0$1402a8c0@nemesisk7>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004a01c8d204$fb1022e0$1402a8c0@nemesisk7>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/19/08 07:06, Tobias Krummen wrote:
> So, is there a way to change the source ip-address of incoming packets 
> with the given possibilities of netfilter, or are there other tools to 
> get this done?

You might look in to trying to use bridging.  Bridge the VPN 
interface(s) and bind your service to the bridge interface.  This would 
allow you to use EBTables to alter traffic as it comes in to the system.

Another option would be to use some sort of proxy application (like 
rinetd or socat) to accept the connections and then proxy them in to 
your service.  Your service would see all the connections as coming from 
the rinetd daemon's IP but at least all your /8 systems would be able to 
connect to the service.



Grant. . . .
