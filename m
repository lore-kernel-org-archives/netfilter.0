From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Tips for script
Date: Thu, 5 Aug 2004 13:17:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408051317.49646.gdh@acentral.co.uk>
References: <4111799E.5060607@list.idg.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4111799E.5060607@list.idg.dk>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 05 August 2004 01:04, Jacob Friis Larsen wrote:
> Would this script work like this:
> - Allow all outgoing.
> - Allow all to port 80, 21, 22, 25, 143

Yes. Be aware that it will only affect packets coming from or going into that 
actual machine - it will completely forbird any 'forward' traffic to other 
hosts on the network going through that box. 

> echo 1 > /proc/sys/net/ipv4/ip_forward

This line is redundant, since setting the default policy in the FORWARD table 
to be DROP will not permit any packets to be forwarded.

If this is what you want, I'd just leave /proc/sys/net/ipv4/ip_forward set to 
zero :)

gdh

