From: Sven Burgener <sburgener@objeng.ch>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 17:39:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40114E32.6030204@objeng.ch>
References: <400FC047.4010208@objeng.ch> <4010F62A.7090403@objeng.ch> <1079.12.75.166.26.1074864825.squirrel@nmibwkrf1.nexusmgmt.com> <200401231609.30277.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401231609.30277.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> They may not require *dedicated* public IP addresses, but there still have to 
> *be* public IP addresses available at ends A and B of the links, otherwise X 
> cannot send reply packets back to them.
> 
> So long as A and B have public IPs which they can NAT behind, then there's no 
> problem - they can either communicate directly, or if you want to channel the 
> link via some other server X on the Internet you could do that easily enough 
> with a couple of SSH tunnels back to back.   Given public IPs all sorts of 
> opportunities come to mind.
> 
> I still say however that if A and B do not have public IPs available to hide 
> behind, then they can't communicate with *anything* across the Internet.

Yes, I totally get you. Thing is, I am looking for a way to connect to 
some machine which may be hidden behind some NAT/Firewall etc. from a 
server which has a public address.

So, the only solution that comes to mind is: That given ("hidden") 
machine initiates the connection to the public server/address (because 
it can). Next, this established session needs to be somehow 
used/'hijacked' to "get to" the 'hidden' server. Follow me? ;-)

Cheers
Sven

