From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Routing the DNS Traffic via specific interface.
Date: Wed, 25 Jan 2012 10:00:13 -0800
Message-ID: <4F20432D.9050507@hp.com>
References: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netravali Ganesh <gnetravali@sonusnet.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 01/24/2012 11:41 PM, Netravali Ganesh wrote:
> Hi ..
>
> I have 2 interfaces eth0 and eth1 on the system connected to
> different subnets. I need to route all the outgoing DNS traffic of
> the system via eth1 interface. Pls let me know if below IPTABLES
> rules is proper way ?

Are the IPs of the DNS servers known and reasonably static?  And is 
there any concern if other traffic to those IPs goes out the one 
interface?  If the DNS server IPs are static, and it wouldn't hurt to 
have other traffic go out the same interface, why not just create some 
static host routes?

rick jones
