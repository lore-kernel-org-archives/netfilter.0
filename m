From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 16:48:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401231648.35117.Antony@Soft-Solutions.co.uk>
References: <400FC047.4010208@objeng.ch> <200401231609.30277.Antony@Soft-Solutions.co.uk> <40114E32.6030204@objeng.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40114E32.6030204@objeng.ch>
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

On Friday 23 January 2004 4:39 pm, Sven Burgener wrote:

> Antony Stone wrote:
> >
> > I still say however that if A and B do not have public IPs available to
> > hide behind, then they can't communicate with *anything* across the
> > Internet.
>
> Yes, I totally get you. Thing is, I am looking for a way to connect to
> some machine which may be hidden behind some NAT/Firewall etc. from a
> server which has a public address.
>
> So, the only solution that comes to mind is: That given ("hidden")
> machine initiates the connection to the public server/address (because
> it can). Next, this established session needs to be somehow
> used/'hijacked' to "get to" the 'hidden' server. Follow me? ;-)

Oh, right, yes.

In that case, netcat.

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


