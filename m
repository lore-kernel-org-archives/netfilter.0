From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: deny cgi scanner
Date: Wed, 2 Apr 2003 01:23:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030402012310.180c7aac.arnt@c2i.net>
References: <3E89CD8A.5020007@gmx.ch>
	<1049219263.4784.14.camel@elendil.intranet.cartel-securite.net>
	<3E89EBE5.5090804@gmx.ch>
	<20030401200652.GY18434@ns.snowman.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030401200652.GY18434@ns.snowman.net>
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

On Tue, 1 Apr 2003 15:06:52 -0500, 
Stephen Frost <sfrost@snowman.net> wrote in message 
<20030401200652.GY18434@ns.snowman.net>:

> 
> # Bad guy detected!  Add his IP to the badguy list!
> iptables -A BADCHAIN -m recent --set --name badguy -j DROP # Add IP to
> list

..this also shoots down the good guys with servers on dynamic dns, 
using an old recycled-by-the-isp bad guy's ip.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



