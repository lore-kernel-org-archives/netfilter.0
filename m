From: Tom Eastep <teastep@shorewall.net>
Subject: Re: QoS using HTB and SFQ ...
Date: Thu, 12 Dec 2002 06:34:35 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <454880000.1039703675@wookie.shorewall.net>
References: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: raymondl@knowledgefactory.co.za, Netfilter Mailing List <netfilter@lists.netfilter.org>



--On Thursday, December 12, 2002 11:17:03 AM +0200 Raymond Leach 
<raymondl@knowledgefactory.co.za> wrote:

> Hi
>
> Does anyone have any experience (good or bad) with using htb and sfq to
> do QoS using 2.4.20 kernels?
>
> I compiled the kernel, installed the image, but tc tells me that htb is
> an unknown qdisc. I checked that I did select htb in the QoS section.
>

Works for me. Does the copy of tc that you are running have htb support?

-Tom
--
Tom Eastep   \ Shorewall - iptables made easy
Shoreline,    \ http://shorewall.sf.net
Washington USA \ teastep@shorewall.net


