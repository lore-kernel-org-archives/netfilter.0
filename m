From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Feature Requres for conntrack-tools
Date: Fri, 13 Jan 2012 21:28:26 +0100
Message-ID: <20120113202826.GA23871@1984>
References: <201201101335.20010.michael@niehren.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201201101335.20010.michael@niehren.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Niehren <michael@niehren.de>
Cc: netfilter@vger.kernel.org

On Tue, Jan 10, 2012 at 01:35:19PM +0100, Michael Niehren wrote:
> Hi,
> 
> i have the problem to delete all conntrack-entries sourced from an internal network,
> let's say 192.168.70.0/24. As i can see, the conntrack-tool currently does only support 
> single ip adresses. So currently i have to check for conntrack-entries for each single ip 
> adress within the network.
> 
> So my request was to extend the -s switch to networks. Is that possible ?

This should be easy to get it done.

I will be happy to take a patch for this.
