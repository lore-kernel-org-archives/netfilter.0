From: "John H. Spicer" <jhs@edg.com>
Subject: Re: Problem using fwmark -- how to mark packets from local host?
Date: Wed, 03 Mar 2004 17:43:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40465F74.8070609@edg.com>
References: <7C9884991ADAE0479C14F10C858BCDF56791BB@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF56791BB@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

Daniel Chemko wrote:
> Use the OUTPUT chain instead of the PREROUTING chain for packets
> originating from the local system.
> 
> 
>>Is there a way to mark packets originating on the local system?
> 
> 
> 

Thanks.  I tried that, but it did not seem to have any effect.  The command I 
used was:

iptables -t mangle -A OUTPUT -j MARK --set-mark 0x0a -p tcp --dport 25

Now, when connecting from the localhost, I get:

telnet: connect to address 66.33.196.49: No route to host

I can still connect via the NAT'd systems okay.

Thanks for the assistance!

John.

