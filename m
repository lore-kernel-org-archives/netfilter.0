From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 11:21:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7F0B2E.3050501@fugmann.dhs.org>
References: <Pine.LNX.4.33.0209091917581.31845-100000@panda.center-f1.ru> <3D7EFBCF.70406@fugmann.dhs.org> <00a601c259ee$57f815c0$6500a8c0@systemsadmin>
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
To: "Joe de Vera Jr." <jhoedv@we-amuse.com>
Cc: netfilter@lists.netfilter.org

Joe de Vera Jr. wrote:
> hello fellas,
> 
> can i make use of the iptables scripting to disable the access pages... for
> example for code red it access /default.ida page while in nimda /root.exe
> and cmd.exe
To some extention yes. You should use the 'string' match and patch your 
kernel to support it, but it may not work in all cases.
The best way to stop it is to configure your webserver to disallow any 
requests  with the specified string. The webserver knows of the http 
protocol, iptables does not.

-- 
Author of FIAIF
FIAIF is an Intelligen/Iptables Firewall
http://fiaif.fugmann.dhs.org


