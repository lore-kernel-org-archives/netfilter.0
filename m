From: Moritz Gartenmeister <moritz.gartenmeister@access.unizh.ch>
Subject: Re: Iptables vs. Cisco PIX
Date: Wed, 13 Apr 2005 12:33:20 +0200
Message-ID: <425CF570.9080705@access.unizh.ch>
References: <3BEC0FC090F538409A0736B2D37DA0ED0246F656@icptex02.corp.icpt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3BEC0FC090F538409A0736B2D37DA0ED0246F656@icptex02.corp.icpt.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

hi

i'm using a pix at my border. i'm using it for NAT (as it is built for this) and for simple access 
control. behind the pix i run iptables for logging, shaping, filtering etc...

i would recommend cisco, if you need support, high avaibility, but no nice features.

if you need extra features as shaping, logging, scripting etc, then i would recommend iptables. you 
can do much more with iptables, but this brings up some problems (as compatibility, dependicies 
etc.), but if you are not happy with one feature, you can change it ;-)

cheers
moritz

