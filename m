From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: QoS using HTB and SFQ ...
Date: Thu, 12 Dec 2002 11:58:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF86BDD.2090505@istitutocolli.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

you need a patch for iproute2/tc or a patched tc binary, both 
distributed with htb3.

here you'll find patch or binary:
http://luxik.cdi.cz/~devik/qos/htb/v3/htb3.6-020525.tgz

my experience with htb is very positive: i'm shaping a poor adsl 
connection (128/256). with heavy loads (220kbit download with a 120kbit 
upload) latency dropped from 3000ms to 300ms!

andrea

Raymond Leach wrote:
> Hi
> 
> Does anyone have any experience (good or bad) with using htb and sfq to
> do QoS using 2.4.20 kernels?
> 
> I compiled the kernel, installed the image, but tc tells me that htb is
> an unknown qdisc. I checked that I did select htb in the QoS section.
> 
> Any ideas?
> 
> Ray


