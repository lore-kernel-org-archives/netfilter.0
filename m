From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: LAN accessing DMZ
Date: Sun, 18 Jul 2004 12:24:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040718162409.GA30107@tranquility.scriptkitchen.com>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181610.52327.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407181610.52327.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

On Sun, Jul 18, 2004 at 04:10:51PM +0100, Antony Stone wrote:
> You are missing either a "-s" source address or "-i" input interface 
> specification for the rule allowing access to the DMZ machine, or else you 

Which rule are you referring to exactly?

> are missing either a "-d" destination address or "-o" output interface 
> specification for the rules allowing access from the LAN.

Can you tell me something more specific. I am still unable to figure that
if I have dropped all connections to outside, DMZ which is outside for the 
LAN how can connections be allowed for it?
Do you want me to post the entire firewall file somwhere on net?

Waiting eagerly for the reply.
With warm regards,
-Payal

