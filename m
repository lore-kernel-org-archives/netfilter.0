From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: forward/proxy/something one external IP to an other
Date: Fri, 26 Sep 2008 13:42:52 -0500
Message-ID: <48DD2D2C.8030202@riverviewtech.net>
References: <CD6321314686A64C90A1F5870AAD3D5201566663@MAIL031.mail.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CD6321314686A64C90A1F5870AAD3D5201566663@MAIL031.mail.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/26/08 11:50, Jan Agermose wrote:
> we are going to move some servers from one datacenter to an other and 
> not all DNS are under our direct control so Im want to place a linux 
> box in the old center to forward trafic for the old IPs to the new 
> IPs - or Im hoping this is possible :) So that traffic going to the 
> old IPs will still work until all DNS is updated.

Ok...

> The servers are on a NAT 1-1 network and are moved to a new 1-1 NAT 
> network - if this matters?

Should not matter.

> Can someone explain if its possible and how to do it?

Yes it is possible.  You will need to DNAT the traffic as it comes in to 
the nat:PREROUTING chain to redirect it over to the real server as well 
as SNAT the traffic as it leaves the nat:POSTROUTING chain so that the 
traffic appears to the real server as if it is coming from the NATing 
server.  By making the traffic appear as being from the NATing server 
the real server will reply back to the NATing server which can then 
unNAT the traffic and reply directly back to the real client.

Or, you could run something like rinetd which will accept the 
connections and then proxy them to the real server.  This is extremely 
easy to set up too.



Grant. . . .
