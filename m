From: "Franck" <franck@apoal.com>
Subject: RE : QoS using HTB and SFQ ...
Date: Thu, 12 Dec 2002 12:06:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003e01c2a1ce$800f0c80$29a2a8c0@dev.gcf.fr>
References: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
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
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Raymond Leach
> Sent: Thursday, December 12, 2002 10:17 AM
> To: Netfilter Mailing List
> Subject: QoS using HTB and SFQ ...
> 
> 
> Hi
> 
> Does anyone have any experience (good or bad) with using htb 
> and sfq to
> do QoS using 2.4.20 kernels?
> 
> I compiled the kernel, installed the image, but tc tells me 
> that htb is
> an unknown qdisc. 

You'll also need a patched tc in order to use HTB. You can find the
patch for tc at http://luxik.cdi.cz/~devik/qos/htb/


