From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Newbie Question - Redirect traffic to internal Web server
Date: Thu, 17 Oct 2002 22:27:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021017212717.VXCL292.mta03-svc.ntlworld.com@there>
References: <000401c27622$cb705ee0$3864a8c0@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c27622$cb705ee0$3864a8c0@discmail.com>
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

On Thursday 17 October 2002 10:18 pm, Aldo S. Lagana wrote:

> Antony, I am not very familiar with the use of SNAT for incoming web
> connections; I use DNAT for my web servers.  Is there any difference?

They are totally different, and I made a mistake in my suggested rule.

SNAT means Source Network Address Translation.

DNAT means Destination Network Address Translation.

SNAT changes the Source IP Address of packets; DNAT changes the Destination 
IP Address.

You need to use the correct one depending on whether you want to change the 
source address (ie where the reply is going to come back to) or the 
destination address (ie where this packet itself is going).

If I understood your original question correctly, you want to change packets 
coming in from the Internet to the external IP address of your firewall and 
send them instead to your internal web server ?

If that is correct, you need to change the destination address of the 
incoming packets so that instead of stopping on your firewall, they get 
passed on to your internal web server, hence you need to use a DNAT rule.   
Simply change the S for a D in the rule I posted earlier and it will be 
correct :-)

Antony.

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

