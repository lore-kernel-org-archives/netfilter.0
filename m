From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Use mode Netfiler
Date: Thu, 19 Feb 2004 11:38:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402191138.58241.Antony@Soft-Solutions.co.uk>
References: <D269C7CBDF116A48982D4DC51F111BE324D493@nsezhpmail01.india.ipolicynet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D269C7CBDF116A48982D4DC51F111BE324D493@nsezhpmail01.india.ipolicynet.com>
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

On Thursday 19 February 2004 11:10 am, Sood, Ashish wrote:

> Hi,
>
> I want to extend the netfilter to user mode.

Why?   Surely a usermode version would be (a) less efficient, with all the 
context switching involved, and (b) less secure, because the code is out in 
userland instead of protected inside kernelspace?

Efficiency and security seem both desirable qualities for a firewall.

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


