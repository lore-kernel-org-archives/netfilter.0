From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TWO ROUTING
Date: Thu, 20 Nov 2003 22:34:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311202234.hAKMYY723743@onyx.rockstone.co.uk>
References: <09B04A55822EFF4DA48D2E0BB2941D4A28AD45@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A28AD45@wardrive.citadelcomputer.com.au>
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

On Thursday 20 November 2003 9:44 pm, George Vieira wrote:

> He is asking what has been asked alot lately which is how to make a machine
> respond to both internet links via it's appropriate IP addresses.
>
> So when a client accesses the machine via ww.xx.yy.zz, the firewall
> responds back via that IP/ether, if a different client accesses it via the
> aa.bb.cc.dd address, it responds back via that address/ether.
>
> There was talk before about using CONNTRACK and marking packets on the list
> before.. I think this is the solution but I didn't see a successful
> response..

You can MARK packets on their way through netfilter, and do various 
interesting and possibly useful things to the packet on the basis of the mark 
which was assigned, however I do not think there is any way of identifying 
the packets which come in later as replies to these, and thereby doing 
anything based on the mark which was assigned to the first packet on its way 
through.

Antony.

-- 

This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.

