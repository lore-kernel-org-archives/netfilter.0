From: Sebastian Zander <zander@fokus.gmd.de>
Subject: Re: RTP traffic matching
Date: Thu, 17 Oct 2002 17:21:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DAED55D.9010901@fokus.gmd.de>
References: <032f01c275cb$0c7c9fa0$9f24a58b@segi.ulg.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Francois Dessart <fd-list@ibelgique.com>
Cc: netfilter@lists.netfilter.org

Francois Dessart wrote:

> Hello,
> 
> Is there an easy way to match RTP/UDP traffic?
> 


Hi Francois,

Once upon a time I wrote a module for RTP. Its not up to date with

netfilter and somewhat experimental but you can try it:
http://www.fokus.gmd.de/research/cc/glone/employees/sebastian.zander/private/netfilter-rtp-patch.tgz

Cheers,

Sebastian

-- 
Sebastian Zander                         E-mail: zander@fokus.fhg.de
FhI FOKUS / Global Networking (GloNe)    Tel: +49-30-3463-7287
Kaiserin-Augusta-Allee 31                Fax: +49-30-3463-8287
D-10589 Berlin, Germany                  www.fokus.fhg.de/usr/sebastian.zander




